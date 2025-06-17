package member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class MemberController
 */
@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberDAO memberDAO;

	public void init() throws ServletException {
		memberDAO = new MemberDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String nextPage = null;
	    request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8");
	    String action = request.getPathInfo();
	    System.out.println("action:" + action);
	    
	    if (action == null || action.equals("/listMembers.do")) {
	        List<MemberVO> membersList = memberDAO.listMembers();
	        request.setAttribute("membersList", membersList);
	        nextPage = "/test03/listMembers.jsp";
	    } else if (action.equals("/join.do")) {
	        nextPage = "/join.jsp";
	    } else if (action.equals("/login.do")) {
	        nextPage = "/login.jsp";
	    }  else if (action.equals("/addMember.do")) {
	        String email = request.getParameter("email");
	        String name = request.getParameter("name");
	        String password = request.getParameter("password");
	        String phone = request.getParameter("phone");
	        String gender = request.getParameter("gender");

	        MemberVO memberVO = new MemberVO(email, name, password, phone, gender);
	        memberDAO.addMember(memberVO);
	        
	        // 세션에 회원가입 완료 메시지 저장
	        HttpSession session = request.getSession();
	        session.setAttribute("signupMessage", "회원가입이 완료되었습니다!");

	        // 회원가입 후 listMembers 페이지로 리디렉션
	        response.sendRedirect(request.getContextPath() + "/member/join.do");
	        return;
	    } else if (action.equals("/memberForm.do")) {
	        nextPage = "/test03/memberForm.jsp";
	    } else if (action.equals("/modMemberForm.do")) {
	        String email = request.getParameter("email");
	        MemberVO memInfo = memberDAO.findMember(email);
	        request.setAttribute("memInfo", memInfo);
	        nextPage = "/test03/modMemberForm.jsp";
	    } else if (action.equals("/modMember.do")) {
	        String email = request.getParameter("email");
	        String name = request.getParameter("name");
	        String password = request.getParameter("password");
	        String phone = request.getParameter("phone");
	        String gender = request.getParameter("gender");
	        System.out.println(email);
	        System.out.println(name);
	        MemberVO memberVO = new MemberVO(email, name, password, phone, gender);
	        memberDAO.modMember(memberVO);
	        
	        // 수정 후 리디렉션
	        response.sendRedirect(request.getContextPath() + "/member/listMembers.do");
	        return; // 리턴 추가
	    } else if (action.equals("/delMember.do")) {
	        String email = request.getParameter("email");
	        memberDAO.delMember(email);
	        
	        // 삭제 후 리디렉션
	        response.sendRedirect(request.getContextPath() + "/member/listMembers.do");
	        return; // 리턴 추가
	    } else {
	        List<MemberVO> membersList = memberDAO.listMembers();
	        request.setAttribute("membersList", membersList);
	        nextPage = "/test03/listMembers.jsp";
	    }
	    
	    // 포워드 처리
	    RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
	    dispatch.forward(request, response);
	}
}
