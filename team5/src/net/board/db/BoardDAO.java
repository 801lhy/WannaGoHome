package net.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.DataSource;

public class BoardDAO {
   
   Connection con;
   PreparedStatement pstmt;
   ResultSet rs;

   public BoardDAO() {
      try{
         Context init = new InitialContext();
         DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
         con = ds.getConnection();
      }catch(Exception ex){
         System.out.println("DB ���� ���� : " + ex);
         return;
      }
   }

   //�� ���(board).
   public int boardInsert(BoardBean board){

      String sql="";
      int result=0;

      //�ǽð� �ð����
      SimpleDateFormat timeformat = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
      String time = timeformat.format(System.currentTimeMillis());

      try{
         sql="insert into board (BOARD_ID,TITLE,";
         sql+="ID, NICK,UPLOAD_DATE,"+
               "VIEW_COUNT)"+"values(?,?,?,?,?,?)";

         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, board.getBoard_id());
         pstmt.setString(2, board.getTitle());
         pstmt.setString(3, board.getId());
         pstmt.setString(4, board.getNick());
         pstmt.setString(5, time);            
         pstmt.setInt(6, board.getView_count());

         result=pstmt.executeUpdate();
         if(result==0)return 0;

         pstmt = con.prepareStatement("SELECT board_seq.currval FROM dual");
         rs=pstmt.executeQuery();
         if(rs.next())
            return rs.getInt(1);
      }catch(Exception ex){
         System.out.println("boardInsert ���� : "+ex);
      }finally{
         if(rs!=null) try{rs.close();}catch(SQLException ex){}
         if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
      }
      return 0;
   }


   //�� ���(recipe).
   public boolean boardInsertRecipe(RecipeBean recipe, int board_num){

      String sql="";
      int result=0;

      try{
         sql="insert into recipe (BOARD_NUM,COOKING_SERVING,COOKING_TIME,";
         sql+="DIFFICULTY, VIDEO_URL, ESSENTIAL_INGREDIENT," + 
               "SELECTIVE_INGREDIENT, TAG, THUMBNAIL, COOKING_COMMENT)" + 
               "values(?,?,?,?,?,?,?,?,?,?)";

         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, board_num);
         pstmt.setString(2, recipe.getCooking_serving());
         pstmt.setString(3, recipe.getCooking_time());
         pstmt.setString(4, recipe.getDifficulty());
         pstmt.setString(5, recipe.getVideo_url());
         pstmt.setString(6, recipe.getEssential_ingredient());            
         pstmt.setString(7, recipe.getSelective_ingredient());
         pstmt.setString(8, recipe.getTag());
         pstmt.setString(9, recipe.getThumbnail());
         pstmt.setString(10, recipe.getCooking_comment());

         result=pstmt.executeUpdate();
         if(result==0)return false;

         return true;
      }catch(Exception ex){
         System.out.println("boardInsertRecipe ���� : "+ex);
      }finally{
         if(rs!=null) try{rs.close();}catch(SQLException ex){}
         if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
      }
      return false;
   }


   //�� ���(cooking_order).
   public boolean boardInsertOrder(Cooking_orderBean order, int board_num){

      String sql="";
      int result=0;

      try{
         sql="insert into cooking_order (BOARD_NUM,COOKING_CONTENT,COOKING_PHOTO,";
         sql+="STEP)" + 
               "values(?,?,?,?)";

         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, board_num);
         pstmt.setString(2, order.getCooking_content());
         pstmt.setString(3, order.getCooking_photo());
         pstmt.setInt(4, order.getStep());

         result=pstmt.executeUpdate();
         if(result==0)return false;

         return true;
      }catch(Exception ex){
         System.out.println("boardInsertOrder ���� : "+ex);
      }finally{
         if(rs!=null) try{rs.close();}catch(SQLException ex){}
         if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
      }
      return false;
   }
   

	//�Խñ� �� �޾ƿ���
	public int getListCount() {
		int x= 0;
		
		try{
			pstmt=con.prepareStatement("select count(*) from board where board_id=1");
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				x=rs.getInt(1);
			}
		}catch(Exception ex){
			System.out.println("getListCount ����: " + ex);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		return x;
	}
	
	//�Խñ� ��� �޾ƿ���
	public List getBoardList(int page,int limit) {
		String board_list_sql="select * from "+
		"(select rownum rnum,BOARD_NUM,BOARD_ID,BOARD_SUBJECT,"+
		"BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,"+
		"BOARD_RE_SEQ,BOARD_READCOUNT,BOARD_DATE from "+
		"(select * from board where board_id=1"+
		"order by BOARD_RE_REF desc,BOARD_RE_SEQ asc)) "+
		"where rnum>=? and rnum<=?";
		
		List list = new ArrayList();
		
		int startrow=(page-1)*10+1; //�б� ������ row ��ȣ.
		int endrow=startrow+limit-1; //���� ������ row ��ȣ.		
		try{
			pstmt = con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BoardBean board = new BoardBean();
				board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				board.setBOARD_ID(rs.getString("BOARD_ID"));
				board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				board.setBOARD_FILE(rs.getString("BOARD_FILE"));
				board.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
				board.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
				board.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
				board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				list.add(board);
			}
			
			return list;
		}catch(Exception ex){
			System.out.println("getBoardList ���� : " + ex);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		return null;
	}



   //�� ���(talk).
   public boolean boardInsertTalk(TalkBean talk){

      String sql="";

      int result=0;



      try{



         sql="insert into talk (TALK_CATEGORY,LOVE,";
         sql+="TALK_CONTENT, TALK_PHOTO)" + 
               "values(?,?,?,?)";


         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, talk.getTalk_category());
         pstmt.setInt(2, talk.getLove());
         pstmt.setString(3, talk.getTalk_content());
         pstmt.setString(4, talk.getTalk_photo());


         result=pstmt.executeUpdate();
         if(result==0)return false;

         return true;
      }catch(Exception ex){
         System.out.println("boardInsertTalk ���� : "+ex);
      }finally{
         if(rs!=null) try{rs.close();}catch(SQLException ex){}
         if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
      }
      return false;
   }

   
   
   
   //�� ���(event).
      public boolean boardInsertEvent(EventBean event){

         String sql="";

         int result=0;



         try{



            sql="insert into event (START_DATE,END_DATE,";
            sql+="EVENT_CONTENT, EVENT_PHOTO)" + 
                  "values(?,?,?,?)";


            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, event.getStart_date());
            pstmt.setString(2, event.getEnd_date());
            pstmt.setString(3, event.getEvent_content());
            pstmt.setString(4, event.getEvent_photo());


            result=pstmt.executeUpdate();
            if(result==0)return false;

            return true;
         }catch(Exception ex){
            System.out.println("boardInsertEvent ���� : "+ex);
         }finally{
            if(rs!=null) try{rs.close();}catch(SQLException ex){}
            if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
         }
         return false;
      }
      
      
      

      
      

   //��� ���(reply).
   public boolean boardInsertReply(ReplyBean reply, int board_num){

      String sql="";

      int result=0;

      //�ǽð� �ð����
      SimpleDateFormat timeformat = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
      String time = timeformat.format(System.currentTimeMillis());

      try{



         sql="insert into reply (ID,NICK,";
         sql+="REPLY_DATE, REPLY_CONTENT, BOARD_NUM)" + 
               "values(?,?,?,?,?)";


         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, reply.getId());
         pstmt.setString(2, reply.getNick());
         pstmt.setString(3, time);
         pstmt.setString(4, reply.getReply_content());
         pstmt.setInt(5, board_num);


         result=pstmt.executeUpdate();
         if(result==0)return false;

         return true;
      }catch(Exception ex){
         System.out.println("boardInsertReply ���� : "+ex);
      }finally{
         if(rs!=null) try{rs.close();}catch(SQLException ex){}
         if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
      }
      return false;
   }

   
   
   
   
   
   //���� ���(reply).
      public boolean boardInsertReplyReply(ReplyBean reply, int board_num){
         
         String sql="";
         
         int result=0;

         int re_ref=reply.getRe_ref();
         int re_lev=reply.getRe_lev();
         int re_seq=reply.getRe_seq();
         
         //�ǽð� �ð����
         SimpleDateFormat timeformat = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
         String time = timeformat.format(System.currentTimeMillis());

         try{

            
            sql="update reply set RE_SEQ=RE_SEQ+1 ";
            sql+="where RE_REF=? and RE_SEQ>?";
            
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,re_ref);
            pstmt.setInt(2,re_seq);
            result=pstmt.executeUpdate();
            
            re_seq = re_seq + 1;
            re_lev = re_lev+1;
         
            
         
            
            sql="insert into reply (ID,NICK,REPLY_DATE,";
            sql+="REPLY_CONTENT, BOARD_NUM, RE_REF, RE_LEV,RE_SEQ)" + 
                  "values(?,?,?,?,?,?,?,?)";
            

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, reply.getId());
            pstmt.setString(2, reply.getNick());
            pstmt.setString(3, time);
            pstmt.setString(4, reply.getReply_content());
            pstmt.setInt(5, board_num);
            pstmt.setInt(6, re_ref);
            pstmt.setInt(7, re_lev);
            pstmt.setInt(8, re_seq);

            result=pstmt.executeUpdate(); 
            
            if(result==0)return false;

            return true;
         }catch(Exception ex){
            System.out.println("boardInsertReplyReply ���� : "+ex);
         }finally{
            if(rs!=null) try{rs.close();}catch(SQLException ex){}
            if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
         }
         return false;
      }





   //�� ����.(recipe����)
   public boolean boardDelete(int num){
      String recipe_delete_sql=
            "delete from board where BOARD_num=?";

      int result=0;

      try{
         pstmt=con.prepareStatement(recipe_delete_sql);
         pstmt.setInt(1, num);
         result=pstmt.executeUpdate();
         if(result==0)return false;

         return true;
      }catch(Exception ex){
         System.out.println("boardDelete ���� : "+ex);
      }finally{
         try{
            if(pstmt!=null)pstmt.close();
         }catch(Exception ex) {}
      }

      return false;
   }
   
   
   
   
   





   //��� ����.(reply����)
   public boolean replyDelete(int num){
      String reply_delete_sql=
            "delete from reply where reply_num=?";

      int result=0;

      try{
         pstmt=con.prepareStatement(reply_delete_sql);
         pstmt.setInt(1, num);
         result=pstmt.executeUpdate();
         if(result==0)return false;

         return true;
      }catch(Exception ex){
         System.out.println("replyDelete ���� : "+ex);
      }finally{
         try{
            if(pstmt!=null)pstmt.close();
         }catch(Exception ex) {}
      }

      return false;
   }




   //�۾������� Ȯ��.
   public boolean isBoardWriter(int num,String id){
      String board_sql=
            "select * from board where BOARD_NUM=?";

      try{
         pstmt=con.prepareStatement(board_sql);
         pstmt.setInt(1, num);
         rs=pstmt.executeQuery();
         rs.next();

         if(id.equals(rs.getString("id"))){
            return true;
         }
      }catch(SQLException ex){
         System.out.println("isBoardWriterRecipe ���� : "+ex);
      }
      return false;
   }



   //�۾������� Ȯ��.(reply)
   public boolean isBoardWriterReply(int num,String id){
      String board_sql=
            "select * from board where REPLY_NUM=?";

      try{
         pstmt=con.prepareStatement(board_sql);
         pstmt.setInt(1, num);
         rs=pstmt.executeQuery();
         rs.next();

         if(id.equals(rs.getString("id"))){
            return true;
         }
      }catch(SQLException ex){
         System.out.println("isBoardWriterReply ���� : "+ex);
      }
      return false;
   }


   //��ȸ�� ������Ʈ.
   public void setViewCountUpdate(int num) throws Exception{
      String sql="update board set VIEW_COUNT = "+
            "VIEW_COUNT+1 where BOARD_NUM = "+num;

      try{
         pstmt=con.prepareStatement(sql);
         pstmt.executeUpdate();
      }catch(SQLException ex){
         System.out.println("setViewCountUpdate ���� : "+ex);
      }
   }


   //�� ���� ����.(recipe �󼼺���)
   public MasterBean getRecipeDetail(int num) throws Exception{

      MasterBean master = null;
      BoardBean board = null;
      RecipeBean recipe = null;

      try{
         pstmt = con.prepareStatement(
               "select * from board bd left outer join recipe rc on bd.board_num = rc.board_num where BOARD_NUM = ? ");
         pstmt.setInt(1, num);

         rs= pstmt.executeQuery();

         if(rs.next()){
            master = new MasterBean();
            board = new BoardBean();
            recipe = new RecipeBean();

            board.setBoard_num(rs.getInt("BOARD_NUM"));
            board.setBoard_id(rs.getInt("BOARD_ID"));
            board.setTitle(rs.getString("TITLE"));
            board.setId(rs.getString("ID"));
            board.setNick(rs.getString("NICK"));
            board.setUpload_date(rs.getString("UPLOAD_DATE"));
            board.setView_count(rs.getInt("VIEW_COUNT"));
            recipe.setBoard_num(rs.getInt("BOARD_NUM"));
            recipe.setCooking_serving(rs.getString("COOKING_SERVING"));
            recipe.setCooking_time(rs.getString("COOKING_TIME")); 
            recipe.setDifficulty(rs.getString("DIFFICULTY"));
            recipe.setVideo_url(rs.getString("VIDEO_URL"));
            recipe.setEssential_ingredient(rs.getString("ESSENTIAL_INGREDIENT"));
            recipe.setSelective_ingredient(rs.getString("SELECTIVE_INGREDIENT"));
            recipe.setTag(rs.getString("TAG"));
            recipe.setThumbnail(rs.getString("THUMBNAIL"));
            recipe.setCooking_comment(rs.getString("COOKING_COMMENT"));

            master.setBoardbean(board);
            master.setRecipebean(recipe);

         }
         return master;
      }catch(Exception ex){
         System.out.println("getRecipeDetail ���� : " + ex);
      }finally{
         if(rs!=null)try{rs.close();}catch(SQLException ex){}
         if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
      }
      return null;
   }





   //�� ���� ����.(talk �󼼺���)
   public MasterBean getTalkDetail(int num) throws Exception{

      MasterBean master = null;
      BoardBean board = null;
      TalkBean talk = null;

      try{
         pstmt = con.prepareStatement(
               "select * from board bd left outer join talk tk on bd.board_num = tk.board_num where BOARD_NUM = ? ");
         pstmt.setInt(1, num);

         rs= pstmt.executeQuery();

         if(rs.next()){
            master = new MasterBean();
            board = new BoardBean();
            talk = new TalkBean();

            board.setBoard_num(rs.getInt("BOARD_NUM"));
            board.setBoard_id(rs.getInt("BOARD_ID"));
            board.setTitle(rs.getString("TITLE"));
            board.setId(rs.getString("ID"));
            board.setNick(rs.getString("NICK"));
            board.setUpload_date(rs.getString("UPLOAD_DATE"));
            board.setView_count(rs.getInt("VIEW_COUNT"));
            talk.setBoard_num(rs.getInt("BOARD_NUM"));
            talk.setTalk_category(rs.getInt("TALK_CATEGORY"));
            talk.setLove(rs.getInt("LOVE")); 
            talk.setTalk_content(rs.getString("TALK_CONTENT"));
            talk.setTalk_photo(rs.getString("TALK_PHOTO"));

            master.setBoardbean(board);
            master.setTalkbean(talk);

         }
         return master;
      }catch(Exception ex){
         System.out.println("getTalkDetail ���� : " + ex);
      }finally{
         if(rs!=null)try{rs.close();}catch(SQLException ex){}
         if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
      }
      return null;
   }
   
   
   
   
   //�� ���� ����.(event �󼼺���)
      public MasterBean getEventDetail(int num) throws Exception{

         MasterBean master = null;
         BoardBean board = null;
         EventBean event = null;

         try{
            pstmt = con.prepareStatement(
                  "select * from board bd left outer join event ev on bd.board_num = ev.board_num where BOARD_NUM = ? ");
            pstmt.setInt(1, num);

            rs= pstmt.executeQuery();

            if(rs.next()){
               master = new MasterBean();
               board = new BoardBean();
               event = new EventBean();

               board.setBoard_num(rs.getInt("BOARD_NUM"));
               board.setBoard_id(rs.getInt("BOARD_ID"));
               board.setTitle(rs.getString("TITLE"));
               board.setId(rs.getString("ID"));
               board.setNick(rs.getString("NICK"));
               board.setUpload_date(rs.getString("UPLOAD_DATE"));
               board.setView_count(rs.getInt("VIEW_COUNT"));
               event.setBoard_num(rs.getInt("BOARD_NUM"));
               event.setStart_date(rs.getString("START_DATE"));
               event.setEnd_date(rs.getString("END_DATE")); 
               event.setEvent_content(rs.getString("EVENT_CONTENT"));
               event.setEvent_photo(rs.getString("EVENT_PHOTO"));

               master.setBoardbean(board);
               master.setEventbean(event);

            }
            return master;
         }catch(Exception ex){
            System.out.println("getEventDetail ���� : " + ex);
         }finally{
            if(rs!=null)try{rs.close();}catch(SQLException ex){}
            if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
         }
         return null;
      }





   //�� ����.(recipe ����)
   public boolean recipeModify(MasterBean modifyrecipe) throws Exception{
      String sql="update board set TITLE=?";
      sql+=" where BOARD_NUM=?";
      String sql2 = "update recipe set COOKING_SERVING=?, COOKING_TIME=?,";
      sql2+= "DIFFICULTY=?, VIDEO_URL=?, ESSENTIAL_INGREDIENT=?,"+
      " SELECTIVE_INGREDIENT=?, TAG=?, THUMBNAIL=?, COOKING_COMMENT=?"
      + " where BOARD_NUM=?";

      try{
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, modifyrecipe.getBoardbean().getTitle());
         pstmt.setInt(2, modifyrecipe.getBoardbean().getBoard_num());
         pstmt.executeUpdate();
         
         pstmt = con.prepareStatement(sql2);
         pstmt.setString(1, modifyrecipe.getRecipebean().getCooking_serving());
         pstmt.setString(2, modifyrecipe.getRecipebean().getCooking_time());
         pstmt.setString(3, modifyrecipe.getRecipebean().getDifficulty());
         pstmt.setString(4, modifyrecipe.getRecipebean().getVideo_url());
         pstmt.setString(5, modifyrecipe.getRecipebean().getEssential_ingredient());
         pstmt.setString(6, modifyrecipe.getRecipebean().getSelective_ingredient());
         pstmt.setString(7, modifyrecipe.getRecipebean().getTag());
         pstmt.setString(8, modifyrecipe.getRecipebean().getThumbnail());
         pstmt.setString(9, modifyrecipe.getRecipebean().getCooking_comment());
         pstmt.setInt(10, modifyrecipe.getBoardbean().getBoard_num());
         pstmt.executeUpdate();
         
         
         return true;
      }catch(Exception ex){
         System.out.println("recipeModify ���� : " + ex);
      }finally{
         if(rs!=null)try{rs.close();}catch(SQLException ex){}
         if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
      }
      return false;
   }
   
   
   
   
   //�� ����.(talk ����)
      public boolean talkModify(MasterBean modifytalk) throws Exception{
         String sql="update board set TITLE=?";
         sql+=" where BOARD_NUM=?";
         String sql2 = "update talk set TALK_CATEGORY=?, LOVE=?,";
         sql2+= "TALK_CONTENT=?, TALK_PHOTO=?" + " where BOARD_NUM=?";

         try{
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, modifytalk.getBoardbean().getTitle());
            pstmt.setInt(2, modifytalk.getBoardbean().getBoard_num());
            pstmt.executeUpdate();
            
            pstmt = con.prepareStatement(sql2);
            pstmt.setInt(1, modifytalk.getTalkbean().getTalk_category());
            pstmt.setInt(2, modifytalk.getTalkbean().getLove());
            pstmt.setString(3, modifytalk.getTalkbean().getTalk_content());
            pstmt.setString(4, modifytalk.getTalkbean().getTalk_photo());
            pstmt.setInt(5, modifytalk.getBoardbean().getBoard_num());
            pstmt.executeUpdate();
            
            
            return true;
         }catch(Exception ex){
            System.out.println("talkModify ���� : " + ex);
         }finally{
            if(rs!=null)try{rs.close();}catch(SQLException ex){}
            if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
         }
         return false;
      }
      
      
      
      
      //�� ����.(reply ����)
            public boolean replyModify(ReplyBean modifyreply) throws Exception{
               String sql="update reply set REPLY_CONTENT=?, ";
               sql+=" where REPLY_NUM=?";
               

               try{
                  pstmt = con.prepareStatement(sql);
                  pstmt.setString(1, modifyreply.getReply_content());
                  pstmt.setInt(2, modifyreply.getReply_num());
                  pstmt.executeUpdate();
                  
                  
                  
                  return true;
               }catch(Exception ex){
                  System.out.println("replyModify ���� : " + ex);
               }finally{
                  if(rs!=null)try{rs.close();}catch(SQLException ex){}
                  if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
               }
               return false;
            }



}


