package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardDAO;
import net.board.db.ReplyBean;

public class ReplyReplyAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		BoardDAO boarddao=new BoardDAO();
		ReplyBean replydata=new ReplyBean();
		ActionForward forward=new ActionForward();
		
		HttpSession session=request.getSession();
		
		String realFolder="";
		String saveFolder="boardupload";
		
		int fileSize=5*1024*1024;

		realFolder=request.getRealPath(saveFolder);

		
		boolean result=false;
		
		try{
			MultipartRequest multi=null;

			multi=new MultipartRequest(request,
					realFolder,
					fileSize,
					"euc-kr",
					new DefaultFileRenamePolicy());

			
			int board_num = Integer.parseInt(request.getParameter("board_num")); //get������� ������
			
			
			//ReplyBean
			//replydata.setReply_num(Integer.parseInt(multi.getParameter("reply_num")));
			replydata.setId((String)session.getAttribute("id"));
			replydata.setNick((String)session.getAttribute("nick"));
			replydata.setReply_date(multi.getParameter("reply_date"));
			replydata.setReply_content(multi.getParameter("reply_content"));
			replydata.setRe_ref(Integer.parseInt(request.getParameter("RE_REF")));
			replydata.setRe_lev(Integer.parseInt(request.getParameter("RE_LEV")));
			replydata.setRe_seq(Integer.parseInt(request.getParameter("RE_SEQ")));
			


			result=boarddao.boardInsertReplyReply(replydata, board_num);

			
			
			if(result==false){
				System.out.println("���� ��� ����");
				return null;
			}
			System.out.println("���� ��� �Ϸ�");

			forward.setRedirect(true);
			forward.setPath("./BoardList.bo"); 
			return forward;

		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		
		
		return null;



		
	}

}
