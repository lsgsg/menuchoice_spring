package pack.food.controller.seul;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pack.food.model.jeong.BoardDto;
import pack.food.model.seul.AjaxAnnoInter;
import pack.food.model.seul.MenuDto;

@Controller
public class AjaxController {
   
   private static final int BoardDto = 0;
   @Autowired
   private AjaxAnnoInter ajaxInter;
   
   @RequestMapping(value = "list_search", method=RequestMethod.GET)
   @ResponseBody
   public Map getJson(@RequestParam("name") String name) {
      List<MenuDto> list =  ajaxInter.getDataAll("%"+name+"%");
      
      Map<String, Object> data = new HashMap<String, Object>();
      
      data.put("datas", list);
      System.out.println(name);
      System.out.println(data);
      
      return data;   
   }
   
   @RequestMapping(value = "commentGo")
   @ResponseBody
   public Map getJson(@RequestParam("food_no") String food_no,@RequestParam("client_id") String client_id,@RequestParam("content") String content ) {
      System.out.println("들어오나?");
      BoardDto dto = new BoardDto();
      dto.setClient_id(client_id);
      dto.setContent(content);
      dto.setFood_no(food_no);
      boolean b =  ajaxInter.insertDataContent(dto);
      List<BoardDto> list = ajaxInter.getDataAllCo(food_no);
      
      Map<String, Object> data = new HashMap<String, Object>();
      
      data.put("datas", list);
      System.out.println(client_id);
      System.out.println(content);
      
      return data;   
   }
}