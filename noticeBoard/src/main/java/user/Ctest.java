package user;

import java.sql.*;
public class Ctest {

	public static void main(String[] args) {
		Connection c;
		try {
			c=DriverManager.getConnection("jdbc:mysql://localhost:3306/userinfo","root","1234");
			
			System.out.println("성공");
		}catch(Exception e) {
			System.out.println("오류"+e);
		}

	}

}
