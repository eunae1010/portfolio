package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.commons.dbcp.BasicDataSource;

public class db_select {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String result = null;
	
	public db_select(BasicDataSource dataSource) {
		try {
			this.con = dataSource.getConnection();
		}
		catch(Exception e) {
			System.out.println("Database 접속 오류");
		}
	}
	public String userck(String aid, String apss) {
		security se = new security(apss);
		String pass = se.md5_se();
		
		try {
			String sql = "select * from addmaster where aid=?";
			this.ps = this.con.prepareStatement(sql);
			this.ps.setString(1, aid);
			this.rs = this.ps.executeQuery();
			
			while(this.rs.next()) {
				if(aid.equals(this.rs.getString("aid"))) {
					if(pass.equals(this.rs.getString("apass"))) {
						this.result = "O" + "," + this.rs.getString("aid") + "," + this.rs.getString("aname") + "," + this.rs.getString("ause");
					}
					else {
						this.result = "X" + "," + this.rs.getString("aid") + "," + this.rs.getString("aname") + "," + this.rs.getString("anum") + "," + this.rs.getString("aidx");
					}
				}
			}
			this.rs.close();
			this.ps.close();
			this.con.close();
		}
		catch(Exception e) {
			System.out.println("select sql 문법 오류");
		}
		return this.result;
	}
}
