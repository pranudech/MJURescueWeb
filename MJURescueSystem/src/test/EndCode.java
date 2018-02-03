package test;

import java.io.UnsupportedEncodingException;

import com.sun.xml.internal.messaging.saaj.util.Base64;

public class EndCode {
	public static void main(String[] args) {
		
		String strip = "1234";        
	     byte[] encryptArray = Base64.encode(strip.getBytes());        
	     String encstr = null;
		try {
			encstr = new String(encryptArray,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}   
	     System.out.println("Enc   >>  "+ encstr);
	     String decarray = Base64.base64Decode(encstr);
	     System.out.println("Dec   >>  "+ decarray);
	}
}
