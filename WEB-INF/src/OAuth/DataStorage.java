package OAuth;

import java.util.ArrayList;

public class DataStorage {

	static ArrayList<StorageForm> list = new ArrayList<StorageForm>();

	public static void addFileData(String name, String text){
		list.add(new StorageForm(name, text));
	}

	public static String getFileData(String name){
		int index = list.indexOf(new StorageForm(name, null));
		String str = list.get(index).text;
		list.remove(index);

		return str;
	}
}
