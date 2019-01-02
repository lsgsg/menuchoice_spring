package pack.food.model.min;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.food.controller.min.QnaBean;

@Repository
public class QnaImpl {
	@Autowired
	private QnaInter qnaInter;
	
	public List<QnaDto> getUser(String id){
		return qnaInter.getUser(id);
	}
	
	QnaDto getContent(String no) {
		return qnaInter.getContent(no);
	}
	
	public List<QnaDto> getQnaAll(){
		return qnaInter.getQnaAll();
	}
	
	public boolean insertData(QnaBean bean) {
		return qnaInter.insertData(bean);
	}
	
	public boolean replyData(QnaBean bean) {
		return qnaInter.replyData(bean);
	}
	
	public int getMaxNo() {
		return qnaInter.getMaxNo();
	}
	
	public int readCntUp(String no) {
		return qnaInter.readCntUp(no);
	}
	
	public int deleteData(String no) {
		return qnaInter.deleteData(no);
	}
	
	public int updateData(QnaBean bean) {
		return qnaInter.updateData(bean);
	}

}
