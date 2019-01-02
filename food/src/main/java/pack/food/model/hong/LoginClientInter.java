package pack.food.model.hong;

import org.apache.ibatis.annotations.Select;

public interface LoginClientInter {
	@Select("select id,passwd,name from food_client where id=#{id}")
	ClientDto getLoginInfo(String no);
}
