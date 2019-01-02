package pack.food.controller.jeong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.food.model.jeong.FoodDaoInter;

@Controller
public class DeleteController {
	
	@Autowired
	private FoodDaoInter daoInter;
	
	@RequestMapping("delete")
	public String process(@RequestParam("board_no") String no, @RequestParam("food_no") String food_no) {	//글번호
		//System.out.println(no + food_no);
		
		boolean b = daoInter.deleteData(no);
		//System.out.println(b + "out");
		if(b) {
			//System.out.println(b + "in");
			return "redirect:/view_img?food_no=" + food_no;
		}else
			return "board_error?no=" + food_no;
	}

}
