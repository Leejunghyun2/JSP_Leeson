package test;

public class text {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String hakbun_ = "12345";
		boolean check = true;
		for(int i=0; i<hakbun_.length(); i++) {
			char temp = hakbun_.charAt(i);			
				if (temp < '0' || temp > '9' ) {
					check = false;
					break;
				} 
		}
		System.out.println(check);
		System.out.println(hakbun_.replace("1", ""));
		System.out.println(hakbun_);
		
	}

}
