package pack.food.controller.seul;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.food.model.seul.MemberDto;
import pack.food.model.seul.MenuDto;
import pack.food.model.seul.SurveyClass;
import pack.food.model.seul.SurveyDaoInter;


@Controller
public class SurveyController {

	@Autowired
	private SurveyDaoInter daoInter;
	
	private SurveyClass survey = new SurveyClass();

	@RequestMapping(value = "survey", method = RequestMethod.GET)
	public ModelAndView submitSurvey(HttpSession session, SurveyBean bean) {
		session.setAttribute("survey",bean);
		
		double saveBmi = survey.saveBmi(bean.getWeight(), bean.getHeight()); //BMI 구하기
		System.out.println("bmi구하기 " + saveBmi);
		String choiceBmi = survey.choiceBmi(saveBmi); // BMI 에 따른 비만도판단
		System.out.println("bmi결과2 : "+ choiceBmi);
		
		double saveBmr = survey.saveBmr(bean.getWeight(),bean.getHeight(),bean.getAge(), bean.getGen()); // 기초대사량 구하기 
		double standardKg = survey.standardWeight(bean.getHeight(), bean.getGen()); // 표준체중구하기
		double choiceAct = survey.choiceAct(bean.getActive(), choiceBmi); // 활동량에 따른 계산연량 얻기
		double needKcal = survey.needKcal(standardKg, choiceAct); // 자신 키에 맞는 평균 무게에 의거한 하루 필요 칼로리
		double purposeTan = survey.purposeTan(needKcal); // 하루필요칼로리에 의해 산정한 탄수화물량
		double purposeJi = survey.purposeJi(needKcal);// 하루필요칼로리에 의해 산정한 지방량
		double needProtein = survey.needProtein(standardKg); // 평균무게에 의거한 하루 필요 단백질량 
		double recommendKcal = survey.recommendKcal(saveBmr, needKcal, choiceBmi); // 비만도에 맞는 추천 칼로리
		double recommendJi = survey.needJi(recommendKcal); // 비만도에 맞게 추천한 하루 필요 탄수화물
		double recommendTan = survey.needTan(recommendKcal);// 비만도에 맞게 추천한 하루 필요 지방량
		
		ArrayList<MenuDto> dto1 = null;
		String kcal =  String.valueOf((int)recommendKcal/3) ;
		String dan = String.valueOf((int)needProtein/3);
		String tan = String.valueOf((int)purposeTan/3);
		String gi = String.valueOf((int)purposeJi/3);
				
		//목적에만 맞는 메뉴 추천
		if(bean.getPurpose().equals("체중감량") || bean.getPurpose().equals("체중증량")) {
			dto1 = (ArrayList<MenuDto>) daoInter.getPurposeMenu1Inter(kcal);
		 }else if(bean.getPurpose().equals("채식")) {
			dto1 = (ArrayList<MenuDto>)daoInter.getPurposeMenu2Inter();
		 }else if(bean.getPurpose().equals("고단백식")) {
			 dto1 = (ArrayList<MenuDto>)daoInter.getPurposeMenu3Inter(dan);
		 }else if(bean.getPurpose().equals("저탄수화물식")) {
			 dto1 = (ArrayList<MenuDto>)daoInter.getPurposeMenu4Inter(tan);
		 }else if(bean.getPurpose().equals("저지방식")) {
			 dto1 = (ArrayList<MenuDto>)daoInter.getPurposeMenu5Inter(gi);
		 }else {
			 dto1 = (ArrayList<MenuDto>)daoInter.getPurposeMenu6Inter();
		 }

		//우리가 직접 추천하는 메뉴 ... 1
		MenuBean menuBean = new MenuBean();
		menuBean.setTan(String.valueOf((int)recommendTan));
		menuBean.setGi(String.valueOf((int)recommendJi));
		menuBean.setKcal(kcal);
		menuBean.setHate1("%"+bean.getHate1()+"%");
		menuBean.setDan(dan);
		
//		System.out.println("탄수화물:"+ tan);
//		System.out.println("지방 :"+ gi);
//		System.out.println("추천열량:"+ kcal);
//		System.out.println(bean.getHate1());
//		System.out.println("단백질:"+ dan);
		
		
		ArrayList<MenuDto> dto2 = (ArrayList<MenuDto>)daoInter.getRecommendMenuInter(menuBean);
		System.out.println("사이즈" + dto2.size());
		session.setAttribute("random", (int)(Math.random()*dto2.size()+1));
		session.setAttribute("random2", (int)(Math.random()*dto1.size()+1));
		session.setAttribute("size", dto2.size());
		ModelAndView view = new ModelAndView("viewMenu");
		view.addObject("dto1", dto1);
		view.addObject("dto2", dto2);
		return view;
	}
	
