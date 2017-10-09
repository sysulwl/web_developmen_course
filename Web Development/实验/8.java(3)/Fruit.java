import java.util.Random;
public class Fruit {
	void eat() {
		System.out.println("Eat "+this.getClass());
	}
	public static void main(String args[]){
		Fruit[] fruits=new Fruit[20];//定义对象
		Random rnd=new Random(1);//设置初始化数据为1
		for(int i=0;i<20;i++){
			int num=rnd.nextInt(3);//产生0-2之间的数据
			Fruit fruit = null;
			switch(num){//根据随机数，定义不同的对象
			case 0:
				 fruit=new Fruit();
				break;
			case 1:
				 fruit=new Orange();
				break;
			case 2:
				fruit=new Apple();
				break;
			}
			fruits[i]=fruit;
		}
		for(Fruit f:fruits){//遍历数组，调用eat方法
			f.eat();
		}
	}
}
class Orange extends Fruit{
	void eat(){
		System.out.println("The orange tastes a little sour");
	}
}
class Apple extends Fruit{
}
