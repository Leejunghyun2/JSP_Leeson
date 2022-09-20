package _common;

import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

public class Util {
	
	public int getNumberCheck(String str, int defaultStr) {
		int result = 0;
		
		String temp = str;
		
		if(temp == null || temp.trim().equals("")) {
			temp = "-";
		}
		for(int i=0; i<=9; i++) {
			temp = temp.replace(i + "", "");
		}
		if(temp.equals("")) {//숫자로만 구성된
			result = Integer.parseInt(str);
		} else {
			result = defaultStr;
		}
		
		return result;
	}
	
	public String getNullBlankCheck(String str) {
		String result = str;
		if(str == null || str.trim().equals("")) {
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
		for(int i=0; i<intResult.length; i++) {
			String tmp = intResult[i] + "";
			if(tmp.length() < 2) {
				result += "0" + tmp;
			} else {
				result += tmp;
			}
		}
		System.out.println(result);
		return result;
	}
	
	
	public String createUuid() {
		return UUID.randomUUID().toString();
	}
}
