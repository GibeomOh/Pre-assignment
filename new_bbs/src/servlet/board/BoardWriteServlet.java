package servlet.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.board.BoardDAOInterface;
import dao.board.BoardMyBatisDAO;
import model.board.BoardModel;

@WebServlet("/board/BoardWriteServlet")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardDAOInterface boardDAO = null;
	private BoardModel boardModel = null;
       
    public BoardWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// JSP로 출력을 위임
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/jsp/board/boardWrite.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// POST 한글 파라미터 깨짐 처리
		request.setCharacterEncoding("UTF-8");
		this.boardDAO = new BoardMyBatisDAO();
		
		// 파라미터
		String subject = request.getParameter("subject");
		String email = request.getParameter("email");
		String contents = request.getParameter("contents");
		String password = request.getParameter("password");

//		if (boardDAO.isEmailPattern(email)) {
			// 모델 생성
			boardModel = new BoardModel();
			boardModel.setSubject(subject);
			boardModel.setEmail(email);
			boardModel.setContents(contents);
			boardModel.setPassword(password);

			// 게시물 등록
			this.boardDAO.insert(boardModel);

			// 페이지 이동
			response.sendRedirect("BoardListServlet");
//		}
//		
//		else {
//			response.sendError(588, "이메일 형식이 잘못되었습니다.");
//		}
	}
}
