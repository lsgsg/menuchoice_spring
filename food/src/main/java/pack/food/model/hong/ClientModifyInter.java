package pack.food.model.hong;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ClientModifyInter {
	@Select("select * from food_client where id=#{id}")
	ClientDto getClientOne(String id);
	
	@Update("update food_client set age=#{age},gen=#{gen},height=#{height},"
			+ "weight=#{weight},purpose=#{purpose},active=#{active},hate1=#{hate1},hate2=#{hate2},hate3=#{hate3},hate4=#{hate4},hate5=#{hate5} "
			+ "where id=#{id}")
	boolean updateClientOne(ClientDto dto);
}
