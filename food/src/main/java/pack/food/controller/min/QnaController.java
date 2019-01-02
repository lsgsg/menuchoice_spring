package pack.food.controller.min;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pack.food.model.min.QnaDto;
import pack.food.model.min.QnaInter;

@Controller
public class QnaController {
	
	@Autowired
	private QnaInter qnaInter;
	
	@RequestMapping("qna")
	public ModelAndView qnaList() {
		
		List<QnaDto> list = qnaInter.getQnaAll();
		
		//모델과 통신
		ModelAndView view = new ModelAndView();
		view.setViewName("qna_list");
		view.addObject("list", list);
		return view;
	}
	
	
	
	
}
