package main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import sec02.ex01.MemberVO;

/**
 * Servlet implementation class TouristInTour
 */
//@WebServlet("/")
@WebServlet("/TouristInTour")
public class TouristInTour extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TouristInTour() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { // POST 요청을 처리,  doHandle 메소드를 호출    
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {    
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
		// 
		 if (action == null) {
			 //nextPage = "/index.html";
			nextPage = "/index.jsp";
			
		 }
		 
		 /*
		 // join.do
		 else if (action.equals("/join.do")) {
			 nextPage = "/join.jsp";
		 }
		 // login.do 
		 else if (action.equals("/login.do")) {
			 nextPage = "/login.jsp";
		 }
		 */
	 	response.setContentType("text/html;charset=utf-8");
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}
}