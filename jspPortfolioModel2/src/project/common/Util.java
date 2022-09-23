package project.common;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.bouncycastle.cert.ocsp.Req;

public class Util {

	public String[] getServerInfo(HttpServletRequest request) throws UnknownHostException {
		// 이걸사용 하기 위해 HttpServletRequest 써줘야함
		// 이전페이지주소가 뭔지 알아내는 변수
		String referer = request.getHeader("REFERER");
		if (referer == null || referer.trim().equals("")) {
			referer = "";
		}

		String path = request.getContextPath();
		String url = request.getRequestURL().toString();
		String uri = request.getRequestURI().toString();
		String ip = Inet4Address.getLocalHost().getHostAddress();

		String ip6 = request.getHeader("X-Forwarded-For");
		if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {
			ip6 = request.getHeader("Proxy-Client-IP");
		}
		if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {
			ip6 = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {
			ip6 = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {
			ip6 = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {
			ip6 = request.getRemoteAddr();
		}
		
		String[] imsiUriArray = uri.split("/");
		String imsiUriFileName = imsiUriArray[imsiUriArray.length - 1];
		imsiUriFileName = imsiUriFileName.replace(".do", ""); //dashBoard_index
		if(imsiUriFileName.equals("jspPortfolioModel2")) {
			imsiUriFileName = "dashBoard_index.do";
		}
	
		String[] imsiArray = imsiUriFileName.split("_"); 
		String folderName = imsiArray[0];
		String fileName = imsiArray[1];
	
		
		if(imsiUriFileName.equals(".do")) { 

		} else if(imsiUriFileName.equals("01Proc.do")){
			
		}

		String[] array = new String[8];
		array[0] = referer;
		array[1] = path;
		array[2] = url;
		array[3] = uri;
		array[4] = ip;
		array[5] = ip6;
		array[6] = folderName;
		array[7] = fileName;
		
		return array;
	}

	public int getNumberCheck(String str, int defaultStr) {
		int result = 0;

		String temp = str;

		if (temp == null || temp.trim().equals("")) {
			temp = "-";
		}
		for (int i = 0; i <= 9; i++) {
			temp = temp.replace(i + "", "");
		}
		if (temp.equals("")) {// 숫자로만 구성된
			result = Integer.parseInt(str);
		} else {
			result = defaultStr;
		}

		return result;
	}

	public String getNullBlankCheck(String str) {
		String result = str;
		if (str == null || str.trim().equals("")) {
			result = "";
		}
		return result;
	}

	public int[] getCalendar() {
		Calendar cal = Calendar.getInstance();

		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);
		System.out.println(year + "년" + month + "월" + day + "일" + hour + "시" + minute + "분" + second + "초");

		int[] result = new int[6];
		result[0] = year;
		result[1] = month;
		result[2] = day;
		result[3] = hour;
		result[4] = minute;
		result[5] = second;

		return result;
	}
	
	
	public String getDateTime() {
		int[] intResult = getCalendar();
		String result = "";
		for (int i = 0; i < intResult.length; i++) {
			String tmp = intResult[i] + "";
			if (tmp.length() < 2) {
				result += "0" + tmp;
			} else {
				result += tmp;
			}
		}
		System.out.println(result);
		return result;
	}
	
	
	
	public String getCheckString(String str) {
		String result = str;
		 result = result.replace("&", "&amp;");
		 result = result.replace("<", "&lt;");
		 result = result.replace(">", "&gt;");
		 result = result.replace("\"", "&quot;");
		 result = result.replace("'", "&apos;");
		 return result;
	}

	public String createUuid() {
		return UUID.randomUUID().toString();
	}
}
