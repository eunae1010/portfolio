package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class webpage {
	int success_int = 0;
	String success_str = "";
	String script = "";
	
	@Autowired
	BasicDataSource dataSource;
	
	//관리자 등록
	@RequestMapping("/joinok.do")
	public String joinok(Model m,
			@RequestParam String aid,
			@RequestParam String apass,
			@RequestParam String aname,
			@RequestParam String aemail,
			@RequestParam String ahp,
			@RequestParam String apart,
			@RequestParam String aposition) {
		security se = new security(apass);
		String password = se.md5_se();
		
		db_insert di = new db_insert(dataSource);
		add_dto ad = new add_dto();
		ad.setAid(aid);
		ad.setAname(aname);
		ad.setAemail(aemail);
		ad.setAhp(ahp);
		ad.setApart(apart);
		ad.setAposition(aposition);
		
		this.success_int = di.user_insert(password, ad);
		
		if(this.success_int > 0) {
			this.script = "<script>alert('관리자 등록이 정상적으로 완료되었습니다. 단, 전산 담당자 승인 후 로그인 가능합니다.');location.href='./index.jsp';</script>";
		}
		else {
			this.script = "<script>alert('관리자 등록에 문제가 발생하였습니다.');location.href='./add_master.jsp';</script>";
		}
		m.addAttribute("script", this.script);
		return "admin_sc";
	}
	
	//아이디 중복 확인
	@GetMapping("/idck.do")
	public String id_ajax(@RequestParam String aid, Model m) {
		String msg = null;
		
		try {
			Connection con = dataSource.getConnection();
			String sql = "select count(*) as ctn from addmaster where aid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, aid);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				if(rs.getString("ctn").equals("0")) {
					msg = "0";
				}
				else {
					msg = "1";
				}
			}
			rs.close();
			ps.close();
			con.close();
		}
		catch(Exception e) {
			msg = "error";
		}
		m.addAttribute("msg", msg);
		return null;
	}
	
	//관리자 리스트 출력
	@GetMapping("/admin_main.do")
	public void admin_main() {
		
	}
	@RequestMapping("/api_list.do")
	public String admin_list(Model m) {
		api_select as = new api_select(dataSource);
		String datalist = as.api();
		m.addAttribute("datalist", datalist);
		return null;
	}
	
	//관리자 승인
	@GetMapping("/adminok.do")
	public String adminok(Model m, @RequestParam(defaultValue = "") String aidx) {
		if(aidx.equals("")) {
			this.script = "<script>alert('올바른 값이 전달되지 않았습니다.');history.go(-1);</script>";
		}
		else {
			db_update du = new db_update(dataSource);
			this.success_str = du.adminuse(aidx);
			
			if(this.success_str.equals("ok")) {
				this.script = "<script>alert('승인되었습니다.');location.href='admin_main.do';</script>";
			}
			else {
				this.script = "<script>alert('데이터 오류가 발생했습니다.');location.href='admin_main.do';</script>";
			}
		}
		m.addAttribute("script", script);
		return "admin_sc";
	}
	@GetMapping("/adminno.do")
	public String adminno(Model m, @RequestParam(defaultValue = "") String aidx) {
		if(aidx.equals("")) {
			this.script = "<script>alert('올바른 값이 전달되지 않았습니다.');history.go(-1);</script>";
		}
		else {
			db_update du = new db_update(dataSource);
			this.success_str = du.adminuse_x(aidx);
			
			if(this.success_str.equals("ok")) {
				this.script = "<script>alert('미승인되었습니다.');location.href='admin_main.do';</script>";
			}
			else {
				this.script = "<script>alert('데이터 오류가 발생했습니다.');location.href='admin_main.do';</script>";
			}
		}
		m.addAttribute("script", script);
		return "admin_sc";
	}
	
	//로그인
	@PostMapping("/loginok.do")
	public String loginok(HttpServletRequest req, Model m, @RequestParam String aid, @RequestParam String apass) {
		db_select ds = new db_select(dataSource);
		this.success_str = ds.userck(aid, apass);
		this.script = "";
		if(this.success_str == null || this.success_str == "") {
			this.script = "<script>alert('아이디 및 패스워드를 확인하세요.');history.go(-1);</script>";
		}
		else {
			String userinfo[] = this.success_str.split(",");
			db_update du = new db_update(dataSource);
			
			if(userinfo[0].equals("O")) {
				if(userinfo[3].equals("N")) {
					this.script = "<script>alert('미승인 회원입니다.');history.go(-1);</script>";
				}
				else {
					HttpSession session = req.getSession();
					session.setAttribute("aid", userinfo[1]);
					session.setAttribute("aname", userinfo[2]);
					
					this.success_str = du.admin_reset(aid);
					this.script = "<script>alert('로그인되셨습니다.');location.href='./admin_main.do';</script>";
				}
			}
			else if(userinfo[0].equals("X")) {
				if(Integer.parseInt(userinfo[3]) > 4) {
					this.success_str = du.adminuse_x(userinfo[4]);
					this.script = "<script>alert('5회 이상 패스워드 오류로 로그인 차단되셨습니다. 센터에 문의하세요.');history.go(-1);</script>";
				}
				else {
					this.success_str = du.admin_num(aid);
					this.script = "<script>alert('패스워드를 확인하세요.');history.go(-1);</script>";
				}
				
			}
		}
		m.addAttribute("script", this.script);
		return "admin_sc";
	}
	
	//로그아웃
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest req, Model m) {
		HttpSession session = req.getSession();
		session.removeAttribute("aid");
		session.removeAttribute("aname");
		this.script = "";
		this.script = "<script>alert('로그아웃되셨습니다.');location.href='./index.jsp';</script>";
		m.addAttribute("script", this.script);
		return "admin_sc";
	}
	
	//copyright
	@RequestMapping("/api_footer.do")
	public String admin_footer(Model m) {
		api_select as = new api_select(dataSource);
		String datalist = as.api_siteinfo();
		m.addAttribute("datalist", datalist);
		return null;
	}
}
