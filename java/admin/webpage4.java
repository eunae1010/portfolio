package admin;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class webpage4 {
	String script = "";
	SqlSession ss = null;
	PrintWriter pw = null;
	
	@Resource(name="reserve")
	private reserve_module rm;
	
	//좌석 및 예매 설정 출력
	@RequestMapping("/seat_list.do")
	public String seat_list(Model m, @RequestParam(defaultValue = "", required = false) String search, @RequestParam(defaultValue = "", required = false) String part) {
		List<air_dto> ad = null;
		List<air_dto> ea = rm.seat_list();
		
		if(search.equals("") && part.equals("")) {
			ad = rm.seat_list();
		}
		else {
			m.addAttribute("search", search);
			m.addAttribute("part", part);
			
			if(part.equals("1")) {
				ad = rm.search_seat(search, 1);
			}
			else if(part.equals("2")) {
				ad = rm.search_seat(search, 2);
			}
		}
		m.addAttribute("ad", ad);
		m.addAttribute("ad_ea", ad.size());
		m.addAttribute("ea", ea.size());
		
		List<air_dto> ad2 = rm.seat_view();
		m.addAttribute("ad2", ad2);
		m.addAttribute("ea2", ad2.size());
		
		return null;
	}
	@RequestMapping("/seat_listok.do")
	public String seat_listok(@ModelAttribute("seat") air_dto air_dto, Model m) {
		int result = rm.seat_insert(air_dto);
		
		if(result > 0) {
			result = rm.seat_update(air_dto);
			
			this.script = "<script>alert('정상적으로 등록되었습니다.');location.href='./seat_list.do';</script>";
		}
		else {
			this.script = "<script>alert('시스템 오류로 인해 등록되지 않았습니다.');location.href='./seat_list.do';</script>";
		}
		m.addAttribute("script", this.script);
		return "admin_sc";
	}
	
	@GetMapping("/seat_listno.do")
	public String seat_listno(Model m) {
		List<air_dto> ad = rm.seat_list();
		
		m.addAttribute("ad", ad.size());
		return "seat_list";
	}
	
	//예매 리스트 출력
	@RequestMapping("/ticketing_list.do")
	public String ticketing_list(Model m, @RequestParam(defaultValue = "", required = false) String search, @RequestParam(defaultValue = "", required = false) String part) {
		List<air_dto> ad = null;
		
		if(search.equals("") && part.equals("")) {
			ad = rm.ticketing_list();
		}
		else {
			m.addAttribute("search", search);
			m.addAttribute("part", part);
			
			if(part.equals("1")) {
				ad = rm.search_list(search, 1);
			}
			else if(part.equals("2")) {
				ad = rm.search_list(search, 2);
			}
		}
		m.addAttribute("ad", ad);
		m.addAttribute("ea", ad.size());
		return null;
	}
	@GetMapping("/ticket_cancel.do")
	public String ticket_cancel(Model m, @RequestParam(defaultValue = "", required = false) String pidx) {
		int result = rm.ticket_cancel(pidx);
		
		if(result > 0) {
			this.script = "<script>alert('정상적으로 취소되었습니다.');location.href='./ticketing_list.do';</script>";
		}
		else {
			this.script = "<script>alert('데이터 오류로 인해 취소되지 않았습니다.');location.href='./ticketing_list.do';</script>";
		}
		m.addAttribute("script", this.script);
		return "admin_sc";
	}
}
