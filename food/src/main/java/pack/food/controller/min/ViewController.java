package pack.food.controller.min;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pack.food.model.min.QnaDto;
import pack.food.model.min.QnaInter;

@Controller
public class ViewController {
	
	@Autowired
	private QnaInter qnaInter;
	
	@RequestMapping("qna_view")
	public ModelAndView getContent(String no) {
		//데이터 부르기 전에 조회수를 하나 늘리기
		qnaInter.readCntUp(no);

		QnaDto dto = qnaInter.getContent(no);
		ModelAndView view = new ModelAndView();
		view.setViewName("qna_view");
		view.addObject("dto", dto);
		//System.out.println(dto.getId());
		//System.out.println(dto.getTitle());
		//System.out.println(dto.getContent());
		return view;
	}
	
}
