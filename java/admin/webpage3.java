package admin;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class webpage3 {
	String script = "";
	SqlSession ss = null;
	PrintWriter pw = null;
	List<air_dto> ad = null;
	
	@Resource(name="product")
	private product_module pm;
	
	//항공 코드 등록
	@GetMapping("/air_newcode.do")
	public String air_newcode(){
		
		return null;
	}
	@PostMapping("/air_newcodeok.do")
	public String air_newcodeok(@ModelAttribute("air") air_dto air_dto, Model m) {
		int result = pm.newcode(air_dto);
		
		if(result > 0) {
			this.script = "<script>alert('정상적으로 생성되었습니다.');location.href='./air_newcode.do';</script>";
		}
		else {
			this.script = "<script>alert('시스템 오류로 인해 코드가 생성되지 않았습니다.');location.href='./air_newcode.do';</script>";
		}
		m.addAttribute("script", this.script);
		return "admin_sc";
	}
	
	//항공 코드 중복 확인
	@GetMapping("/codeck.do")
	public String codeck(@RequestParam(defaultValue = "") String aircode, HttpServletResponse res) throws Exception{
		this.pw = res.getWriter();
		
		if(aircode.equals("") || aircode == "") {
			this.pw.print("error");
		}
		else{
			String result = pm.search_code(aircode);
			this.pw.print(result);
		}
		this.pw.close();
		
		return null;
	}
	
	//항공 코드 리스트 출력
	@RequestMapping("/air_list.do")
	public String air_list(Model m, @RequestParam(defaultValue = "", required = false) String search, @RequestParam(defaultValue = "", required = false) String part) {
		if(search.equals("") && part.equals("")) {
			this.ad = pm.air_list();
		}
		else {
			m.addAttribute("search", search);
			m.addAttribute("part", part);
			
			if(part.equals("1")) {
				this.ad = pm.search_code(search, 1);
			}
			else if(part.equals("2")) {
				this.ad = pm.search_code(search, 2);
			}
		}
		m.addAttribute("ad", this.ad);
		m.addAttribute("ea", this.ad.size());
		return null;
	}
	
	//항공 코드 수정
	@GetMapping("/air_modifycode.do")
	public String air_modifycode(Model m, @RequestParam(defaultValue = "", required = false) String airidx) {
		List<String> modify = pm.modifycode(airidx);
		
		m.addAttribute("modify", modify);
		return null;
	}
	@PostMapping("/air_modifycodeok.do")
	public String air_modifycodeok(@ModelAttribute("air") air_dto air_dto, Model m) {
		int result = pm.modifycodeok(air_dto);
		
		if(result > 0) {
			this.script = "<script>alert('정상적으로 수정되었습니다.');location.href='./air_list.do';</script>";
		}
		else {
			this.script = "<script>alert('시스템 오류로 인해 코드가 수정되지 않았습니다.');location.href='./air_modifycode.do';</script>";
		}
		m.addAttribute("script", this.script);
		return "admin_sc";
	}
	
	//항공 코드 삭제
	@GetMapping("/air_deletecode.do")
	public String air_deletecode(Model m, @RequestParam(defaultValue = "", required = false) String airidx) {
		int result = pm.deletecode(airidx);
		
		if(result > 0) {
			this.script = "<script>alert('정상적으로 삭제되었습니다.');location.href='./air_list.do';</script>";
		}
		else {
			this.script = "<script>alert('데이터 오류로 인해 삭제되지 않았습니다.');location.href='./air_modifycode.do';</script>";
		}
		m.addAttribute("script", this.script);
		return "admin_sc";
	}
	
	//air_code api
	@RequestMapping("/api_air.do")
	public String api_air(Model m) {
		this.ad = pm.air_list();
		JSONArray ja = new JSONArray();
		int w = 0;
		int ea = ad.size();
		while(w < ea) {
			JSONObject jo = new JSONObject();
			jo.put("airidx", ad.get(w).getAiridx());
			jo.put("airplane", ad.get(w).getAirplane());
			jo.put("airname", ad.get(w).getAirname());
			jo.put("aircode", ad.get(w).getAircode());
			jo.put("airflight", ad.get(w).getAirflight());
			jo.put("airuse", ad.get(w).getAiruse());
			ja.add(jo);
			w++;
		}
		String result = ja.toJSONString();
		m.addAttribute("result", result);
		return null;
	}
	
	//신규 항공편 등록
	@GetMapping("/product_insert.do")
	public String product_insert(Model m) {
		this.ad = pm.select_product();
		
		m.addAttribute("ad", ad);
		return "product_new";
	}
	@RequestMapping("/select_name.do")
	public String select_name(Model m, @RequestParam(defaultValue = "", required = false) String airplane) {
		this.ad = pm.select_product2(airplane);
		JSONArray ja = new JSONArray();
		int w = 0;
		while(w < ad.size()) {
			JSONObject jo = new JSONObject();
			jo.put("airname", ad.get(w).getAirname());
			ja.add(jo);
			w++;
		}
		String result = ja.toJSONString();
		m.addAttribute("result", result);
		return "code_load";
	}
	@RequestMapping("/select_code.do")
	public String select_code(Model m, @RequestParam(defaultValue = "", required = false) String airplane, @RequestParam(defaultValue = "", required = false) String airname) {
		air_dto air_dto = new air_dto();
		air_dto.setAirplane(airplane);
		air_dto.setAirname(airname);
		
		this.ad = pm.select_product3(air_dto);
		JSONArray ja = new JSONArray();
		
		int w = 0;
		while(w < ad.size()) {
			JSONObject jo = new JSONObject();
			jo.put("aircode", ad.get(w).getAircode());
			jo.put("airflight", ad.get(w).getAirflight());
			ja.add(jo);
			w++;
		}
		String result = ja.toJSONString();
		m.addAttribute("result", result);
		return "code_load";
	}
	
	@PostMapping("/product_insertok.do")
	public String product_insertok(@ModelAttribute("product") air_dto air_dto, Model m, @RequestParam String aircode) {
		String idx = pm.select_idx(aircode);
		air_dto.setAiridx(idx);
		
		int result = pm.insert_product(air_dto);
		
		if(result > 0) {
			this.script = "<script>alert('정상적으로 생성되었습니다.');location.href='./product_list.do';</script>";
		}
		else {
			this.script = "<script>alert('시스템 오류로 인해 코드가 생성되지 않았습니다.');location.href='./product_insert.do';</script>";
		}
		m.addAttribute("script", this.script);
		return "admin_sc";
	}
	
	//항공편 리스트 출력
	@RequestMapping("/product_list.do")
	public String prodcut_list(Model m, @RequestParam(defaultValue = "", required = false) String search, @RequestParam(defaultValue = "", required = false) String part) {
		if(search.equals("") && part.equals("")) {
			this.ad = pm.product_list();
		}
		else {
			m.addAttribute("search", search);
			m.addAttribute("part", part);
			
			if(part.equals("1")) {
				this.ad = pm.search_air(search, 1);
			}
			else {
				this.ad = pm.search_air(search, 2);
			}
		}
		m.addAttribute("ad", this.ad);
		m.addAttribute("ea", this.ad.size());
		return null;
	}
}
