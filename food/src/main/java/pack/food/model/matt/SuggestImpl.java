package pack.food.model.matt;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.food.controller.matt.SuggestBean;

@Repository
public class SuggestImpl {
	@Autowired
	private SuggestInter suggestInter;
	
	public List<SuggestDto> getUser(String id) {
		return suggestInter.getSuggestList(id);
	}

	public ClientDto getLoginInfo(String id) {
		return suggestInter.getLoginInfo(id);
	}
	
	public MenuDto getFoodNameByNo(String no) {
		return suggestInter.getFoodNameByNo(no);
	}
	
	public int insertSuggest(SuggestBean bean) {
		return suggestInter.insertSuggest(bean);
	}
	
}
