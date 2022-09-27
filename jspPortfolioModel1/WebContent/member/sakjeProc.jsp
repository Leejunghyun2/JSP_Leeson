<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@ include file = "_inc_top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   request.setCharacterEncoding("UTF-8");

   String no_ = request.getParameter("no");
   int no = Integer.parseInt(no_);
   String passwd = request.getParameter("passwd");
   	//String attachInfo = request.getParameter("attachInfo");
	//공백,널값체크, 숫자만, 6,7자리맞는지, 비밀번호확인과같은지 등등 모두 체크

   MemberDTO argDto = new MemberDTO();
   argDto.setNo(no);
   argDto.setPasswd(passwd);
   
   MemberDAO dao = new MemberDAO();
   
   //db에서 바로 no가 일치하는 정보 읽어와서 삭제처리할 수 있도록 파일정보 읽어오는 것
   MemberDTO imsiDto = new MemberDTO();
   imsiDto.setNo(no);
   MemberDTO resultDto = dao.getSelectOne(imsiDto);
   String attachInfo = resultDto.getAttachInfo();
   
   int result = dao.setDelete(argDto);
   
   
   String imsiMsg = "삭제중 오류가 발생하였습니다..";
   String imsiUrl = "main.jsp?menuGubun=member_sakje&no=" +no;
   
   if(result > 0){
      imsiMsg = "삭제 성공";
      imsiUrl = "main.jsp?menuGubun=member_list";
      
      //db에서 정보 지워졌으니 파일 삭제처리 여기서 시작. 위에서 파일 지우며 만약 db삭제 처리 잘못되었을 떄 파일만 지워질 수도 있음
      String attachPath = "C:/KMJ/attach";
      String uploadPath = attachPath + request.getContextPath() + "/member";
      
      //파일 선택해서 올리느 것만 엔크타입이 필요함~! 삭제할 떈 그냐 리퀘스트해도 됨 
      String[] imsi = attachInfo.split(",");
      for(int i=0; i<imsi.length; i++){
         String[] imsi2 = imsi[i].split("[|]");
         String savedName = imsi2[1];
         String uploadFile = uploadPath + "/" +savedName;
         java.io.File f = new java.io.File(uploadFile);
         if(f.delete()){
            //파일삭제성공시
         }else{
            //파일삭제실패시  >>원래는 이렇게 처리해야하는데 사실 db에서 정보가 지워지면 파일이 지워지지 않고
            //서버에 남더라도 파일에 접근할 방법이 없으니 파일삭제는 오류가 발생해도 메모리 문제 외에 큰 문제는 없
         }
            
      }
   } 
   
   
      out.print("<script>");
      if(result <= 0){
         out.print("alert('" +imsiMsg+ "');");
      }

%>