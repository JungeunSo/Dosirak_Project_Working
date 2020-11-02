package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;

public class BbsDAO {

	Connection con;
	ResultSet rs;
	public BbsDAO() {
		try {
			/* MariaDB*/ 
			String dburl="jdbc:mariadb://localhost:3306/sample?serverTimezone=UTC";
			String dbid="root";
			String dbpass="asdfg12!@";
			Class.forName("org.mariadb.jdbc.Driver");


			/* Mysql
			String dburl="jdbc:mysql://localhost:3306/sample?serverTimezone=UTC";
			String dbid="root";
			String dbpass="1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			 */

			con=DriverManager.getConnection(dburl, dbid, dbpass);

		} catch (Exception e){
			e.printStackTrace();		
		}
	}
	public String getDate() {
		String sql="select now()";
		try {
			PreparedStatement prsmt=con.prepareStatement(sql);
			rs=prsmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {

		}
		return "";
	}

	public int getNext() {
		String sql="select bbsid from bbs order by bbsid desc";
		try {
			PreparedStatement prsmt=con.prepareStatement(sql);
			rs=prsmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1)+1;
			} else { return 1;}
		} catch (Exception e) {

		}
		return -1;
	}

	public int getNext2pg() {
		String sql="SELECT count(bbsid) FROM bbs where (bbsavailable is null)";
		try {
			PreparedStatement prsmt=con.prepareStatement(sql);
			rs=prsmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1)+1;
			} else { return 1;}
		} catch (Exception e) {

		}
		return -1;
	}

	public int write(String bbstitle, String bbscontent, String userid) {
		String sql="insert into bbs (bbsid,bbstitle,userid,bbsdate,bbscontent,bbscount) values (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement prsmt=con.prepareStatement(sql);
			prsmt.setInt(1, getNext());
			prsmt.setString(2, bbstitle);
			prsmt.setString(3, userid);
			prsmt.setString(4, getDate());
			prsmt.setString(5, bbscontent);
			prsmt.setInt(6, 0);

			return prsmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();	
		}
		return -1;
	}

	public LinkedList<Bbs> getList(int pageNumber){
		String sql="select * from bbs where bbsid < ? and bbsavailable is null order by bbsid desc limit 10";
		LinkedList<Bbs> list=new LinkedList<Bbs>();
		try {
			PreparedStatement prsmt=con.prepareStatement(sql);
			prsmt.setInt(1,  getNext()-(pageNumber-1)*10);
			rs=prsmt.executeQuery();
			while (rs.next()) {
				Bbs bbs=new Bbs();
				bbs.setBbscontent(rs.getString("bbscontent"));
				bbs.setBbscount(rs.getInt("bbscount"));
				bbs.setBbsdate(rs.getString("bbsdate"));
				bbs.setBbsid(rs.getInt("bbsid"));
				bbs.setBbstitle(rs.getString("bbstitle"));
				bbs.setUserid(rs.getString("userid"));
				list.add(bbs);
			}	
		} catch (Exception e) {

		}		
		return list;		
	}

	public boolean nextPage(int pageNumber) {
		String sql="select * from bbs where bbsid < ? and bbsavailable is null";
		try {
			PreparedStatement prsmt=con.prepareStatement(sql);
			prsmt.setInt(1,  getNext()-(pageNumber-1)*10);
			rs=prsmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {

		}		
		return false;			
	}
	public Bbs getView(int bbsid){
		String sql="select * from bbs where bbsid = ?";
		try {
			PreparedStatement prsmt=con.prepareStatement(sql);
			prsmt.setInt(1,  bbsid);
			rs=prsmt.executeQuery();
			Bbs bbs=new Bbs();

			if(rs.next()) {
				bbs.setBbscontent(rs.getString("bbscontent"));
				bbs.setBbscount(rs.getInt("bbscount"));
				bbs.setBbsdate(rs.getString("bbsdate"));
				bbs.setBbsid(rs.getInt("bbsid"));
				bbs.setBbstitle(rs.getString("bbstitle"));
				bbs.setUserid(rs.getString("userid"));
				return bbs;
			}else {
			}

		} catch (Exception e) {

		}		
		return null;		
	}

	public int delete(int bbsid) {
		String sql="update bbs set bbsavailable = now() where bbsid = ?";
		try {
			PreparedStatement prsmt=con.prepareStatement(sql);
			prsmt.setInt(1, bbsid);

			return prsmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();	
		}
		return -1;
	}

}
