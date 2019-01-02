package pack.food.controller.min;

import java.net.InetAddress;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pack.food.model.min.QnaDto;
import pack.food.model.min.QnaInter;

@Controller
public class QnaInsertController {
	@Autowired
	private QnaInter qnaInter;
	
//	@RequestMapping(value = "qna_insert", method = RequestMethod.GET)
//	public String form() {
//		return "insform";
//	}
	
	@RequestMapping(value = "qna_insert", method = RequestMethod.POST)
	public String submit(HttpSession session, QnaBean bean) {
		String id = (String)session.getAttribute("userid");
		bean.setId(id);
		
		String ip = "";
		try {
			InetAddress localHost = InetAddress.getLocalHost();
			ip = localHost.getHostAddress();
		} catch (Exception e) {
			System.out.println("IP error:" + e);
		}
		bean.setBip(ip);
		
		List<QnaDto> list = qnaInter.getQnaAll(); //null 체크용 dto
		//System.out.println(list);
		int maxNo = 0;
		if(list.size() > 0) {
			maxNo = qnaInter.getMaxNo();			
		}
		
		//if(Integer.toString(maxNo) == null) maxNo = 0;
		bean.setGnum(maxNo + 1); //항상 이거인게 아니고, 
		bean.setOnum(0); // 이게 0이 아니면 gnum은 원래 글의 번호
		bean.setNested(0); //
		
		boolean b = qnaInter.insertData(bean);
		if(b) {
			return "redirect:/qna";			
		}else {
			return "error";			
		}
		
	}
	
	//처음 링크로 답글보기 할 경우, 답글 쓰는 페이지로 이동
	@RequestMapping(value = "qna_answer", method = RequestMethod.GET)
	public ModelAndView goUpdate(String no) {
		//원래 정보 주기
		QnaDto dto = qnaInter.getContent(no);
		
		ModelAndView view = new ModelAndView();
		view.setViewName("qna_answer");
		view.addObject("dto", dto);		
		return view;
	}
	
	//다시 post로 답글쓰기 요청하면, DB에 반영
	@RequestMapping(value = "qna_answer", method = RequestMethod.POST)
	public String updateData(HttpSession session, QnaBean bean) {
		QnaDto dto = qnaInter.getContent(bean.getNo()); //원래 레코드(원래 글) 정보
		
		String id = (String)session.getAttribute("userid");
		bean.setId(id);
		
		String ip = "";
		try {
			InetAddress localHost = InetAddress.getLocalHost();
			ip = localHost.getHostAddress();
		} catch (Exception e) {
			System.out.println("IP error:" + e);
		}
		bean.setBip(ip);
		
		int maxNo = qnaInter.getMaxNo();
		bean.setGnum(Integer.parseInt(bean.getNo())); //항상 이거인게 아니고,
		bean.setOnum(dto.getOnum() + 1); // 이게 0이 아니면 gnum은 원래 글의 번호
		//System.out.println("원래 글 번호 : " + bean.getNo());
		//System.out.println("원래 onum : " + dto.getOnum());
		bean.setNested(0); // 
		
		boolean b = qnaInter.replyData(bean);
		if(b) {
			return "redirect:/qna";			
		}else {
			return "error";			
		}
		
	}
	
	
	
	
}
