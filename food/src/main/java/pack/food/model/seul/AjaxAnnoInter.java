package pack.food.model.seul;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.food.model.jeong.BoardDto;

public interface AjaxAnnoInter {
   
   @Select("select name,no from food where name like #{name}")
   public List<MenuDto> getDataAll(String name);
   
//   @Select("select num, name, addr from mem where num=#{num}")
//   public MemDto selectPart(String num);
//   
   @Select("select food_board.no, food_no, client_id, content, date, groups from food_board inner join food on food_no = food.no where food_no=#{no}")
   public List<BoardDto> getDataAllCo(String no);
   
   @Insert("insert into food_board(food_no,client_id,content,date) values(#{food_no}, #{client_id}, #{content}, now())")
   public boolean insertDataContent(BoardDto dto);
//   
//   @Update("update mem set name=#{name}, addr=#{addr} where num=#{num}")
//   public int updateData(MemBean bean); 
//   
//   @Delete("delete from mem where num=#{num}")
//   public int deleteData(String num);

}