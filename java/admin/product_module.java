package admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("product")
public class product_module {
	@Resource(name="sqlSession2")
	private SqlSessionTemplate st;
	
	//항공 코드 등록
	public int newcode(air_dto air_dto) {
		int result = st.insert("airDB.air_newcode", air_dto);
		
		return result;
	}
	
	//항공 코드 중복 확인
	public String search_code(String aircode) {
		int result = st.selectOne("airDB.check_code", aircode);
		String msg = "";

		if(result > 0) {
			msg = "no";
		}
		else {
			msg = "ok";
		}
		return msg;
	}
	
	//항공 코드 리스트 출력
	public List<air_dto> air_list(){
		List<air_dto> ad = new ArrayList<air_dto>();
		ad = st.selectList("airDB.air_list");
		
		return ad;
	}
	
	//항공 코드 리스트 - 검색어 입력
	public List<air_dto> search_code(String search, int part){
		List<air_dto> ad = new ArrayList<air_dto>();
		Map<String, String> m = new HashMap<String, String>();
		m.put("search", search);
		m.put("part", Integer.toString(part));
		ad = st.selectList("airDB.search_code", m);
		
		return ad;
	}
	
	//항공 코드 수정
	public ArrayList<String> modifycode(String airidx) {
		ArrayList<String> al = new ArrayList<String>();
		air_dto ad = st.selectOne("airDB.air_viewCode", airidx);
		al.add(ad.getAiridx());
		al.add(ad.getAirplane());
		al.add(ad.getAirname());
		al.add(ad.getAircode());
		al.add(ad.getAirflight());
		al.add(ad.getAiruse());
		
		return al;
	}
	public int modifycodeok(air_dto air_dto) {
		int result = st.update("airDB.air_modifycode", air_dto);
		
		return result;
	}
	
	//항공 코드 삭제
	public int deletecode(String airidx) {
		int result = st.delete("airDB.air_deletecode", airidx);
		
		return result;
	}
	
	//신규 항공편 등록
	public List<air_dto> select_product(){
		List<air_dto> ad = st.selectList("airDB.product_select1");
		 
		return ad;
	}
	public List<air_dto> select_product2(String airplane){
		List<air_dto> ad = st.selectList("airDB.product_select2", airplane);
		 
		return ad;
	}
	public List<air_dto> select_product3(air_dto air_dto){
		List<air_dto> ad = st.selectList("airDB.product_select3", air_dto);
		
		return ad;
	}
	public int insert_product(air_dto air_dto) {
		int result = st.insert("airDB.product_new", air_dto);
		
		return result;
	}
	public String select_idx(String aircode) {
		String idx = st.selectOne("airDB.select_idx", aircode);
		
		return idx;
	}
	
	//항공편 리스트 출력
	public List<air_dto> product_list(){
		List<air_dto> pd = new ArrayList<air_dto>();
		pd = st.selectList("airDB.product_list");
		
		return pd;
	}
	
	//항공편 리스트 - 검색어 입력
	public List<air_dto> search_air(String search, int part){
		List<air_dto> pd = new ArrayList<air_dto>();
		Map<String, String> m = new HashMap<String, String>();
		m.put("search", search);
		m.put("part", Integer.toString(part));
		pd = st.selectList("airDB.search_air", m);
		
		return pd;
	}
}
