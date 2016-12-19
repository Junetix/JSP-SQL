

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginFormServlet
 */
@WebServlet("/loginform")
public class LoginFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String jumin = request.getParameter("jumin1")+"-"+request.getParameter("jumin2");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email1")+"@"+request.getParameter("email2");
		String hobby ="";
		String[] hobbies = request.getParameterValues("hobby");
		for(int i = 0 ; i<hobbies.length; i++){
			hobby += hobbies[i]+",";
		}
		
		String intro = request.getParameter("intro");
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("</head>");
		out.println("<body>");
		out.println("<table align='center' border='1'>");
		out.println("<tr>");
		out.println("<td>아이디</td>");
		out.println("<td>"+id+"</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td>비밀번호</td>");
		out.println("<td>"+pw+"</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td>주민번호</td>");
		out.println("<td>"+jumin+"</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td>성별</td>");
		out.println("<td>"+gender+"</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td>이메일</td>");
		out.println("<td>"+email+"</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td>취미</td>");
		out.println("<td>"+hobby+"</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println("<td>자기소개</td>");
		out.println("<td>"+intro+"</td>");
		out.println("</tr>");
		out.println("</table>");
		out.println("</body>");
		out.println("</html>");
		
	}

}
