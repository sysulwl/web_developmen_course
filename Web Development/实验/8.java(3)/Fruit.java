import java.util.Random;
public class Fruit {
	void eat() {
		System.out.println("Eat "+this.getClass());
	}
	public static void main(String args[]){
		Fruit[] fruits=new Fruit[20];//�������
		Random rnd=new Random(1);//���ó�ʼ������Ϊ1
		for(int i=0;i<20;i++){
			int num=rnd.nextInt(3);//����0-2֮�������
			Fruit fruit = null;
			switch(num){//��������������岻ͬ�Ķ���
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
		for(Fruit f:fruits){//�������飬����eat����
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
