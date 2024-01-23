package admin;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class webpage2 {
	String script = "";
	SqlSession ss = null;
	PrintWriter pw = null;
	
	@Inject
	private SqlSessionFactory sqlSessionFactory;
	
	@Resource SqlSessionTemplate sqlSession;
	
	//사이트 기본 설정
	@GetMapping("/admin_siteinfo.do")
	public String admin_siteinfo(Model m) {
		try {
			this.ss = sqlSessionFactory.openSession();
			List<info_dto> id = this.ss.selectList("adminDB.info_select");
			m.addAttribute("id", id);
			m.addAttribute("ea", id.size());
		}
		catch(Exception e) {
			System.out.println("Database 접속 오류");
		}
		finally{
			this.ss.close();
		}
		return null;
	}
	@PostMapping("/admin_siteok.do")
	public String admin_siteinfook(Model m, @ModelAttribute("info") info_dto info_dto) {
		try {
			this.ss = sqlSessionFactory.openSession();
			int result = this.ss.insert("adminDB.site_info", info_dto);
			
			if(result > 0) {
				this.script = "<script>location.href='admin_siteinfo.do';</script>";
			}
			else {
				this.script = "<script>alert('사이트 정보 설정에 문제가 발생하였습니다.');location.href='admin_siteinfo.do';</script>";
			}
		}
		catch(Exception e) {
			System.out.println("Database 접속 오류");
		}
		finally {
			this.ss.close();
		}
		m.addAttribute("script", this.script);
		return "admin_sc";
	}
	
	//공지 등록
	@GetMapping("/notice_write.do")
	public String notice_write() {
		
		return null;
	}
	@PostMapping("/notice_writeok.do")
	public String notice_writeok(Model m, @ModelAttribute("notice") notice_dto notice_dto, MultipartFile userfile) {
		if(notice_dto.getNoutput() == null) {
			notice_dto.setNoutput("N");
		}
		else {
			notice_dto.setNoutput("Y");
		}
		
		FTPClient ftp = new FTPClient();
		ftp.setControlEncoding("utf-8");
		FTPClientConfig cf = new FTPClientConfig();
		
		try {
			String filename = userfile.getOriginalFilename();
			this.ss = sqlSessionFactory.openSession();
			int result = 0;
			
			if(filename == "") {
				result = this.ss.insert("adminDB.notice_write", notice_dto);
				
				try {
					if(result > 0) {
						this.script = "<script>alert('정상적으로 업로드되었습니다.');location.href='./notice_list.do';</script>";
					}
					else {
						this.script = "<script>alert('데이터 오류로 인해 업로드되지 않았습니다.');history.go(-1);</script>";
					}
				}
				catch(Exception e) {
					System.out.println("Database 접속 오류");
				}
				finally {
					this.ss.close();
				}
			}
			else {
				String host = "";
				String user = "";
				String pass = "";
				int port = 21;
				ftp.configure(cf);
				ftp.connect(host,port);
				long filesize = userfile.getSize();
				
				if(filesize > 2097152) {
					this.script = "<script>alert('첨부파일은 2MB 이하만 가능합니다.');history.go(-1);</script>";
				}
				else {
					if(ftp.login(user, pass)) {
						ftp.setFileType(FTP.BINARY_FILE_TYPE);
						result = ftp.getReplyCode();
						
						Date today = new Date();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
						String day = sdf.format(today);
						
						boolean ok = ftp.storeFile("/www/" + day + "_" + filename, userfile.getInputStream());
						notice_dto.setNattach(day + "_" + filename);
						result = this.ss.insert("adminDB.notice_write", notice_dto);
						
						if(ok == true && result > 0) {
							this.script = "<script>alert('정상적으로 업로드되었습니다.');location.href='./notice_list.do';</script>";
						}
						else {
							this.script = "<script>alert('데이터 오류로 인해 업로드되지 않았습니다.');history(-1);</script>";
						}
					}
					else {
						System.out.println("FTP 정보가 올바르지 않습니다.");
					}
				}
			}
		}
		catch(Exception e) {
			System.out.println("FTP 접속 정보 및 접속 사용자 아이디,패스워드 오류");
		}
		finally {
			this.ss.close();

			try {
				ftp.disconnect();
			}
			catch(Exception ee) {
				System.out.println("서버 루프로 인해 접속종료 장애 발생");
			}
		}
		m.addAttribute("script", this.script);
		return "admin_sc";
	}
	
	//공지 리스트 출력
	@GetMapping("/notice_list.do")
	public String notice_list(Model m, @RequestParam(defaultValue = "", required = false) String nidx) {
		List<notice_dto> nd = null;
		
		try {
			this.ss = sqlSessionFactory.openSession();
			nd = this.ss.selectList("adminDB.notice_list");
			m.addAttribute("nd", nd);
		}
		catch (Exception e) {
			System.out.println("Databse 접속 오류");
		}
		finally {
			this.ss.close();
		}
		return null;
	}
	
	//공지 리스트 선택 삭제
	@GetMapping("/notice_listdel.do")
	public String notice_listdel(Model m, @RequestParam(defaultValue = "", required = false) String nidx) {
		try {
			this.ss = sqlSessionFactory.openSession();
			int result = this.ss.delete("adminDB.notice_listdel", nidx);
			
			if(result > 0) {
				this.script = "<script>alert('정상적으로 삭제되었습니다.');location.href='./notice_list.do';</script>";
			}
			else {
				this.script = "<script>alert('데이터 오류로 인해 삭제되지 않았습니다.');location.href='./notice_list.do';</script>";
			}
		}
		catch(Exception e) {
			System.out.println("Databse 접속 오류");
		}
		finally {
			this.ss.close();
		}
		m.addAttribute("script", this.script);
		return "admin_sc";
	}
	
	//1개의 공지 출력
	@GetMapping("/notice_view.do")
	public String notice_view(Model m, HttpServletRequest req, @RequestParam(defaultValue = "", required = false) String nidx, @RequestParam(defaultValue = "", required = false) String num) {
		if(nidx.equals("") || nidx == "") {
			this.script = "<script>alert('정상적인 접근이 아닙니다.');location.href='./notice_list.do';</script>";
		}
		else {
			try {
				this.script = "";
				this.ss = sqlSessionFactory.openSession();
				notice_dto nd = this.ss.selectOne("adminDB.notice_view", nidx);
				ArrayList<String> al = new ArrayList<String>();
				al.add(nd.getNidx());
				al.add(nd.getNoutput());
				al.add(nd.getNsubject());
				al.add(nd.getNwriter());
				al.add(nd.getNattach());
				al.add(nd.getNtext());
				al.add(nd.getNdate());
				m.addAttribute("al", al);

				int result = this.ss.update("adminDB.hits_update", nidx);
			}
			catch(Exception e) {
				System.out.println("Databse 접속 오류");
			}
			finally {
				this.ss.close();
			}
		}
		m.addAttribute("script", this.script);
		req.setAttribute("num", num);
		return "notice_view";
	}
	
	//공지 수정
	@GetMapping("/notice_modify.do")
	public String notice_modify(Model m, @RequestParam(defaultValue = "", required = false) String nidx) {
		if(nidx.equals("") || nidx == "") {
			this.script = "<script>alert('정상적인 접근이 아닙니다.');location.href='./index.jsp';</script>";
		}
		else {
			this.script = "";
			
			try {
				this.ss = sqlSessionFactory.openSession();
				notice_dto nd = this.ss.selectOne("adminDB.notice_view", nidx);
				ArrayList<String> al = new ArrayList<String>();
				al.add(nd.getNidx());
				al.add(nd.getNoutput());
				al.add(nd.getNsubject());
				al.add(nd.getNwriter());
				al.add(nd.getNattach());
				al.add(nd.getNtext());
				m.addAttribute("al", al);
			}
			catch(Exception e) {
				System.out.println("Databse 접속 오류");
			}
			finally {
				this.ss.close();
			}
		}
		m.addAttribute("script", this.script);
		return null;
	}
	@PostMapping("/notice_modifyok.do")
	public String notice_modifyok(Model m, @ModelAttribute("notice") notice_dto notice_dto, MultipartFile userfile) {
		if(notice_dto.getNoutput() == null) {
			notice_dto.setNoutput("N");
		}
		else {
			notice_dto.setNoutput("Y");
		}
		
		FTPClient ftp = new FTPClient();
		ftp.setControlEncoding("utf-8");
		FTPClientConfig cf = new FTPClientConfig();
		
		try {
			String filename = userfile.getOriginalFilename();
			this.ss = sqlSessionFactory.openSession();
			int result = 0;
			
			if(filename == "") {
				result = this.ss.update("adminDB.notice_modify", notice_dto);
				
				try {
					if(result > 0) {
						this.script = "<script>alert('정상적으로 수정되었습니다.');location.href='./notice_list.do';</script>";
					}
					else {
						this.script = "<script>alert('데이터 오류로 인해 업로드되지 않았습니다.');history.go(-1);</script>";
					}
				}
				catch(Exception e) {
					System.out.println("Database 접속 오류");
				}
				finally {
					this.ss.close();
				}
			}
			else {
				String host = "";
				String user = "";
				String pass = "";
				int port = 21;
				ftp.configure(cf);
				ftp.connect(host,port);
				long filesize = userfile.getSize();
				
				if(filesize > 2097152) {
					this.script = "<script>alert('첨부파일은 2MB 이하만 가능합니다.');history.go(-1);</script>";
				}
				else {
					if(ftp.login(user, pass)) {
						ftp.setFileType(FTP.BINARY_FILE_TYPE);
						result = ftp.getReplyCode();
						
						Date today = new Date();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
						String day = sdf.format(today);
						
						boolean ok = ftp.storeFile("/www/" + day + "_" + filename, userfile.getInputStream());
						notice_dto.setNattach(day + "_" + filename);
						result = this.ss.update("adminDB.notice_fileUp", notice_dto);
						
						if(ok == true && result > 0) {
							this.script = "<script>alert('정상적으로 수정되었습니다.');location.href='./notice_list.do';</script>";
						}
						else {
							this.script = "<script>alert('데이터 오류로 인해 업로드되지 않았습니다.');history(-1);</script>";
						}
					}
					else {
						System.out.println("FTP 정보가 올바르지 않습니다.");
					}
				}
			}
		}
		catch(Exception e) {
			System.out.println("FTP 접속 정보 및 접속 사용자 아이디,패스워드 오류");
		}
		finally {
			this.ss.close();

			try {
				ftp.disconnect();
			}
			catch(Exception ee) {
				System.out.println("서버 루프로 인해 접속종료 장애 발생");
			}
		}
		m.addAttribute("script", this.script);
		return "admin_sc";
	}
	
	//공지 삭제
	@GetMapping("/notice_delete.do")
	public String notice_delete(Model m, @RequestParam(defaultValue = "", required = false) String nidx, @RequestParam(defaultValue = "", required = false) String url) {
		if(nidx.equals("") || nidx == "") {
			this.script = "<script>alert('정상적인 접근이 아닙니다.');location.href='./notice_list.do';</script>";
		}
		else {
			FTPClient ftp = new FTPClient();
			ftp.setControlEncoding("utf-8");
			FTPClientConfig cf = new FTPClientConfig();
			
			try {
				this.ss = sqlSessionFactory.openSession();
				int result = 0;

				String host = "";
				String user = "";
				String pass = "";
				int port = 21;
				ftp.configure(cf);
				ftp.connect(host,port);
				
				if(ftp.login(user, pass)) {
					boolean delok = ftp.deleteFile("/www/" + url);
					notice_dto notice_dto = new admin.notice_dto();
					notice_dto.setNattach(url);
					result = this.ss.update("adminDB.file_update", nidx);
					result = this.ss.delete("adminDB.notice_delete", nidx);
					
					if(delok == true && result > 0) {
						this.script = "<script>alert('정상적으로 삭제되었습니다.');location.href='./notice_list.do';</script>";
					}
					else {
						this.script = "<script>alert('데이터 오류로 인해 삭제되지 않았습니다.');location.href='./notice_list.do';</script>";
					}
				}
				else {
					System.out.println("FTP 접속 정보 및 접속 사용자 아이디,패스워드 오류");
				}
			}
			catch(Exception e) {
				System.out.println("Database 접속 오류");
			}
			finally {
				this.ss.close();
			}
		}
		m.addAttribute("script", this.script);
		return "admin_sc";
	}
	
	//공지 첨부파일 삭제
	@GetMapping("/file_delete.do")
	public String file_delete(HttpServletResponse res, @ModelAttribute("notice") notice_dto notice_dto, @RequestParam(defaultValue = "", required = false) String nidx, @RequestParam(defaultValue = "", required = false) String url) {
		FTPClient ftp = new FTPClient();
		ftp.setControlEncoding("utf-8");
		FTPClientConfig cf = new FTPClientConfig();
		
		String msg = "no";
		
		try {
			this.ss = sqlSessionFactory.openSession();
			this.pw = res.getWriter();
			int result = 0;

			String host = "";
			String user = "";
			String pass = "";
			int port = 21;
			ftp.configure(cf);
			ftp.connect(host,port);
			
			if(ftp.login(user, pass)) {
				boolean delok = ftp.deleteFile("/www/" + url);
				notice_dto.setNattach(url);
				result = this.ss.update("adminDB.file_update", nidx);

				if(delok == true && result > 0) {
					msg = "ok";
				}
				pw.print(msg);
			}
			else {
				System.out.println("FTP 접속 정보 및 접속 사용자 아이디,패스워드 오류");
			}
		}
		catch (Exception e) {
			System.out.println("FTP 정보가 올바르지 않습니다.");
		}
		finally {
			this.ss.close();

			try {
				ftp.disconnect();
			}
			catch(Exception ee) {
				System.out.println("CDN 서버 지연으로 접속이 해제되지 않습니다.");
			}
		}		
		return null;
	}
}
