package OAuth;

import java.util.HashMap;

import net.arnx.jsonic.JSON;


public class Reader {

	public static HashMap<String, String> toHashMap(String json) throws Exception{
		HashMap<String, String> jsonHash = new HashMap<String, String>();
		System.out.println("json:"+json);

		jsonHash = JSON.decode(json, HashMap.class);

		return jsonHash;
	}
}
