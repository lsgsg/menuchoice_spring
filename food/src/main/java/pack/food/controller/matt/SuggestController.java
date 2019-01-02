package pack.food.controller.matt;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pack.food.model.matt.ClientDto;
import pack.food.model.matt.MenuDto;
import pack.food.model.matt.SuggestDto;
import pack.food.model.matt.SuggestInter;
import pack.food.model.seul.SurveyClass;

@Controller
public class SuggestController {
	
	private SurveyClass survey = new SurveyClass();
	
	@Autowired
	private SuggestInter suggestInter;
	
	@RequestMapping("mypage")
	public ModelAndView suggestList(HttpServletRequest request, HttpSession session) {
		String id = (String)session.getAttribute("userid");
		//로그인한 유저가 음식 추천받은 기록
		List<SuggestDto> list = suggestInter.getSuggestList(id);
		
		//음식 추천 테이블(food_suggest)의 음식번호 가지고 음식이름을 리스트에 넣기
		List<MenuDto> mlist = new ArrayList<MenuDto>(); 
		for(int i = 0; i < list.size(); i ++) {
			String no = list.get(i).getFood_no();
			MenuDto mdto = suggestInter.getFoodNameByNo(no);
			mlist.add(mdto);
			//System.out.println(name);
		}
		
		//로그인한 유저 정보로 개인 분석결과 보여주기
		ClientDto dto = suggestInter.getLoginInfo(id);
		double saveBmi = survey.saveBmi(dto.getWeight(), dto.getHeight()); //BMI 구하기
		//System.out.println("bmi구하기 : " + saveBmi);
		String choiceBmi = survey.choiceBmi(saveBmi); // BMI 에 따른 비만도판단
		//System.out.println("bmi결과2 : "+ choiceBmi);
		
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
		
		String kcal =  String.valueOf((int)recommendKcal/3);
		String dan = String.valueOf((int)needProtein/3);
		String tan = String.valueOf((int)purposeTan/3);
		String gi = String.valueOf((int)purposeJi/3);
		
		ArrayList<Object> infoList = new ArrayList<Object>();
		infoList.add((int)purposeTan); //0
		infoList.add((int)purposeJi);//1
		infoList.add((int)recommendKcal);//2
		infoList.add((int)recommendJi);//3
		infoList.add((int)recommendTan);//4
		infoList.add((int)saveBmi);//5
		infoList.add((int)saveBmr);//6
		infoList.add(choiceBmi);//7
		infoList.add((int)standardKg);///8
		infoList.add((int)choiceAct);//9
		infoList.add((int)needKcal);//10
		infoList.add((int)needProtein);//11
		infoList.add(kcal);//12
		infoList.add(tan);//13
		infoList.add(dan);//14
		infoList.add(gi);//15
		
		//System.out.println(dto);
		//System.out.println(list);
		
		//모델과 통신
		ModelAndView view = new ModelAndView();
		view.setViewName("mypage");
		view.addObject("list", list); //로그인한 유저가 음식 추천받은 기록
		view.addObject("dto", dto); //로그인한 유저 정보
		view.addObject("mlist", mlist); //음식 추천 테이블(food_suggest)의 음식번호로 찾은 음식정보
		view.addObject("infoList", infoList); //개인 분석결과
		return view;
	}
	
	@RequestMapping("addsuggest") //메소드 이름 getClientSuggest로 하면 aop대상
	public String clientSuggest(String ifYes, String id, String no) {
//		if(id.equals("") || id == null) { //
//			return "error";
//		}
		SuggestBean bean = new SuggestBean();
		bean.setFood_no(no);
		bean.setClient_id(id);
		bean.setGubun(ifYes);
		
		if(suggestInter.insertSuggest(bean) > 0) {
			return "redirect:/mypage";			
		}else {
			return "error";
		}
		
	}
	
	
	
}
