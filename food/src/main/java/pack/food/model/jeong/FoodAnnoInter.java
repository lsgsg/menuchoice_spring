package pack.food.model.jeong;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.food.controller.jeong.BoardBean;

public interface FoodAnnoInter {
   
   //메뉴검색
   @Select("select name from food")
   public List<FoodDto> getDataAll();
   
   @Select("select no, groups, name from food where groups=#{groups}")
   public List<FoodDto> getDataGroup(String groups);
   
   @Select("select no, groups, name, once, kcal, tan, dan, gi, dang, na, col, powha, trans from food where no=#{no}")
   public FoodDto getData(String no);
   
   @Select("select no, groups from food group by groups order by no")
   public List<FoodDto> selectGroup();
   
   //메뉴에 대한 댓글게시판
   @Select("select food_board.no, food_no, client_id, content, date, groups from food_board inner join food on food_no = food.no where food_no=#{no}")
   public List<BoardDto> getContentAll(String food_no);
   
   @Select("select food_board.no, food_no, client_id, content, date, groups from food_board inner join food on food_no = food.no where food_board.no=#{food_board.no}")
   public BoardDto selectPart(String no);
   
   
   @Select("select no, groups, name from food where name like #{name}")
   public List<FoodDto> getDataNameInter(String name);
   
   
   @Insert("insert into food_board(food_no, client_id, content, date) values(#{food_no}, #{client_id}, #{content}, now())")
   public int insertData(BoardBean bean);
   
   @Update("update food_board set client_id=#{client_id}, content=#{content}, date=now() where no=#{no}")
   public int updateData(BoardBean bean); 
   
   @Delete("delete from food_board where no=#{no}")
   public int deleteData(String no);

}