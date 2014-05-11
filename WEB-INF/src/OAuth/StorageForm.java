package OAuth;

public class StorageForm{
	String name;
	String text;

	StorageForm(String name, String text){
		this.name = name;
		this.text = text;
	}

	public boolean equals(Object obj){
		StorageForm sf = (StorageForm)obj;
		//System.out.println(this.name+" : "+sf.name);

		if(this.name.equals(sf.name)){
			return true;
		}else{
			return false;
		}
	}
}