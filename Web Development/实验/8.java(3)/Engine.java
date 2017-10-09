
public class Engine extends Car{
	String type="Mode L";
	Engine(String model, String[] wheels, String engine) {
		super(model, wheels, engine);
		// TODO Auto-generated constructor stub
	}
	Engine(String type){
		super(type);
		this.type=type;
	}
	void start(){
		System.out.println("Engine<"+type+"> starts!");
	}
	
}
