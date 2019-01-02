package pack.food.controller.jeong;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.food.model.jeong.BoardDto;
import pack.food.model.jeong.FoodDaoInter;

@Controller
public class UpdateController {

	@Autowired
	private FoodDaoInter daoInter;

	// 수정을 위한 jsp파일 읽어오기(get method)
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public ModelAndView form(@RequestParam("board_no") String no, 
								@RequestParam("food_no") String food_no,
									HttpSession session) {
		// System.out.println(no + food_no);
		BoardDto dto = daoInter.selectPart(no); // 글번호
		session.setAttribute("food_no", food_no);
		return new ModelAndView("board_upform", "dto", dto);
	}

	// 수정을 위한 jsp파일 읽어오기(post method) == <setProperty property="*">
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String submit(BoardBean bean) {
		boolean b = daoInter.updateData(bean);
		
		if (b) {
			//System.out.println(b);
			return "redirect:/view_img?no=" + bean.getFood_no();
		} else
			return "board_error";
	}

}
