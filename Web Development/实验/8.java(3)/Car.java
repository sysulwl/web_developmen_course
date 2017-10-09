
public class Car {
	String model;
	String[] wheels;
	String engine;
	Car(String model,String[] wheels,String engine){
		this.model=model;
		this.wheels=wheels;
		this.engine=engine;
	}
	Car(String engine){
		this.engine=engine;
	}
	Car(){
	}
	Car(String[] wheels){
		this.wheels=wheels;
	}
	void changeWheel(int index,String str){
		wheels[index]=str;
	}
	void start(){
		System.out.println("Car<"+model+"> is firing!");
		
	}
	public static void main(String[] args){
		String[] wheels={"BridgeStone","BridgeStone","BridgeStone","BridgeStone"};
		String model="BMW";
		String engine="Mode L";
		Car car=new Car(model,wheels,engine);
		car.start();
		car=new Engine(engine);
		car.start();
		for(int i=0;i<4;i++){
			 car=new Wheel(wheels[i],i+1);
			((Wheel) car).roll();
		}
		System.out.println("Car "+model+" is running");
		
		System.out.println("=================");
		
		String[] wheels1={"Michelin","Michelin"
				,"Michelin","BridgeStone"};
		String model1="Mercedes-Benz";
		String engine1="Model S";
		Car car1=new Car(model1,wheels,engine1);
		car1.start();
		car1=new Engine(engine);
		car1.start();
		for(int i=0;i<4;i++){
			car1=new Wheel(wheels1[i],i+1);
			((Wheel) car1).roll();
		}
		System.out.println("Car "+model1+" is running");
	}
}
