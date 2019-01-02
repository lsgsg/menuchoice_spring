package pack.food.model.seul;

import java.util.List;

import pack.food.controller.seul.MenuBean;

public interface SurveyDaoInter {
	
	List<MenuDto> getPurposeMenu1Inter(String kcal);
	List<MenuDto> getPurposeMenu2Inter();
	List<MenuDto> getPurposeMenu3Inter(String dan); 
	List<MenuDto> getPurposeMenu4Inter(String tan); 
	List<MenuDto> getPurposeMenu5Inter(String gi);
	List<MenuDto> getPurposeMenu6Inter();
	
	List<MenuDto> getRecommendMenuInter(MenuBean bean);
	
	MemberDto getMemberInter(String id);
}
