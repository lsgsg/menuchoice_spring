package pack.food.model.matt;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import pack.food.controller.matt.SuggestBean;

public interface SuggestInter {
	
	@Select("select * from food_suggest where client_id = #{id} order by date desc")
	List<SuggestDto> getSuggestList(String id);
	
	@Select("select * from food_client where id=#{id}")
	ClientDto getLoginInfo(String id);
	
	@Select("select no, groups, name, once, kcal from food where no = #{no}")
	public MenuDto getFoodNameByNo(String no);
	
	@Insert("insert into food_suggest(food_no, client_id, date, gubun) "
			+ "values(#{food_no}, #{client_id}, now(), #{gubun})")
	public int insertSuggest(SuggestBean bean);
	
}
