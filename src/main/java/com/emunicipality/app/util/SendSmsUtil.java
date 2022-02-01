package com.emunicipality.app.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ResourceBundle;

public class SendSmsUtil {

	/*
	 * private final static Logger logger =
	 * Logger.getLogger(SendSmsUtil.class.getName());
	 * 
	 * public static void sendMessage(String mobileno, String msg, String OTP) {
	 * 
	 * try { ResourceBundle rb = ResourceBundle.getBundle("application");
	 * 
	 * String MSG91_KEY = rb.getString("MSG91.KEY"); String MSG91_SENDER =
	 * rb.getString("MSG91.SENDER");
	 * 
	 * String url = "http://control.msg91.com/api/sendotp.php?"; url = url +
	 * "authkey=" + MSG91_KEY + "&"; url = url + "mobile=" + "0091" + mobileno +
	 * "&"; url = url + "sender=" + MSG91_SENDER + "&"; url = url +
	 * "otp_length=6&"; url = url + "otp=" + OTP + "&"; url = url +
	 * "otp_expiry=3&"; url = url + "message=" + URLEncoder.encode(msg,
	 * "UTF-8");
	 * 
	 * HttpResponse<String> responseCredSend = Unirest.post(url).asString();
	 * 
	 * JSONObject responseJsonCredSend = new JSONObject(responseCredSend);
	 * String jsonstringbody=responseJsonCredSend.getString("body"); JSONObject
	 * jObjdata = new JSONObject(jsonstringbody); statusFlag =
	 * jObjdata.getString("type");
	 * //System.out.println("status============================="+ statusFlag);
	 * 
	 * 
	 * logger.info(mobileno + "---" + responseCredSend);
	 * 
	 * } catch (Exception ex) {
	 * 
	 * logger.error(ex.getMessage()); }
	 * 
	 * 
	 * 
	 * HttpResponse<String> response = Unirest.post(
	 * "http://api.msg91.com/api/v2/sendsms?campaign=&response=&afterminutes=&schtime=&unicode=&flash=&message=&encrypt=&authkey=&mobiles=&route=&sender=&country=91")
	 * .header("authkey", "") .header("content-type", "application/json") .body(
	 * "{ \"sender\": \"SOCKET\", \"route\": \"4\", \"country\": \"91\", \"sms\": [ { \"message\": \"Message1\", \"to\": [ \"98260XXXXX\", \"98261XXXXX\" ] }, { \"message\": \"Message2\", \"to\": [ \"98260XXXXX\", \"98261XXXXX\" ] } ] }"
	 * ) .asString();
	 * 
	 * 
	 * 
	 * }
	 */
	
	/**
	 * 
	 * @param mobileno
	 * @param msg
	 * @author Aashdit-Sujit
	 */
	public static void sendTransactionalMessage(String mobileno, String msg) {

		ResourceBundle rb = ResourceBundle.getBundle("application");
		// Your authentication key.
		String authkey = rb.getString("MSG91.KEY");
		// Multiple mobile numbers separated by comma.
		String mobiles = mobileno;
		// Sender ID, While using route4 sender id should be 6 characters long.
		String senderId = rb.getString("MSG91.SENDER");
		// Your message to send, Add URL encoding here.
		String message = msg;
		// Define Route
		String route = "4";

		// Prepare Url
		URLConnection myURLConnection = null;
		URL myURL = null;
		BufferedReader reader = null;

		// Encoding Message
		String encoded_message = URLEncoder.encode(message);

		// Send SMS API
		String mainUrl = "http://api.msg91.com/api/sendhttp.php?";

		// Prepare Parameter string
		StringBuilder sbPostData = new StringBuilder(mainUrl);
		sbPostData.append("authkey=" + authkey);
		sbPostData.append("&mobiles=" + mobiles);
		sbPostData.append("&message=" + encoded_message);
		sbPostData.append("&route=" + route);
		sbPostData.append("&sender=" + senderId);

		// Final String
		mainUrl = sbPostData.toString();
		try {
			// Prepare Connection
			myURL = new URL(mainUrl);
			myURLConnection = myURL.openConnection();
			myURLConnection.connect();
			reader = new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
			// Reading Response
			String response;
			while ((response = reader.readLine()) != null)
				// Print Response
				System.out.println("SMS sent successfully.........."); 
			// Finally close connection.
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
