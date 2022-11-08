package bbs;

import java.sql.*;
import java.util.ArrayList;

public class BbsDAO {
	private static Connection conn;
	private ResultSet rs;
	
	public BbsDAO() {
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
	
	//작성일자 메소드
	public String getDate() {
		String sql="select now()";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return "";//DB오류
			
		}
		
	
	//게시물 넘버링
	public int getNext() {
		//현재 게시글을 내림차순으로 조회하여 가장 마지막 게시글 번호 확인
		String sql="select bbsID from bbs2 order by bbsID desc";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1; //현재 게시글수 +1
			}
			return 1;//첫번째 게시글인경우
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
		
		}return -1;
	}
	
	//글쓰기 메소드
	public int write(String bbsTitle, String userID, String bbsContent) {
		String sql="insert into bbs2 values(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,getNext());//글 넘버링
			pstmt.setString(2,bbsTitle);//제목
			pstmt.setString(3,userID);//작성자id
			pstmt.setString(4,getDate());//작성일자
			pstmt.setString(5,bbsContent);//
			pstmt.setInt(6,1);//유효번호 라는데 왜 넣지?
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
		
		}return -1;
		
	}
	
	//게시글 확인 메소드
	public ArrayList<Bbs> getList(int pageNumber){
		String sql="select * from bbs2 where bbsID < ? and bbsAvaliable=1 order by bbsID desc limit 10";
		ArrayList<Bbs> list=new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,getNext()-(pageNumber-1)*10);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Bbs bbs=new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvaliable(rs.getInt(6));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}return list;
	}
	/*
	 모든게시글을 조회 후 내림차순으로 최대 10개까지 조회
	 getNext()-(pageNumber-1)*10
	 만약 현재 글이 5개라면 6-1 
	 */
	
	//페이지 처리 메소드
	
	public boolean nextPage(int pageNumber) {
		String sql="select * from bbs2 where bbsID< ? and bbsAvaliable=1";
		try{
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,getNext()-(pageNumber-1)*10);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}return false;
	}
	
	
	public Bbs getBbs(int bbsID) {
		String sql="select * from bbs2 where bbsID = ?";
		try {
			 PreparedStatement pstmt=conn.prepareStatement(sql);
			 pstmt.setInt(1, bbsID);
			 rs=pstmt.executeQuery();
			 if(rs.next()) {
				 Bbs bbs=new Bbs();
				 bbs.setBbsID(rs.getInt(1));
				 bbs.setBbsTitle(rs.getString(2));
				 bbs.setUserID(rs.getString(3));
				 bbs.setBbsDate(rs.getString(4));
				 bbs.setBbsContent(rs.getString(5));
				 bbs.setBbsAvaliable(rs.getInt(6));
				 
				 return bbs;
			 }
		}catch(Exception e) {
			e.printStackTrace();
			
			
		}return null;
	}
	
	//게시글 수정 메소드
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String sql="update bbs2 set bbsTitle = ?, bbsContent = ? where bbsID = ?";
		try {
			 PreparedStatement pstmt=conn.prepareStatement(sql);
			 pstmt.setString(1, bbsTitle);
			 pstmt.setString(2,bbsContent);
			 pstmt.setInt(3,bbsID);
			 return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return-1;
	}
	//게시글 삭제 메소드
	public int delete(int bbsID) {
		String sql="update bbs2 set bbsAvaliable=0 where bbsID = ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,bbsID);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}

	