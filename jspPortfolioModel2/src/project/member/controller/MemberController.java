package project.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.common.Util;
import project.member.model.dao.MemberDAO;
import project.member.model.dto.MemberDTO;


@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}
	
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Util util = new Util();
		
		String[] serverInfo = util.getServerInfo(request);
		String referer = serverInfo[0]; //이전페이지
		String path = serverInfo[1]; // 프로젝트명
		String url = serverInfo[2]; // http://localhost:8090/jspPortfolioModel2 그뒤주소
		String uri = serverInfo[3]; // path + 그뒤 주소
		String ip = serverInfo[4]; // ip
		String ip6 = serverInfo[5];
		String folderName = serverInfo[6];
		String fileName = serverInfo[7];
		request.setAttribute("path", path);
		request.setAttribute("ip", ip);
		request.setAttribute("folderName", folderName);
		request.setAttribute("fileName", fileName + ".jsp");  // main안에서 이루어지기위해 매개변수를 날림
		
		String[] sessionArray = util.getSessionCheck(request);
		int sessionNo = Integer.parseInt(sessionArray[0]);
		String sessionId = sessionArray[1];
		String sessionName = sessionArray[2];
		
		if(sessionNo <= 0 ) { //로그인 안한 상태
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 이용 해주세요')");
			out.println("location.href = '" + path + "';");
			out.println("</script>");
			return;
		}
		
		
		
		String pageNumber_ = request.getParameter("pageNumber");
		String searchGubun = request.getParameter("searchGubun");
		String searchData = request.getParameter("searchData");
		
		int pageNumber = util.getNumberCheck(pageNumber_, 1);
		
		String imsiSearchYN = "O";
		searchGubun = util.getNullBlankCheck(searchGubun);
		searchData = util.getNullBlankCheck(searchData);
		
		if(searchGubun.equals("")||searchData.equals("")) {
			imsiSearchYN = "X";
			searchData ="";
			searchGubun ="";
		}
		
		searchGubun = URLDecoder.decode(searchGubun , "utf-8");
		searchData = URLDecoder.decode(searchData, "utf-8");
		String searchQuery = "pageNumber=" + pageNumber;
		searchQuery += "&searchGubun=&searchData=";
		if(imsiSearchYN.equals("O")) {
			String imsiSearchGubun = URLEncoder.encode(searchGubun,"utf-8");
			String imsiSearchData = URLEncoder.encode(searchData,"utf-8");
			searchQuery = "pageNumber=" + pageNumber;
			searchQuery = "&searchGubun="+imsiSearchGubun + "&searchData=" + imsiSearchData;
		}
		
	
		
		request.setAttribute("searchQuery", searchQuery);
		request.setAttribute("searchGubun", searchGubun);
		request.setAttribute("searchData", searchData);
		
		
		String forwardPage = "/WEB-INF/project/main/main.jsp"; //index.jsp 파일이 있는경로 설정
		if(fileName.equals("list")) {
	         
	        int pageSize = 3;
	        int blockSize = 5;
	        
	        
			
			
	        MemberDTO arguDto2 = new MemberDTO();
	        arguDto2.setSearchData(searchData);
	        arguDto2.setSearchGubun(searchGubun);
	        
	        MemberDAO dao = new MemberDAO();
	        
	        int totalRecord = dao.getTotalRecord(arguDto2);
	        int block = (pageNumber - 1) / blockSize;
	        int jj = totalRecord - pageSize * (pageNumber - 1);
	        
	        double totalPageDou = Math.ceil(totalRecord / (double)pageSize);
	        int totalPage = (int)totalPageDou;
	        
	        int startRecord = pageSize * (pageNumber - 1) + 1;
	        int lastRecord = pageSize * pageNumber;
	        int totalBlock = totalPage / blockSize;
	        
	        
	        request.setAttribute("totalPage", totalPage);
	        request.setAttribute("totalRecord", totalRecord);
	        request.setAttribute("pageSize", pageSize);
	        request.setAttribute("pageNumber", pageNumber);
	        request.setAttribute("blockSize", blockSize);
	        request.setAttribute("block", block);
	        request.setAttribute("jj", jj);
	        request.setAttribute("startRecord", startRecord);
	        request.setAttribute("lastRecord", lastRecord);
	        
	        MemberDTO arguDto = new MemberDTO();
	        arguDto.setSearchData(searchData);
	        arguDto.setSearchGubun(searchGubun);
	        arguDto.setStartRecord(startRecord);
	        arguDto.setLastRecord(lastRecord);
	        
	        ArrayList<MemberDTO> list = dao.getSelectAll(arguDto);
			request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("view")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			if(no == 0 ) {
				return;
			}
			
			MemberDTO arguDto = new MemberDTO();
			arguDto.setNo(no);
			arguDto.setSearchData(searchData);
	        arguDto.setSearchGubun(searchGubun);
	        
			MemberDAO memberDao = new MemberDAO();
			MemberDTO resultDto = memberDao.getSelectOne(arguDto);
			
			request.setAttribute("dto", resultDto);
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("chuga")) {
			
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("sujung")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(sessionNo > 0 && no == 0) {
				no = sessionNo;
			}
			MemberDTO arguDto = new MemberDTO();
			arguDto.setNo(no);
			if(no == 0 ) {
				return;
			}
			arguDto.setSearchData(searchData);
	        arguDto.setSearchGubun(searchGubun);
			MemberDAO memberDao = new MemberDAO();
			MemberDTO resultDto = memberDao.getSelectOne(arguDto);
			
			request.setAttribute("dto", resultDto);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("sakje")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			if(sessionNo > 0 && no == 0) {
				no = sessionNo;
			}
			MemberDTO arguDto = new MemberDTO();
			arguDto.setNo(no);
			if(no == 0 ) {
				return;
			}
			arguDto.setSearchData(searchData);
	        arguDto.setSearchGubun(searchGubun);
			MemberDAO memberDao = new MemberDAO();
			MemberDTO resultDto = memberDao.getSelectOne(arguDto);
			
			request.setAttribute("dto", resultDto);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("search")) {
			
	         
	         String moveUrl = path+"/member_servlet/member_list.do?";
	         moveUrl += searchQuery;
	         response.sendRedirect(moveUrl);

			
		} else if(fileName.equals("chugaProc")) {
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String passwdChk = request.getParameter("passwdChk");
			String name = request.getParameter("name");
			String jumin1 = request.getParameter("jumin1");
			String jumin2 = request.getParameter("jumin2");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			String postcode = request.getParameter("postcode");
			String address = request.getParameter("address");
			String detailAddress = request.getParameter("detailAddress");
			String extraAddress = request.getParameter("extraAddress");
			String tempId = request.getParameter("tempId");
			//null, 공백값 체크
			id = util.getNullBlankCheck(id);
			tempId = util.getNullBlankCheck(tempId);
			passwd = util.getNullBlankCheck(passwd);
			name = util.getNullBlankCheck(name);
			jumin1 = util.getNullBlankCheck(jumin1);
			jumin2 = util.getNullBlankCheck(jumin2);
			phone1 = util.getNullBlankCheck(phone1);
			phone2 = util.getNullBlankCheck(phone2);
			phone3 = util.getNullBlankCheck(phone3);
			email1 = util.getNullBlankCheck(email1);
			email2 = util.getNullBlankCheck(email2);
			postcode = util.getNullBlankCheck(postcode);
			detailAddress = util.getNullBlankCheck(detailAddress);
			extraAddress = util.getNullBlankCheck(extraAddress);
			
			int failCounter = 0;
			if(id.equals("")) { failCounter++; System.out.println("1");}
			if(tempId.equals("")) { failCounter++; System.out.println("1");}
			if(!passwd.equals(passwdChk) || passwd.equals("")) { failCounter++; System.out.println("2"); }
			if(name.equals("")) { failCounter++; System.out.println("3");}
			if(jumin1.equals("")) { failCounter++; System.out.println("4");}
			if(jumin2.equals("")) { failCounter++; System.out.println("5");}
			if(phone1.equals("")) { failCounter++; System.out.println("6");}
			if(phone2.equals("")) { failCounter++; System.out.println("7");}
			if(phone3.equals("")) { failCounter++; System.out.println("8");}
			if(email1.equals("")) { failCounter++; System.out.println("9");}
			if(email2.equals("")) { failCounter++; System.out.println("10");}
			if(postcode.equals("")) { failCounter++; System.out.println("11");}
			if(detailAddress.equals("")) { failCounter++;System.out.println("12"); }
			if(extraAddress.equals("")) { extraAddress = "-"; }
			
			if(!id.equals(tempId)) {
				failCounter++; //앞단에서 처리했더라도 뒤에서도 처리해줘야함
			}
			
			id = util.getCheckString(id);
			name = util.getCheckString(name);
			jumin1 = util.getCheckString(jumin1);
			jumin2 = util.getCheckString(jumin2);
			phone1 = util.getCheckString(phone1);
			phone2 = util.getCheckString(phone2);
			phone3 = util.getCheckString(phone3);
			email1 = util.getCheckString(email1);
			email2 = util.getCheckString(email2);
			postcode = util.getCheckString(postcode);
			detailAddress = util.getCheckString(detailAddress);
			extraAddress = util.getCheckString(extraAddress);
			
			int imsi = 0;
			
			imsi = util.getNumberCheck(jumin1, 0);
			if(!(jumin1.length() == 6 && imsi > 0)) {
				failCounter++; System.out.println("13");
			}
			imsi = util.getNumberCheck(jumin2, 0);
			if(!(jumin2.length() == 1 && imsi > 0)) {
				failCounter++; System.out.println("14");
			}
			if(!(phone1.equals("010") || phone1.equals("011") ||phone1.equals("016"))) {
				failCounter++; System.out.println("15");
			}
			imsi = util.getNumberCheck(phone2, 0);
			if(!(phone2.length() == 4 && imsi > 0)) {
				failCounter++; System.out.println("16");
			}
			imsi = util.getNumberCheck(phone3, 0);
			if(!(phone3.length() == 4 && imsi > 0)) {
				failCounter++; System.out.println("17");
			}
			if(failCounter > 0) {
				return;
			}
			
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setJumin1(jumin1);
			dto.setJumin2(jumin2);
			dto.setPhone1(phone1);
			dto.setPhone2(phone2);
			dto.setPhone3(phone3);
			dto.setEmail1(email1);
			dto.setEmail2(email2);
			dto.setPostcode(postcode);
			dto.setAddress(address);
			dto.setDetailAddress(detailAddress);
			dto.setExtraAddress(extraAddress);
			
			MemberDAO dao = new MemberDAO();
			int result = dao.setInsert(dto);
			if(result > 0) {
				response.sendRedirect(path+"/member_servlet/member_list.do");
			} else {
				response.sendRedirect(path+"/member_servlet/member_chuga.do");
			}
		} else if(fileName.equals("sujungProc")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			String passwd = request.getParameter("passwd");
			String phone1 = request.getParameter("phone1");
			String phone2 = request.getParameter("phone2");
			String phone3 = request.getParameter("phone3");
			String email1 = request.getParameter("email1");
			String email2 = request.getParameter("email2");
			String postcode = request.getParameter("postcode");
			String address = request.getParameter("address");
			String detailAddress = request.getParameter("detailAddress");
			String extraAddress = request.getParameter("extraAddress");
			
			//null, 공백값 체크
			passwd = util.getNullBlankCheck(passwd);
			phone1 = util.getNullBlankCheck(phone1);
			phone2 = util.getNullBlankCheck(phone2);
			phone3 = util.getNullBlankCheck(phone3);
			email1 = util.getNullBlankCheck(email1);
			email2 = util.getNullBlankCheck(email2);
			postcode = util.getNullBlankCheck(postcode);
			detailAddress = util.getNullBlankCheck(detailAddress);
			extraAddress = util.getNullBlankCheck(extraAddress);
			
			int failCounter = 0;
			if(phone1.equals("")) { failCounter++; System.out.println("6");}
			if(phone2.equals("")) { failCounter++; System.out.println("7");}
			if(phone3.equals("")) { failCounter++; System.out.println("8");}
			if(email1.equals("")) { failCounter++; System.out.println("9");}
			if(email2.equals("")) { failCounter++; System.out.println("10");}
			if(postcode.equals("")) { failCounter++; System.out.println("11");}
			if(detailAddress.equals("")) { failCounter++;System.out.println("12"); }
			if(extraAddress.equals("")) { extraAddress = "-"; }
			
			
			
			
			int imsi = 0;
			if(!(phone1.equals("010") || phone1.equals("011") ||phone1.equals("016"))) {
				failCounter++; System.out.println("15");
			}
			imsi = util.getNumberCheck(phone2, 0);
			if(!(phone2.length() == 4 && imsi > 0)) {
				failCounter++; System.out.println("16");
			}
			imsi = util.getNumberCheck(phone3, 0);
			if(!(phone3.length() == 4 && imsi > 0)) {
				failCounter++; System.out.println("17");
			}
			if(failCounter > 0) {
				return;
			}
			phone1 = util.getCheckString(phone1);
			phone2 = util.getCheckString(phone2);
			phone3 = util.getCheckString(phone3);
			email1 = util.getCheckString(email1);
			email2 = util.getCheckString(email2);
			postcode = util.getCheckString(postcode);
			detailAddress = util.getCheckString(detailAddress);
			extraAddress = util.getCheckString(extraAddress);
			
			MemberDTO dto = new MemberDTO();
			dto.setNo(no);
			dto.setPasswd(passwd);
			dto.setPhone1(phone1);
			dto.setPhone2(phone2);
			dto.setPhone3(phone3);
			dto.setEmail1(email1);
			dto.setEmail2(email2);
			dto.setPostcode(postcode);
			dto.setAddress(address);
			dto.setDetailAddress(detailAddress);
			dto.setExtraAddress(extraAddress);
			
			MemberDAO dao = new MemberDAO();
			int result = dao.setUpdate(dto);
			if(result > 0) {
				response.sendRedirect(path+"/member_servlet/member_view.do?no=" + no + "&" + searchQuery);
			} else {
				response.sendRedirect(path+"/member_servlet/member_sujung.do?no=" + no + "&" + searchQuery);
			}
			
		} else if(fileName.equals("sakjeProc")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			String passwd = request.getParameter("passwd");
			
			//null, 공백값 체크
			passwd = util.getNullBlankCheck(passwd);
			
			MemberDTO dto = new MemberDTO();
			dto.setNo(no);
			dto.setPasswd(passwd);
			
			MemberDAO memberDao = new MemberDAO();
			MemberDTO resultDto = memberDao.getSelectOne(dto);
			if(!resultDto.getPasswd().equals(passwd)) { //비밀번호가 틀리면 return
				return;
			}
			MemberDAO dao = new MemberDAO();
			int result = dao.setDelete(dto);
			if(result > 0) {
				response.sendRedirect(path+"/member_servlet/member_list.do" );
			} else {
				response.sendRedirect(path+"/member_servlet/member_sakje.do?no=" + no + "&" + searchQuery);
			}
		} else if(fileName.equals("idCheckWin")) {
			request.setAttribute("imsiId", "");
			forwardPage = "/WEB-INF/project/member/idCheckWin.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("idCheckWinProc")) {
			String id = request.getParameter("id");
			id = util.getNullBlankCheck(id);
			
			MemberDTO arguDto = new MemberDTO();
			arguDto.setId(id);
			
			MemberDAO dao = new MemberDAO();
			int result = dao.getIdCheckWin(arguDto);
			
			String imsiId = id;
			String msg = "사용 가능한 아이디입니다.";
			if(result > 0) {
				imsiId = "";
				msg = "사용 불가능한 아이디입니다.";
			} 
			
			request.setAttribute("imsiId", imsiId);
			request.setAttribute("id", id);
			request.setAttribute("msg", msg);
			
			forwardPage = "/WEB-INF/project/member/idCheckWin.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("idCheck")) {
			String id = request.getParameter("id");
			id = util.getNullBlankCheck(id);
			
			MemberDTO arguDto = new MemberDTO();
			arguDto.setId(id);
			
			MemberDAO dao = new MemberDAO();
			int result = dao.getIdCheckWin(arguDto);
			response.setContentType("text/html; charset=utf-8;");
			PrintWriter out = response.getWriter();
			out.print(result);
			out.flush();
			out.close();
			return;
		} else {
			
		}
		
	
	}

}
