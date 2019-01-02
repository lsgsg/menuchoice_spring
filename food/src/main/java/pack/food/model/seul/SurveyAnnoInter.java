package pack.food.model.seul;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.food.controller.seul.MenuBean;
import pack.food.controller.seul.SurveyBean;

public interface SurveyAnnoInter {
	
	@Select("select * from food where kcal <= #{kcal}")
	public List<MenuDto> getPurposeMenu1(String kcal);
	
	@Select("select * from food where not jae like ('%고기%' or '%새우%' or '%해산물%' or '%햄%') or not name like ('%고기%' or '%새우%' or '%해산물%' or '%햄%')")
	public List<MenuDto> getPurposeMenu2();
	
	@Select("select * from food where dan <= #{dan}")
	public List<MenuDto> getPurposeMenu3(String dan); 
	
	@Select("select * from food where tan <= #{tan}")
	public List<MenuDto> getPurposeMenu4(String tan); 
	
	@Select("select * from food where gi <= #{gi}")
	public List<MenuDto> getPurposeMenu5(String gi);
	
	@Select("select * from food where name is not null")
	public List<MenuDto> getPurposeMenu6();
	
	@Select("select * from food where tan <= #{tan} and gi <= #{gi} and kcal <= #{kcal} and not jae like #{hate1} and dan <= #{dan}")
	public List<MenuDto> getRecommendMenu(MenuBean bean);
//	@Select("select * from food_client where num = #{num}")
//	public SurveyDto selectPart(String num);
	
	@Select("select * from food_client where id = #{id}")
	public MemberDto getMember(String id);
	
	
}
