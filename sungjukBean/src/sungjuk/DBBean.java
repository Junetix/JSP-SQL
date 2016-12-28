package sungjuk;

import java.sql.*;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.*;
import sungjuk.MemberDataBean;

public class DBBean {
	private static DBBean instance = new DBBean();
	
	public static DBBean getInstance(){
		return instance;
	}
	private DBBean(){}
	
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		
		return ds.getConnection();
	}
	public int userCheck(String hakbun, String password)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpass = null;
		int x = 1;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM s_member where hakbun=?");
			pstmt.setString(1, hakbun);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				dbpass = rs.getString("password");
				if(dbpass.equals(password))
					x = 1;
				else
					x = 0;
					
			}else
				x = 1;
		}catch(Exception e){
			System.out.println("로그인 오류");
			e.printStackTrace();
		}
		return x;
	}
	public ArrayList getMemberlist()throws Exception{
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDataBean memberdata = null;
		ArrayList<MemberDataBean> member_list = null;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM s_member");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				member_list = new ArrayList<>();
				do{
					memberdata = new MemberDataBean();
					memberdata.setHakbun(rs.getString("hakbun"));
					memberdata.setPw(rs.getString("pw"));
					memberdata.setIrum(rs.getString("irum"));
					memberdata.setAge(rs.getInt("age"));
					memberdata.setGender(rs.getString("gender"));
					memberdata.setEmail(rs.getString("email"));
					
					member_list.add(memberdata);
				}while(rs.next());
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
			
		}
		return member_list;
	}
	public MemberDataBean selectMember (String hakbun) throws  Exception {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDataBean memberdata = null;
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM s_member WHERE hakbun =?");
			pstmt.setString(1, hakbun);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				memberdata = new MemberDataBean();
				memberdata.setHakbun(rs.getString("hakbun"));
				memberdata.setPw(rs.getString("pw"));
				memberdata.setIrum(rs.getString("irum"));
				memberdata.setAge(rs.getInt("age"));
				memberdata.setGender(rs.getString("gender"));
				memberdata.setEmail(rs.getString("email"));
			}else{
				System.out.println("데이터 없음");
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return memberdata;
	}
	public int insertMember(MemberDataBean memberdata)throws Exception{
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try{
			conn = getConnection();
			
			pstmt = conn.prepareStatement("INSERT INTO s_member VALUES(?,?,?,?,?,?)");
			pstmt.setString(1, memberdata.getHakbun());
			pstmt.setString(2, memberdata.getPw());
			pstmt.setString(3, memberdata.getIrum());
			pstmt.setInt(4, memberdata.getAge());
			pstmt.setString(5, memberdata.getGender());
			pstmt.setString(6, memberdata.getEmail());
			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("가입오류");
			e.printStackTrace();
		}finally {
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
			
		}
		return result;
		
	}
	public int deleteMember(String hakbun) throws Exception{
		Connection conn =null;
		PreparedStatement pstmt = null;
		int result =0;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("DELETE FROM s_member WHERE hakbun =?");
			pstmt.setString(1, hakbun);
			result = pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	//성적 관련 메소드
	public int insertSungjuk(SungjukDataBean sungjuk)throws Exception{
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try{
			conn = getConnection();
			
			pstmt = conn.prepareStatement("INSERT INTO sungjuk VALUES(?,?,?,?,?,?,?,?)");
			pstmt.setString(1, sungjuk.getHakbun());
			pstmt.setString(2, sungjuk.getIrum());
			pstmt.setInt(3, sungjuk.getKor());
			pstmt.setInt(4, sungjuk.getEng());
			pstmt.setInt(5, sungjuk.getMath());
			pstmt.setInt(6, sungjuk.getTot());
			pstmt.setDouble(7, sungjuk.getAvg());
			pstmt.setString(8, sungjuk.getGrade());
			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("입력오류");
			e.printStackTrace();
		}finally {
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
			
		}
		return result;
		
	}
	public int deleteSungjuk(String hakbun) throws Exception{
		Connection conn =null;
		PreparedStatement pstmt = null;
		int result =0;
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("DELETE FROM sungjuk WHERE hakbun =?");
			pstmt.setString(1, hakbun);
			result = pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	public SungjukDataBean selectSungjuk (String hakbun) throws  Exception {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SungjukDataBean sungjuk = null;
		
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM sungjuk WHERE hakbun =?");
			pstmt.setString(1, hakbun);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				sungjuk = new SungjukDataBean();
				sungjuk.setHakbun(rs.getString("hakbun"));
				sungjuk.setIrum(rs.getString("irum"));
				sungjuk.setKor(rs.getInt("kor"));
				sungjuk.setEng(rs.getInt("eng"));
				sungjuk.setMath(rs.getInt("math"));
				sungjuk.setTot(rs.getInt("tot"));
				sungjuk.setAvg(rs.getDouble("avg"));
				sungjuk.setGrade(rs.getString("grade"));
				//sungjuk.process();
			}else{
				System.out.println("데이터 없음");
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return sungjuk;
	}
	public int updateSungjuk(SungjukDataBean sungjuk)throws Exception{
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try{
			conn = getConnection();
			
			pstmt = conn.prepareStatement("UPDATE sungjuk set kor=?, eng=?, math=?, tot=?, avg=?, grade=? where hakbun=? and irum=?");
			sungjuk.setTot();
			pstmt.setString(7, sungjuk.getHakbun());
			pstmt.setString(8, sungjuk.getIrum());
			pstmt.setInt(1, sungjuk.getKor());
			pstmt.setInt(2, sungjuk.getEng());
			pstmt.setInt(3, sungjuk.getMath());
			pstmt.setInt(4, sungjuk.getTot());
			pstmt.setDouble(5, sungjuk.getAvg());
			pstmt.setString(6, sungjuk.getGrade());
			pstmt.setString(7, sungjuk.getHakbun());
			pstmt.setString(8, sungjuk.getIrum());
			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("입력오류");
			e.printStackTrace();
		}finally {
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
			
		}
		return result;
		
	}
}
