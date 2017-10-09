import X.Y.*;//含A,B
import S.T.*;//含C,D

public class Test1 {
	public static void main(String[] args){
		A a=new A();
		//a.sayProtected(); //protected只能被导出类和同一个包的类所访问
		a.sayPublic();
		//a.sayPrivate();
		//a.sayDefault(); //无修饰词 只能被同一个包的类所访问
		C c=new C();
		//c.sayProtected();
		c.sayPublic();
		//c.sayPrivate();
		//c.sayDefault();
	}
}
