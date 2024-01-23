package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.commons.dbcp.BasicDataSource;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class api_select {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String result = null;
	String sql = null;
	
	public api_select(BasicDataSource dataSource) {
		try {
			this.con = dataSource.getConnection();
		}
		catch(Exception e) {
			System.out.println("Database 접속 오류");
		}
	}
	
	@SuppressWarnings("unchecked")
	public String api() {
		try {
			this.sql = "select * from addmaster order by aidx";
			this.ps = this.con.prepareStatement(sql);
			this.rs = this.ps.executeQuery();
			
			JSONArray ja = new JSONArray();
			while(this.rs.next()) {
				JSONObject jo = new JSONObject();
				jo.put("aidx", this.rs.getString("aidx"));
				jo.put("aname", this.rs.getString("aname"));
				jo.put("aid", this.rs.getString("aid"));
				jo.put("ahp", this.rs.getString("ahp"));
				jo.put("aemail", this.rs.getString("aemail"));
				jo.put("apart", this.rs.getString("apart"));
				jo.put("aposition", this.rs.getString("aposition"));
				jo.put("adate", this.rs.getString("adate"));
				jo.put("ause", this.rs.getString("ause"));
				ja.add(jo);
			}
			this.result = ja.toJSONString();
			
			this.rs.close();
			this.ps.close();
			this.con.close();
		}
		catch(Exception e) {
			System.out.println("sql 문법 오류");
		}
		return this.result;
	}
	
	@SuppressWarnings("unchecked")
	public String api_siteinfo() {
		try {
			this.sql = "select * from siteinfo order by sidx desc limit 0,1";
			this.ps = this.con.prepareStatement(sql);
			this.rs = this.ps.executeQuery();
			
			JSONArray ja = new JSONArray();
			while(this.rs.next()) {
				JSONObject jo = new JSONObject();
				jo.put("sidx", this.rs.getString("sidx"));
				jo.put("scompany", this.rs.getString("scompany"));
				jo.put("scorp_num", this.rs.getString("scorp_num"));
				jo.put("sname", this.rs.getString("sname"));
				jo.put("stel", this.rs.getString("stel"));
				jo.put("smail_order", this.rs.getString("smail_order"));
				jo.put("sdtc_num", this.rs.getString("sdtc_num"));
				jo.put("spost", this.rs.getString("spost"));
				jo.put("saddress", this.rs.getString("saddress"));
				jo.put("sinfo_name", this.rs.getString("sinfo_name"));
				jo.put("sinfo_email", this.rs.getString("sinfo_email"));
				ja.add(jo);
			}
			this.result = ja.toJSONString();
			
			this.rs.close();
			this.ps.close();
			this.con.close();
		}
		catch(Exception e) {
			System.out.println("sql 문법 오류");
		}
		return this.result;
	}
}
