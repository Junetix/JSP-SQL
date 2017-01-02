package net.board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		BoardDAO boarddao = new BoardDAO();
		List<BoardBean> boardlist = new ArrayList<>();
		
		int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount = boarddao.getListCount();// 총 리스트 리턴
		boardlist = boarddao.getBoardList(page, limit);//리스트 객체들 리턴
		
		//총 페이지수
		int maxpage = (int)((double)listcount/limit+0.95);//1을 더해도 무방하다
		//현재 페이지에 보여줄 시작페이지 수(1,11,21)..
		int startpage =(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에서 보여줄 마지막 페이지 수(10,20,30등)
		int endpage = startpage+10-1;
		if(endpage>maxpage)endpage = maxpage; //10보다 크면 10으로;
		
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("listcount", listcount);
		request.setAttribute("boardlist", boardlist);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./board/qna_board_list.jsp");
	
		return forward;
	}

}