	@RequestMapping(value = "survey", method = RequestMethod.POST)
	public ModelAndView submitSurvey2(@RequestParam("id") String id,HttpSession session) {
		MemberDto dto = daoInter.getMemberInter(id);
		session.setAttribute("survey", dto);
		double saveBmi = survey.saveBmi(dto.getWeight(), dto.getHeight()); //BMI 구하기
		String choiceBmi = survey.choiceBmi(saveBmi); // BMI 에 따른 비만도판단
		double saveBmr = survey.saveBmr(dto.getWeight(),dto.getHeight(),dto.getAge(), dto.getGen()); // 기초대사량 구하기 
		double standardKg = survey.standardWeight(dto.getHeight(), dto.getGen()); // 표준체중구하기
		double choiceAct = survey.choiceAct(dto.getActive(), choiceBmi); // 활동량에 따른 계산연량 얻기
		double needKcal = survey.needKcal(standardKg, choiceAct); // 자신 키에 맞는 평균 무게에 의거한 하루 필요 칼로리
		double purposeTan = survey.purposeTan(needKcal); // 하루필요칼로리에 의해 산정한 탄수화물량
		double purposeJi = survey.purposeJi(needKcal);// 하루필요칼로리에 의해 산정한 지방량
		double needProtein = survey.needProtein(standardKg); // 평균무게에 의거한 하루 필요 단백질량 
		double recommendKcal = survey.recommendKcal(saveBmr, needKcal, choiceBmi); // 비만도에 맞는 추천 칼로리
		double recommendJi = survey.needJi(recommendKcal); // 비만도에 맞게 추천한 하루 필요 지방량
		double recommendTan = survey.needTan(recommendKcal);// 비만도에 맞게 추천한 하루 필요 탄수화물
		
		ArrayList<MenuDto> dto1 = null;
		String kcal =  String.valueOf((int)recommendKcal/3) ;
		String dan = String.valueOf((int)needProtein/3);
		String tan = String.valueOf((int)purposeTan/3);
		String gi = String.valueOf((int)purposeJi/3);
				
		//목적에만 맞는 메뉴 추천
		if(dto.getPurpose().equals("체중감량") || dto.getPurpose().equals("체중증량")) {
			dto1 = (ArrayList<MenuDto>) daoInter.getPurposeMenu1Inter(kcal);
		 }else if(dto.getPurpose().equals("채식")) {
			dto1 = (ArrayList<MenuDto>)daoInter.getPurposeMenu2Inter();
		 }else if(dto.getPurpose().equals("고단백식")) {
			 dto1 = (ArrayList<MenuDto>)daoInter.getPurposeMenu3Inter(dan);
		 }else if(dto.getPurpose().equals("저탄수화물식")) {
			 dto1 = (ArrayList<MenuDto>)daoInter.getPurposeMenu4Inter(tan);
		 }else if(dto.getPurpose().equals("저지방식")) {
			 dto1 = (ArrayList<MenuDto>)daoInter.getPurposeMenu5Inter(gi);
		 }else {
			 dto1 = (ArrayList<MenuDto>)daoInter.getPurposeMenu6Inter();
		 }

		//우리가 직접 추천하는 메뉴 ... 1
		MenuBean menuBean = new MenuBean();
		menuBean.setTan(String.valueOf((int)recommendTan));
		menuBean.setGi(String.valueOf((int)recommendJi));
		menuBean.setKcal(kcal);
		menuBean.setHate1("%"+dto.getHate1()+"%");
		menuBean.setDan(dan);
		System.out.println("dan:" + dan);
		ArrayList<MenuDto> dto2 = (ArrayList<MenuDto>)daoInter.getRecommendMenuInter(menuBean);
		session.setAttribute("random", (int)(Math.random()* dto2.size()+1));
		session.setAttribute("random2", (int)(Math.random()* dto1.size()+1));
		session.setAttribute("size", dto2.size());
		
		System.out.println("사이즈" + dto2.size());
		
		ArrayList<Object> list = new ArrayList<Object>();

						list.add((int)purposeTan); //0
						list.add((int)purposeJi);//1
						list.add((int)recommendKcal);//2
						list.add((int)recommendJi);//3
						list.add((int)recommendTan);//4
						list.add((int)saveBmi);//5
						list.add((int)saveBmr);//6
						list.add(choiceBmi);//7
						list.add((int)standardKg);///8
						list.add((int)choiceAct);//9
						list.add((int)needKcal);//10
						list.add((int)needProtein);//11
						list.add(kcal);//12
						list.add(tan);//13
						list.add(dan);//14
						list.add(gi);//15
						System.out.println("탄수화물:"+ tan);
						System.out.println("지방 :"+ gi);
						System.out.println("추천열량:"+ kcal);
						System.out.println(dto.getHate1());
						System.out.println("단백질:"+ dan);
		ModelAndView view = new ModelAndView("viewMenu");
		view.addObject("list", list);
		view.addObject("dto1", dto1);
		view.addObject("dto2", dto2);
		return view;
	}
	
	
	@RequestMapping(value = "survey3", method = RequestMethod.GET)
	public ModelAndView submitSurvey3(HttpSession session, SurveyBean bean) {
		session.setAttribute("survey",bean);
		System.out.println("survey3" + bean.getAge());
		double saveBmi = survey.saveBmi(bean.getWeight(), bean.getHeight()); //BMI 구하기b
		String choiceBmi = survey.choiceBmi(saveBmi); // BMI 에 따른 비만도판단
		double saveBmr = survey.saveBmr(bean.getWeight(),bean.getHeight(),bean.getAge(), bean.getGen()); // 기초대사량 구하기 
		double standardKg = survey.standardWeight(bean.getHeight(), bean.getGen()); // 표준체중구하기
		double choiceAct = survey.choiceAct(bean.getActive(), choiceBmi); // 활동량에 따른 계산연량 얻기
		double needKcal = survey.needKcal(standardKg, choiceAct); // 자신 키에 맞는 평균 무게에 의거한 하루 필요 칼로리
		double purposeTan = survey.purposeTan(needKcal); // 하루필요칼로리에 의해 산정한 탄수화물량
		double purposeJi = survey.purposeJi(needKcal);// 하루필요칼로리에 의해 산정한 지방량
		double needProtein = survey.needProtein(standardKg); // 평균무게에 의거한 하루 필요 단백질량 
		double recommendKcal = survey.recommendKcal(saveBmr, needKcal, choiceBmi); // 비만도에 맞는 추천 칼로리
		double recommendJi = survey.needJi(recommendKcal); // 비만도에 맞게 추천한 하루 필요 지방량
		double recommendTan = survey.needTan(recommendKcal);// 비만도에 맞게 추천한 하루 필요 탄수화물
		
		ArrayList<MenuDto> dto1 = null;
		String kcal =  String.valueOf((int)recommendKcal/3) ;
		String dan = String.valueOf((int)needProtein/3);
		String tan = String.valueOf((int)purposeTan/3);
		String gi = String.valueOf((int)purposeJi/3);
				
		//목적에만 맞는 메뉴 추천
		if(bean.getPurpose().equals("체중감량") || bean.getPurpose().equals("체중증량")) {
			dto1 = (ArrayList<MenuDto>) daoInter.getPurposeMenu1Inter(kcal);
		 }else if(bean.getPurpose().equals("채식")) {
			dto1 = (ArrayList<MenuDto>)daoInter.getPurposeMenu2Inter();
		 }else if(bean.getPurpose().equals("고단백식")) {
			 dto1 = (ArrayList<MenuDto>)daoInter.getPurposeMenu3Inter(dan);
		 }else if(bean.getPurpose().equals("저탄수화물식")) {
			 dto1 = (ArrayList<MenuDto>)daoInter.getPurposeMenu4Inter(tan);
		 }else if(bean.getPurpose().equals("저지방식")) {
			 dto1 = (ArrayList<MenuDto>)daoInter.getPurposeMenu5Inter(gi);
		 }else {
			 dto1 = (ArrayList<MenuDto>)daoInter.getPurposeMenu6Inter();
		 }

		//우리가 직접 추천하는 메뉴 ... 1
		MenuBean menuBean = new MenuBean();
		menuBean.setTan(String.valueOf((int)recommendTan));
		menuBean.setGi(String.valueOf((int)recommendJi));
		menuBean.setKcal(kcal);
		menuBean.setHate1("%"+bean.getHate1()+"%");
		menuBean.setDan(dan);
		System.out.println("dan:" + dan);
		ArrayList<MenuDto> dto2 = (ArrayList<MenuDto>)daoInter.getRecommendMenuInter(menuBean);
		session.setAttribute("random", (int)(Math.random()* dto2.size()+1));
		session.setAttribute("random2", (int)(Math.random()* dto1.size()+1));
		session.setAttribute("size", dto2.size());
		
		System.out.println("사이즈" + dto2.size());
		
		ArrayList<Object> list = new ArrayList<Object>();

						list.add((int)purposeTan); //0
						list.add((int)purposeJi);//1
						list.add((int)recommendKcal);//2
						list.add((int)recommendJi);//3
						list.add((int)recommendTan);//4
						list.add((int)saveBmi);//5
						list.add((int)saveBmr);//6
						list.add(choiceBmi);//7
						list.add((int)standardKg);///8
						list.add((int)choiceAct);//9
						list.add((int)needKcal);//10
						list.add((int)needProtein);//11
						list.add(kcal);//12
						list.add(tan);//13
						list.add(dan);//14
						list.add(gi);//15
						System.out.println("탄수화물:"+ tan);
						System.out.println("지방 :"+ gi);
						System.out.println("추천열량:"+ kcal);
						System.out.println(bean.getHate1());
						System.out.println("단백질:"+ dan);
		ModelAndView view = new ModelAndView("viewMenu");
		view.addObject("list", list);
		view.addObject("dto1", dto1);
		view.addObject("dto2", dto2);
		return view;
	}
	
	
	
}
