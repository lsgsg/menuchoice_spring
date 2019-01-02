package pack.food.controller.jeong;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.food.model.jeong.FoodDaoInter;
import pack.food.model.jeong.FoodDto;

// 한줄 한줄 설명가능하면 스프링 잘 따라오고 있는 것

@Controller
public class ListController {

   private static final int ArrayList = 0;
   private static final int FoodDto = 0;
   @Autowired // (inter에 연결된 클래스들과 연결?)
   @Qualifier("foodDaoImpl")
   private FoodDaoInter daoInter;

   @RequestMapping("list")
   public ModelAndView list() {

      // System.out.println(daoInter.getDataAll()); // [pack.model.MemDto@6372f725,
      // pack.model.MemDto@7759dd03, pack.model.MemDto@53845288]
      return new ModelAndView("view_img", "list", daoInter.getDataAll());
   }
   
   @RequestMapping("list_img") //top에서 요청명을 받아와야 매핑됨
   public ModelAndView grouplist() {
      return new ModelAndView("list_img", "list", daoInter.selectGroup());
   }
   
   @RequestMapping(value="qna_img", method=RequestMethod.GET)
   public ModelAndView getDataGroup(@RequestParam("groups") String groups) {
      return new ModelAndView("qna_img", "list", daoInter.getDataGroup(groups));
   }
   
   @RequestMapping(value="view_img", method=RequestMethod.GET)
   public ModelAndView selectPart(@RequestParam("no") String no) {
      System.out.println("view_img들어와라");
      // 결과값 두 개 이상 받기
      ModelAndView view = new ModelAndView("view_img");
      view.addObject("dto", daoInter.getData(no));
      view.addObject("list", daoInter.getContentAll(no));   //해당그룹 food_no
      view.addObject("glist", daoInter.selectGroup());   //비교대상
//      view.addObject("datas", daoInter.get)
      
      //System.out.println(daoInter.selectGroup());
      return view;
      
      //return new ModelAndView("view_img", "dto", daoInter.selectPart(no));
   }
   @RequestMapping(value="list_show", method=RequestMethod.POST)
   public ModelAndView selectPart2(@RequestParam("name") String name) {
      System.out.println("들어오나?");
      
      ArrayList<FoodDto> dto = (java.util.ArrayList<pack.food.model.jeong.FoodDto>) daoInter.getDataName("%" + name + "%");
      System.out.println("%" + name + "%");
      System.out.println(dto);
      return new ModelAndView("qna_img", "list", dto);
      
      //return new ModelAndView("view_img", "dto", daoInter.selectPart(no));
   }
   

   
   
   
}