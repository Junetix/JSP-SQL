

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		if(id.equals("java")&&password.equals("java")){ //���̵� ��� üũ.. DB���� �о���°� �����̳� ���⼭�� �׽�Ʈ��..
			HttpSession session = request.getSession(); //���ǰ�ü ����
			session.setAttribute("id", id); //���ǿ� key value�ο�
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginSuccess.jsp"); //loginsuccess �� request dispatcher����
			dispatcher.forward(request,response); //�Ķ���ͷ� ���� ���� ����
			
		}else{
			out.println("<script>");
			out.println("alert('���̵� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

}
