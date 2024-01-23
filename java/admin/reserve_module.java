package admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("reserve")
public class reserve_module {
	@Resource(name="sqlSession3")
	private SqlSessionTemplate st;
	
	//좌석 및 예매 등록
	public int seat_insert(air_dto air_dto) {
		int result = st.insert("seatDB.seat_insert", air_dto);
		
		return result;
	}
	
	//좌석 및 예매 설정 출력
	public List<air_dto> seat_list(){
		List<air_dto> ad = new ArrayList<air_dto>();
		ad = st.selectList("seatDB.seat_list");
		
		return ad;
	}
	public List<air_dto> seat_view(){
		List<air_dto> ad = new ArrayList<air_dto>();
		ad = st.selectList("seatDB.seat_view");
		
		return ad;
	}
	public int seat_update(air_dto air_dto){
		int result = st.update("seatDB.seat_update", air_dto);
		
		return result;
	}
	
	//좌석 및 예매 설정 - 검색어 입력
	public List<air_dto> search_seat(String search, int part){
		List<air_dto> ad = new ArrayList<air_dto>();
		Map<String, String> m = new HashMap<String, String>();
		m.put("search", search);
		m.put("part", Integer.toString(part));
		ad = st.selectList("seatDB.search_seat", m);
		
		return ad;
	}
	
	//예매 리스트 출력
	public List<air_dto> ticketing_list(){
		List<air_dto> ad = new ArrayList<air_dto>();
		ad = st.selectList("seatDB.ticketing_list");
		
		return ad;
	}
	
	//예매 리스트 - 검색어 입력
	public List<air_dto> search_list(String search, int part){
		List<air_dto> ad = new ArrayList<air_dto>();
		Map<String, String> m = new HashMap<String, String>();
		m.put("search", search);
		m.put("part", Integer.toString(part));
		ad = st.selectList("seatDB.search_list", m);
		
		return ad;
	}
	
	//예매 취소
	public int ticket_cancel(String airidx) {
		int result = st.delete("seatDB.ticket_cancel", airidx);
		
		return result;
	}
}
