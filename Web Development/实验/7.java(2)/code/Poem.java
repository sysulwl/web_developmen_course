import java.util.*;
public class Poem{
    public static void main(String args[]) throws Exception {
        String ci="������ŷ����ͥԺ�����������������Ļ���������յ���ұ��¥�߲�����̨·���������ĺ���ڻƻ��޼�����ס�����ʻ��������Һ�ɹ���ǧȥ";
        String ends= "�����ޣ������̣���������·��ĺ���ƻ裻ס���ȥ";
        String punc[]={"", "", "��", "��", "��", "��","��","��","��","��","��","��"};       
		String[] end = ends.split("��"); //�ѽ�β����split��Ϊ���飻
		int[] index = new int[end.length];
		ArrayList <String> array = new ArrayList<String>();
		String[] out =  new String[end.length];
		String temp;
		for(int i = 0 ; i < end.length ; i++)
		{
			index[i] =  ci.indexOf(end[i]); //��indexOf�����ҳ�ÿ�еĽ�β��ci�����е��±�
			if(i == 0) out[i] = ci.substring(0,index[0]+1); 
			else out[i] = ci.substring(index[i - 1] + 1,index[i] + 1);
			temp = out[i] + punc[i]; //��substring������ȡ�������ϱ�����
			array.add(temp); //����һ��ArrayList
		}
		//�Ѹ�ArrayList������Ԫ��������ʾ����
		Iterator<String> it = array.iterator(); // ˳��ȡ��
		while (it.hasNext()) 
		{
			System.out.println(it.next());
		}
    }

}



