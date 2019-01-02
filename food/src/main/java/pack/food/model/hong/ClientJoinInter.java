package pack.food.model.hong;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ClientJoinInter {
	@Select("select id from food_client where id=#{id}")
	ClientDto checkId(String id);
	
	@Insert("insert into food_client(id,passwd,name) values(#{id},#{passwd},#{name})")
	boolean joinClient(ClientDto dto);

	@Update("update food_client set age=#{age},gen=#{gen},height=#{height},"
			+ "weight=#{weight},purpose=#{purpose},active=#{active},hate1=#{hate1},hate2=#{hate2},hate3=#{hate3},hate4=#{hate4},hate5=#{hate5} "
			+ "where id=#{id}")
	boolean joinClient2(ClientDto dto);
}
