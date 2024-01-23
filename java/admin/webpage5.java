package admin;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class webpage5 {
	String script = "";
	SqlSession ss = null;
	PrintWriter pw = null;
	
	@Resource(name="faq")
	private faq_module fm;
	
	//faq 등록
	@GetMapping("/faq_write.do")
	public String faq_write() {
		
		return null;
	}
	@PostMapping("/faq_writeok.do")
	public String faq_writeok(@ModelAttribute("faq") faq_dto faq_dto, Model m) {
		int result = fm.faq_insert(faq_dto);
		
		if(result > 0) {
			this.script = "<script>alert('정상적으로 등록되었습니다.');location.href='./faq_list.do';</script>";
		}
		else {
			this.script = "<script>alert('데이터 오류로 인해 업로드되지 않았습니다.');history.go(-1);</script>";
		}
		m.addAttribute("script", this.script);
		return "admin_sc";
	}
	
	//faq 리스트 출력
	@RequestMapping("/faq_list.do")
	public String faq_list(Model m, @RequestParam(defaultValue = "", required = false) String search) {
		List<faq_dto> fd = null;
		
		if(search.equals("")) {
			fd = fm.faq_list();
		}
		else {
			m.addAttribute("search", search);
			fd = fm.search_faq(search);
		}
		m.addAttribute("fd", fd);
		m.addAttribute("ea", fd.size());
		return null;
	}
	
	//faq 삭제
	@GetMapping("/faq_delete.do")
	public String faq_delete(Model m, @RequestParam(defaultValue = "", required = false) String fidx) {
		int result = fm.faq_delete(fidx);
		
		if(result > 0) {
			this.script = "<script>alert('정상적으로 삭제되었습니다.');location.href='./faq_list.do';</script>";
		}
		else {
			this.script = "<script>alert('데이터 오류로 인해 삭제되지 않았습니다.');location.href='./faq_list.do';</script>";
		}
		m.addAttribute("script", this.script);
		return "admin_sc";
	}
	
	//faq 확인 및 수정
	@GetMapping("/faq_view.do")
	public String faq_view(Model m, @RequestParam(defaultValue = "", required = false) String fidx) {
		List<String> view = fm.fag_view(fidx);
		m.addAttribute("view", view);
		
		return "faq_modify";
	}
	@PostMapping("/faq_modify.do")
	public String faq_modfiy(@ModelAttribute("faq") faq_dto faq_dto, Model m) {
		int result = fm.faq_modify(faq_dto);
		
		if(result > 0) {
			this.script = "<script>alert('정상적으로 수정되었습니다.');location.href='./faq_list.do';</script>";
		}
		else {
			this.script = "<script>alert('데이터 오류로 인해 수정되지 않았습니다.');history.go(-1);</script>";
		}
		m.addAttribute("script", this.script);
		return "admin_sc";
	}
}
