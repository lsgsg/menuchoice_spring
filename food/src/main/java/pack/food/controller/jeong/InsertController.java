package pack.food.controller.jeong;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pack.food.model.jeong.FoodDaoInter;

@Controller
public class InsertController {
	
//	@Autowired
//	@Qualifier 
	@Resource(name="foodDaoImpl")
	private FoodDaoInter daoInter;
	
	@RequestMapping(value="insert", method=RequestMethod.GET)
	public String form(@RequestParam("food_no") String food_no, HttpSession session) {
		System.out.println(food_no);
		session.setAttribute("food_no", food_no);
		return "board_insform";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String submit(BoardBean bean) {
		boolean b = daoInter.insertData(bean);
		if(b) {
			//System.out.println(b);
			return "redirect:/view_img?food_no=" + bean.getFood_no();
		}else			
			return "error";	// error.jsp
	}


}
