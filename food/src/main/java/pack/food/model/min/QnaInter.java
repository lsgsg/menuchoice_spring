package pack.food.model.min;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import pack.food.controller.min.QnaBean;

public interface QnaInter {
	
	@Select("select * from food_qna order by gnum desc, onum asc")
	List<QnaDto> getQnaAll();
	
	@Select("select no, id, title, content, readcnt from food_qna where no = #{no}")
	QnaDto getContent(String no);
	
	@Select("select * from food_qna where id=#{id}")
	List<QnaDto> getUser(String id);
	
	@Insert("insert into food_qna(id, type, title, content, bdate, bip, "
			+ "gnum, onum, nested) "
			+ "values(#{id}, 'C', #{title}, #{content}, now(), #{bip}, "
			+ "#{gnum}, #{onum}, #{nested})")
	public boolean insertData(QnaBean bean);
	
	@Insert("insert into food_qna(id, type, title, content, bdate, bip, "
			+ "gnum, onum, nested) "
			+ "values(#{id}, 'A', #{title}, #{content}, now(), #{bip}, "
			+ "#{gnum}, #{onum}, #{nested})")
	public boolean replyData(QnaBean bean);
	
	@Select("select max(no) from food_qna")
	public int getMaxNo();
	
	@Update("update food_qna set readcnt = readcnt + 1 where no = #{no}")
	public int readCntUp(String no);
	
	@Delete("delete from food_qna where no = #{no}")
	public int deleteData(String no);
	
	@Update("update food_qna set title = #{title}, content = #{content} where no = #{no}")
	public int updateData(QnaBean bean);
	
}
