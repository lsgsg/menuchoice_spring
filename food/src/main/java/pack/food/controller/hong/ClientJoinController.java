package pack.food.controller.hong;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pack.food.model.hong.ClientDto;
import pack.food.model.hong.ClientJoinInter;

@Controller
public class ClientJoinController {
	@Autowired
	private ClientJoinInter inter;
	
	//계정 기본 정보 입력: clientjoin
	@RequestMapping(value="clientjoin",method=RequestMethod.GET)
	public String goClientJoin() {
		return "redirect:/member_form.jsp";
	}
	
	//아이디 중복 체크
	@RequestMapping(value="check_id",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,String> checkId(String id) {
		Map<String, String> m=new HashMap<String, String>();
		if(inter.checkId(id)==null)	{
			m.put("result", "false");
			return m;
		}
		String dbid=inter.checkId(id).getId();
		if(dbid==null || dbid.equals("")) {
			m.put("result","false");
		}else {
			m.put("result","true");
		}
		return m;
	}
	
	//기본 정보 입력 후 회원가입이 되고 member_form_ok1.jsp로 forward시킴
	@RequestMapping(value="clientjoin",method=RequestMethod.POST)
	public String submitClientJoin(HttpServletRequest request, ClientDto dto) {
		if(inter.joinClient(dto)) {
			request.setAttribute("id", dto.getId());
			return "member_form_ok1";
		}
		else
			return "redirect:/index.jsp";
	}
	
	//계정 추가 정보 입력: clientjoin2
	@RequestMapping(value="clientjoin2",method=RequestMethod.GET)
	public String goClientJoin2(HttpServletRequest request) {
		request.setAttribute("id", request.getParameter("id"));
		return "member_form2";
	}
	
	//추가 정보 등록: clientjoin2
	@RequestMapping(value="clientjoin2",method=RequestMethod.POST)
	public String submitClientJoin2(HttpServletRequest request,ClientDto dto) {
		if(inter.joinClient2(dto)) {
			request.setAttribute("id", dto.getId());
			return "member_form_ok2";
		}
		else
			return "redirect:/index.jsp";
	}

}
