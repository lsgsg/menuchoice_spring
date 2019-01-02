package pack.food.aspect;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
public class MyAdvice {
	@Autowired
	private LoginClass loginClass;

	
//	@Around("execution(* com.howtodoinjava.app.service.impl.EmployeeManagerImpl.*(..))")
//	@Around("execution(* first..controller.*Controller.*(..)) or execution(* first..service.*Impl.*(..)) or execution(* first..dao.*DAO.*(..))")
//	execution(public void set*(..)) : 리턴 타입이 void이고 set으로 시작하는 파라미터 0개 이상인 public 메소드
//	execution(* test.aspect.*.*()) : test.aspect 패키지의 파라미터가 없는 모든 메소드
//	execution(* test.aspect..*.*(..)) : test.aspect 패키지 및 하위 패키지에 파라미터가 0개 이상인 메소드
//	execution(void test.aspect.TestService.test()) : 리턴 타입이 void인 TestService의 test 메소드 호출
//	execution(* test*(*)) : test로 시작하는 파라미터 1개를 갖는 메소드
//	execution(* test*(*, *)) : test로 시작하는 파라미터 2개를 갖는 메소드
//	execution(* test*(Integer, ..)) : test로 시작하고 첫번째 파라미터는 Integer이고 1개 이상의 파라미터를 갖는 메소드

	
	//리턴 타입 String인 메소드는 이걸로 묶기
	@Around("execution(* getClient*(..))")
	public Object aopProcess2(ProceedingJoinPoint joinPoint) throws Throwable {
		HttpServletRequest request = null;
		HttpServletResponse response = null;

		for (Object obj : joinPoint.getArgs()) {
			if (obj instanceof HttpServletResponse) {
				response = (HttpServletResponse) obj;
			}

			if (obj instanceof HttpServletRequest) {
				request = (HttpServletRequest) obj;
			}
		}
		
		// 세션 체크 후 로그인하지 않은 경우 로그인 창으로 이동
		if (loginClass.loginCheck(request, response)) { //로그인 X
			return "redirect:/login_form.jsp";
		}else { //로그인 O
			Object object = joinPoint.proceed();
			return object;			
		}
	}
	
	//리턴 타입 ModelAndView인 메소드는 이걸로 묶기
	@Around("execution(* suggestList*(..))")
	public Object aopProcess(ProceedingJoinPoint joinPoint) throws Throwable {
		HttpServletRequest request = null;
		HttpServletResponse response = null;

		for (Object obj : joinPoint.getArgs()) {
			if (obj instanceof HttpServletResponse) {
				response = (HttpServletResponse) obj;
			}

			if (obj instanceof HttpServletRequest) {
				request = (HttpServletRequest) obj;
			}
		}
		
		// 세션 체크 후 로그인하지 않은 경우 로그인 창으로 이동
		if (loginClass.loginCheck(request, response)) { //로그인 X
			return new ModelAndView("redirect:/login_form.jsp");
		}else { //로그인 O
			Object object = joinPoint.proceed();
			return object;			
		}
	}
	
	
	
	
}
