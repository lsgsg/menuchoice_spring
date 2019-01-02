package pack.food.controller.min;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import pack.food.model.min.QnaInter;

@Controller
public class QnaDeleteController {
	
	@Autowired
	private QnaInter qnaInter;
	
	@RequestMapping("qna_delete")
	public String deleteData(String no) {
		if(qnaInter.deleteData(no) > 0) {
			return "redirect:/qna";
		}else {
			return "error";
		}
		
	}
	
}
