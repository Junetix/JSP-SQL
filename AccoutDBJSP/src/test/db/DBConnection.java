package test.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
 public static Connection getCon() throws SQLException{
	 Connection con=null;
	 try{
		 Class.forName("oracle.jdbc.OracleDriver");
		 String url ="jdbc:oracle:thin:@127.0.0.1:1524:orcl";
		 con = DriverManager.getConnection(url,"scott","123456");
		 return con;
	 }catch(ClassNotFoundException e){
		 System.out.println(e.getMessage());
		 return null;
	 }
 }
}
