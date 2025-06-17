package program;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/program/*")
public class programController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public void init(ServletConfig config) throws ServletException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	} 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);  
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// forwording 경로
		String nextPage = null;
		// request
		request.setCharacterEncoding("utf-8"); 
		// url 경로 알아내기
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		
		// 비지니스로직
		// join.do
		 try{
			 if (action.equals("/program.do")) {
				 nextPage = "/program.jsp";
		 }
		 
		response.setContentType("text/html;charset=utf-8"); 
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
