import java.util.*;
public class Poem{
    public static void main(String args[]) throws Exception {
        String ci="蝶恋花欧阳修庭院深深深几许杨柳堆烟帘幕无重数玉勒雕鞍游冶处楼高不见章台路雨横风狂三月暮门掩黄昏无计留春住泪眼问花花不语乱红飞过秋千去";
        String ends= "花；修；几许；烟；数；处；路；暮；黄昏；住；语；去";
        String punc[]={"", "", "，", "，", "。", "，","。","，","，","。","，","。"};       
		String[] end = ends.split("；"); //把结尾字用split变为数组；
		int[] index = new int[end.length];
		ArrayList <String> array = new ArrayList<String>();
		String[] out =  new String[end.length];
		String temp;
		for(int i = 0 ; i < end.length ; i++)
		{
			index[i] =  ci.indexOf(end[i]); //用indexOf依次找出每行的结尾在ci对象中的下标
			if(i == 0) out[i] = ci.substring(0,index[0]+1); 
			else out[i] = ci.substring(index[i - 1] + 1,index[i] + 1);
			temp = out[i] + punc[i]; //用substring把整句取出，加上标点符号
			array.add(temp); //放入一个ArrayList
		}
		//把该ArrayList的所有元素依次显示出来
		Iterator<String> it = array.iterator(); // 顺序取出
		while (it.hasNext()) 
		{
			System.out.println(it.next());
		}
    }

}



