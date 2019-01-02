package pack.food.aspect;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.client.HttpClientErrorException;

@Component
public class LoginClass {
	
	public boolean loginCheck(HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		if(session.getAttribute("userid") == null) {
			//response.sendRedirect("login");
			return true;
		}else {
			return false;
		}
	}
	
	
	
}
