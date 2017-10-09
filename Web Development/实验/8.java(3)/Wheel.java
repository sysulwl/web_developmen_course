
public class Wheel extends Car{
	String type;
	int index=0;
	Wheel(String model, String[] wheels, String engine) {
		super(model, wheels, engine);
		// TODO Auto-generated constructor stub
	}
	public Wheel(String type,int index) {
		super();
		this.type=type;
		this.index=index;
		// TODO Auto-generated constructor stub
	}
	void roll(){
		System.out.println("Wheel "+index+"<"+type+"> is rolling");
	}
	
}
