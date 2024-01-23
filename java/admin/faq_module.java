package admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("faq")
public class faq_module {
	@Resource(name="sqlSession4")
	private SqlSessionTemplate st;
	
	//faq 등록
	public int faq_insert(faq_dto faq_dto) {
		int result = st.insert("faqDB.faq_write", faq_dto);
		
		return result;
	}
	
	//faq 리스트 출력
	public List<faq_dto> faq_list(){
		List<faq_dto> fd = new ArrayList<faq_dto>();
		fd = st.selectList("faqDB.faq_list");
		
		return fd;
	}
	
	//faq 리스트 - 검색어 입력
	public List<faq_dto> search_faq(String search){
		List<faq_dto> fd = new ArrayList<faq_dto>();
		Map<String, String> m = new HashMap<String, String>();
		m.put("search", search);
		fd = st.selectList("faqDB.search_faq", m);
		
		return fd;
	}
	
	//faq 삭제
	public int faq_delete(String fidx) {
		int result = st.delete("faqDB.faq_delete", fidx);
		
		return result;
	}
	
	//faq 확인 및 수정
	public ArrayList<String> fag_view(String fidx){
		ArrayList<String> al = new ArrayList<String>();
		faq_dto fd = st.selectOne("faqDB.faq_view", fidx);		
		al.add(fd.getFidx());
		al.add(fd.getFsubject());
		al.add(fd.getFwriter());
		al.add(fd.getFtext());
		
		return al;
	}
	public int faq_modify(faq_dto faq_dto) {
		int result = st.update("faqDB.faq_modify", faq_dto);
		
		return result;
	}
}
