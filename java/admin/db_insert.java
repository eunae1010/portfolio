package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;

import org.apache.commons.dbcp.BasicDataSource;


public class db_insert {
	Connection con = null;
	PreparedStatement ps = null;
	int result = 0;
	
	public db_insert(BasicDataSource dataSource) {
		try {
			this.con = dataSource.getConnection();
		}
		catch(Exception e) {
			System.out.println("Database 접속 오류");
		}
	}
	public int user_insert(String password, add_dto ad) {
		try {
			String sql = "insert into addmaster values ('0',?,?,?,?,?,?,?,now(),'N','0')";
			this.ps = this.con.prepareStatement(sql);
			this.ps.setString(1, ad.getAid());
			this.ps.setString(2, password);
			this.ps.setString(3, ad.getAname());
			this.ps.setString(4, ad.getAemail());
			this.ps.setString(5, ad.getAhp().replaceAll(",",""));
			this.ps.setString(6, ad.getApart());
			this.ps.setString(7, ad.getAposition());
			this.result = this.ps.executeUpdate();
			
			this.ps.close();
			this.con.close();
		}
		catch (Exception e) {
			System.out.println("insert sql 문법 오류");
		}
		return this.result;
	}
}
