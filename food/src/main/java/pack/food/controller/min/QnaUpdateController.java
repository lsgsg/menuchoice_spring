package pack.food.controller.min;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pack.food.model.min.QnaDto;
import pack.food.model.min.QnaInter;

@Controller
public class QnaUpdateController {
	
	@Autowired
	private QnaInter qnaInter;
	
	@RequestMapping(value = "qna_update", method = RequestMethod.GET)
	public ModelAndView goUpdate(String no) {
		//원래 정보 주기
		QnaDto dto = qnaInter.getContent(no);
		
		ModelAndView view = new ModelAndView();
		view.setViewName("qna_update");
		view.addObject("dto", dto);		
		return view;
	}
	
	@RequestMapping(value = "qna_update", method = RequestMethod.POST)
	public ModelAndView updateData(QnaBean bean) {
		if(qnaInter.updateData(bean) > 0) {
			List<QnaDto> list = qnaInter.getQnaAll();
			return new ModelAndView("qna_list", "list", list);
//			ModelAndView view = new ModelAndView();
//			view.setViewName("qna_list");
//			view.addObject("list", list);
//			return view;
		}else {
			return new ModelAndView("error");
		}
		
	}
	
	
}
