package pack.food.model.seul;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.food.controller.seul.MenuBean;
import pack.food.controller.seul.SurveyBean;

@Repository
public class SurveyDaoImpl implements SurveyDaoInter {

	@Autowired
	private SurveyAnnoInter annoInter;

	
		public List<MenuDto> getPurposeMenu1Inter(String kcal) {
			//System.out.println("kcal:" + kcal);
			return annoInter.getPurposeMenu1(kcal);
		}
		
		public List<MenuDto> getPurposeMenu2Inter() {
			return annoInter.getPurposeMenu2();
		}
		
		public List<MenuDto> getPurposeMenu3Inter(String dan) {
		
			return annoInter.getPurposeMenu3(dan);
		}
		
		public List<MenuDto> getPurposeMenu4Inter(String tan) {
			System.out.println("탄수화물:" + tan);
			return annoInter.getPurposeMenu4(tan);
		}
		
		public List<MenuDto> getPurposeMenu5Inter(String gi) {
		
			return annoInter.getPurposeMenu5(gi);
		}
		
		public List<MenuDto> getPurposeMenu6Inter() {
		
			return annoInter.getPurposeMenu6();
		}
		
		public List<MenuDto> getRecommendMenuInter(MenuBean bean) {
			System.out.println("테스트 빈:" + bean);
			//System.out.println("테스트 객체" + annoInter.getPurposeMenu4(tan));
			return annoInter.getRecommendMenu(bean);
		}


		public MemberDto getMemberInter(String id) {
			
			return annoInter.getMember(id);
		}


}
