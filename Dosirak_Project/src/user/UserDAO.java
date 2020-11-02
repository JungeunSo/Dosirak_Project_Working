package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	Connection con;
	PreparedStatement prsmt;
	ResultSet rs;
	public UserDAO() {
		try {
			/* MariaDB */ 
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

	public int login(String id, String pass) {
		String sql="select password from user where id=?";
		try {
			prsmt = con.prepareStatement(sql);
			prsmt.setString(1,id);
			rs=prsmt.executeQuery();

			if (rs.next()) {
				if (rs.getString(1).equals(pass)) {
					return 1; 
				}else {
					return 0; 
				}
			}
			return -1; 

		}catch (Exception e) {

		}
		return -2;					
	}

	public int join(User user) {

		String sql="insert into user (id, password, name, gender, email, phone)  values (?, ?, ?, ?, ?, ?)";

		try {
			prsmt = con.prepareStatement(sql);
			prsmt.setString(1,user.getId());
			prsmt.setString(2,user.getPassword());
			prsmt.setString(3,user.getName());
			prsmt.setString(4,user.getGender());
			prsmt.setString(5,user.getEmail());
			prsmt.setString(6,user.getPhone());

			return prsmt.executeUpdate();

		}catch (Exception e) {

		}
		return -1;					
	}

}
