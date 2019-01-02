package pack.food.controller.hong;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pack.food.model.hong.ClientDto;
import pack.food.model.hong.LoginClientInter;

@Controller
public class LoginClientController {
	@Autowired
	// @Qualifier("loginClientImpl")
	private LoginClientInter inter;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String goLogin() {
		return "redirect:/login_form.jsp";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String subbmitLogin(HttpSession session, @RequestParam("id") String id,
			@RequestParam("passwd") String passwd) {
		ClientDto dto = inter.getLoginInfo(id);
		if (dto != null) {
			String reId = dto.getId();
			String pass = dto.getPasswd();
			if (pass.equals(passwd)) {
				session.setAttribute("userid", reId);
			}
		}else if(dto == null && id.equals("admin") && passwd.equals("123")) {
			//관리자(admin, 123)일 때 한해서 세션 아이디 생성
			session.setAttribute("userid", id);
		}
		return "redirect:/main.jsp";
	}

	@RequestMapping(value = "logout")
	public String getLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/main.jsp";
	}
}
