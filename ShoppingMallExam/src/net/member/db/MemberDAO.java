package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public MemberDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 회원정보 DB 삽입
	public boolean insertMember(MemberBean mb) throws SQLException {
		String sql = null;
		boolean result = false;
		try {
			con = ds.getConnection();
			sql = "INSERT INTO member VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getMEMBER_ID());
			pstmt.setString(2, mb.getMEMBER_PW());
			pstmt.setString(3, mb.getMEMBER_NAME());
			pstmt.setInt(4, mb.getMEMBER_JUMIN1());
			pstmt.setInt(5, mb.getMEMBER_JUMIN2());
			pstmt.setString(6, mb.getMEMBER_EMAIL());
			pstmt.setString(7, mb.getMEMBER_EMAIL_GET());
			pstmt.setString(8, mb.getMEMBER_MOBILE());
			pstmt.setString(9, mb.getMEMBER_PHONE());
			pstmt.setString(11, mb.getMEMBER_ADDR1());
			pstmt.setString(12, mb.getMEMBER_ADDR2());
			pstmt.setInt(13, mb.getMEMBER_ADMIN());
			pstmt.setTimestamp(14, mb.getMEMBER_JOIN_DATE());
			pstmt.executeUpdate();

			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {

			}
		}
		return result;
	}

	public int userCheck(String id, String pw) throws SQLException {
		String sql = null;
		int x = -1;

		try {

			con = ds.getConnection();
			sql = "SELECT MEMBER_PW FROM member WHERE MEMBER_ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String memberpw = rs.getString("MEMBER_PW");

				if (memberpw.equals(pw)) {
					x = 1;
				} else {
					x = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {

			}
		}
		return x;
	}

	public int confirmId(String id) throws SQLException {
		String sql = null;
		int x = -1;

		try {

			con = ds.getConnection();
			sql = "SELECT MEMBER_ID FROM member WHERE MEMBER_ID=? ";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {

			}
		}
		return x;
	}

	public MemberBean getMember(String id) throws SQLException{
		
		MemberBean member = null;
		String sql = "SELECT * FROM member WHERE MEMBER_ID=? ";
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
					
			if(rs.next()){
				member = new MemberBean();
				
				member.setMEMBER_ID(rs.getString("MEMBER_ID"));
				member.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
				member.setMEMBER_JUMIN1(rs.getInt("MEMBER_JUMIN1"));
				member.setMEMBER_JUMIN1(rs.getInt("MEMBER_JUMIN2"));
				member.setMEMBER_EMAIL(rs.getString("MEMBER_EMAIL"));
				member.setMEMBER_EMAIL_GET(rs.getString("MEMBER_EMAIL_GET"));
				member.setMEMBER_MOBILE(rs.getString("MEMBER_MOBILE"));
				member.setMEMBER_PHONE(rs.getString("MEMBER_PHONE"));
				member.setMEMBER_ZIPCODE(rs.getString("MEMBER_ZIPCODE"));
				member.setMEMBER_ADDR1(rs.getString("MEMBER_ADDR1"));
				member.setMEMBER_ADDR2(rs.getString("MEMBER_ADDR2"));
								
			}
			
		
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {

			}
		}
		
		return member;
		
	}
	
	public void updateMember(MemberBean mb) throws SQLException{
		
		String sql = null;
		
		try{
			
			con = ds. getConnection();
			sql = "UPDATE member SET MEMBER_PW=?, MEMBER_NAME=?,"+
					"MEMBER_EMAIL=?, MEMBER_EMAIL_GET=?, MEMBER_MOBILE=?, "+
					"MEMBER_PHONE=?, MEMBER_ZIPCODE=?, MEMBER_ADDR1=?, "+
					"MEMBER_ADDR2=? where MEMBER_ID=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getMEMBER_PW());
			pstmt.setString(2, mb.getMEMBER_NAME());
			pstmt.setString(3, mb.getMEMBER_EMAIL());
			pstmt.setString(4, mb.getMEMBER_EMAIL_GET());
			pstmt.setString(5, mb.getMEMBER_MOBILE());
			pstmt.setString(6, mb.getMEMBER_PHONE());
			pstmt.setString(7, mb.getMEMBER_ZIPCODE());
			pstmt.setString(8, mb.getMEMBER_ADDR1());
			pstmt.setString(9, mb.getMEMBER_ADDR2());
			pstmt.setString(10, mb.getMEMBER_ID());
			
			pstmt.executeUpdate();
			
		}catch(Exception e){
			
			e.printStackTrace();
			
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {

			}
		}
	}
	
	//삭제 구문.
	public int deleteMember(String id, String pw) throws SQLException{
		
		String sql = null;
		int x = -1;
		
		try{
			
			con = ds.getConnection();
			
			sql = "SELECT MEMBER_PW FROM member WHERE MEMBER_ID = ? ";
			
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				String  memberpw = rs.getString("MEMBER_PW");
				
				if(memberpw.equals(pw)){
					
					sql = "DELETE FROM member WHERE MEMBER_ID=? ";
					
					pstmt = con.prepareStatement(sql);
					pstmt.executeUpdate();
					
					x = 1;
				}else{
					x = 0;
				}
			
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {

			}
		}
		return x;
		
	}
	
	public MemberBean findId(String name, String jumin1, String jumin2) throws SQLException{
		
		String sql = null;
		MemberBean member = null;
		
		try{
			
			con = ds.getConnection();
			
			sql = "SELECT MEMBER_ID, MEMBER_PW, MEMBER_JUMIN1, MEMBER_JUMIN2 FROM member WHERE MEMBER_NAME=? ";
			
			pstmt =  con.prepareStatement(sql);
			pstmt.setString(1, name);
			
			if(rs.next()){
				
				String memberjumin1 = rs.getString("MEMBER_JUMIN1");
				String memberjumin2 = rs.getString("MEMBER_JUMIN2");
				
				if(memberjumin1.equals(jumin1)&&(memberjumin2.equals(jumin2))){
					
					member = new MemberBean();
					
					member.setMEMBER_ID(rs.getString("MEMBER_ID"));
					member.setMEMBER_PW(rs.getString("MEMBER_PW"));
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {

			}
		}
		return member;
	
		
	}
	//관리자 확인 메소드 
	public boolean isAdmin(String id){
		
		String sql = "SELECT MEMBER_ADMIN FROM member WHERE MEMBER_ID=? ";
		int member_admin = 0;
		boolean result = false;
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			
			member_admin = rs.getInt("MEMBER_ADMIN");
			
			if(member_admin == 1 ){
				
				result = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {

			}
		}
		return result;
	}
	
	public List<String> searchZipcode(String searchdong){
		
		String sql = "SELECT * FROM zipcode WHERE dong LIKE ? ";
		List<String> zipcodeList = new ArrayList<>();
		
		try{
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+searchdong+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				String sido = rs.getString("sido");
				String gugun = rs.getString("gugun");
				String dong = rs.getString("dong");
				String ri = rs.getString("ri");
				String bunji = rs.getString("bunji");
				
				if(ri==null) ri ="";
				if(bunji==null) bunji="";
				
				String zipcode = rs.getString("zipcode");
				String addr = sido+" "+gugun+" "+dong+" "+ri+" "+bunji;
				
				zipcodeList.add(zipcode+","+addr);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {

			}
		}
		return zipcodeList;
		
	}
	
	
	
	
	

}






































