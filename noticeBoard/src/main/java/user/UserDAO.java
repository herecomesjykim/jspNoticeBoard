package user;

import java.sql.*;

import com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream;

import bbs.Bbs;

public class UserDAO {
	
	private static Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/userinfo";
			String dbID="root";
			String dbPassword="1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public int login(String userID, String userPassword) {
		String sql="select userPassword from userinfo.bbs where userID = ? ";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userID); //첫번째 물음표에 매개변수로 받아온 userID대입
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;
				}else {
					return 0;
				}
			}return -1;
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return -2;
	}
	
	public int sign(User user){
		String sql="insert into userinfo.bbs values(?,?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,user.getUserID());
			pstmt.setString(2,user.getUserPassword());
			pstmt.setString(3,user.getUserName());
			pstmt.setString(4,user.getUserGender());
			pstmt.setString(5,user.getUserEmail());
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return -1;
	}
	//이 밑으로는 스스로 만든 메소드인데 어떻게 써야할지 모르겠네;
	public User getUser(String userID) {
		String sql="select * from bbs where userID = ? ";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			 rs=pstmt.executeQuery();
			 if(rs.next()) {
				 User user=new User();
				 user.setUserID(rs.getString(1));
				 user.setUserPassword(rs.getString(2));
				 user.setUserName(rs.getString(3));
				 user.setUserGender(rs.getString(4));
				 user.setUserEmail(rs.getString(5));
				 return user;
			 }
		}catch(Exception e) {
			e.printStackTrace();
		}return null;
		
	}
	
	//회원정보 수정 메소드 구현얘정 비밀번호와 이메일만 수정가능하도록
	public int edit(String userID,String userPassword,String userEmail) {
	  	String sql="update bbs set userPassword = ?, userEmail = ? where userID = ?";
	  	try{
	  		pstmt=conn.prepareStatement(sql);
	  		pstmt.setString(1,userPassword);
	  		pstmt.setString(2,userEmail);
	  		pstmt.setString(3,userID);
	  		return pstmt.executeUpdate();
	  	}catch(Exception e){
	  		e.printStackTrace();
	  	}return -1;//DB오류
	}
	
	//회원탈퇴 메소드 구현예정
	public int bye(String userID) {
		String sql="delete table bbs where userID=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userID);
			return pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return -1;
	}
	
	
}

