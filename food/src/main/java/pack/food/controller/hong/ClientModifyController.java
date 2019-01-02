package pack.food.controller.hong;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pack.food.model.hong.ClientDto;
import pack.food.model.hong.ClientModifyInter;

@Controller
public class ClientModifyController {
	@Autowired
	private ClientModifyInter inter;
	
	//id로 회원정보를 받아옴
	@RequestMapping(value="clientmodify",method=RequestMethod.GET)
	public String getClientOne(HttpServletRequest request,HttpSession session) {
		ClientDto dto=inter.getClientOne((String)session.getAttribute("userid"));
		request.setAttribute("dto", dto);
		return "member_form_modify";
	}
	
	//회원정보를 업데이트함
	@RequestMapping(value="clientmodify",method=RequestMethod.POST)
	public String updateClientOne(ClientDto dto) {
		if(inter.updateClientOne(dto))	return "member_update_ok";
		else return "member_update_fail";
	}

}
