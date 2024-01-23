package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;

import org.apache.commons.dbcp.BasicDataSource;

public class db_update {
	Connection con = null;
	PreparedStatement ps = null;
	String result = null;
	
	public db_update(BasicDataSource dataSource) {
		try {
			this.con = dataSource.getConnection();
		}
		catch(Exception e) {
			System.out.println("Database 접속 오류");
		}
	}
	public String admin_num(String aid) {
		try {
			String sql = "update addmaster set anum = anum + 1 where aid=?";
			this.ps = this.con.prepareStatement(sql);
			this.ps.setString(1, aid);
			int success = this.ps.executeUpdate();
			
			if(success > 0) {
				this.result = "ok";
			}
			else {
				this.result = "no";
			}
			this.ps.close();
			this.con.close();
		}
		catch(Exception e) {
			System.out.println("update sql 문법 오류");
		}
		return this.result;
	}
	public String admin_reset(String aid) {
		try {
			String sql = "update addmaster set anum='0' where aid=?";
			this.ps = this.con.prepareStatement(sql);
			this.ps.setString(1, aid);
			int success = this.ps.executeUpdate();
			
			this.ps.close();
			this.con.close();
		}
		catch(Exception e) {
			System.out.println("update sql 문법 오류");
		}
		return this.result;
	}
	public String adminuse(String aidx) {
		try {
			String sql = "update addmaster set ause='Y' where aidx=?";
			this.ps = this.con.prepareStatement(sql);
			this.ps.setString(1, aidx);
			int success = this.ps.executeUpdate();
			
			if(success > 0) {
				this.result = "ok";
			}
			else {
				this.result = "no";
			}
			this.ps.close();
			this.con.close();
		}
		catch(Exception e) {
			System.out.println("update sql 문법 오류");
		}
		return this.result;
	}
	public String adminuse_x(String aidx) {
		try {
			String sql = "update addmaster set ause='N' where aidx=?";
			this.ps = this.con.prepareStatement(sql);
			this.ps.setString(1, aidx);
			int success = this.ps.executeUpdate();
			
			if(success > 0) {
				this.result = "ok";
			}
			else {
				this.result = "no";
			}
			this.ps.close();
			this.con.close();
		}
		catch(Exception e) {
			System.out.println("update sql 문법 오류");
		}
		return this.result;
	}
}
