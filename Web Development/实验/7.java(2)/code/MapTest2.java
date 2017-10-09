import java.io.*;
import java.util.*;

public class MapTest2{
  public static void main(String[] args)throws IOException
  {
     String content = readFile(".\\poem.txt");
	 HashMap<Character, Integer> map = new HashMap<Character, Integer>();
	 for(int i = 0 ; i < content.length() ; i++)
	 {
		 Character temp = new Character(content.charAt(i));
		 if(isAsked(temp))
		 {
			 if(map.containsKey(temp))
			{
				int k = (map.get(temp));
				map.put(temp,k+1);
			}
			else 
			{
				map.put(temp,1);
			} 
		 } 
	 }
	 TreeMap<Integer,String> treeMap = new TreeMap<Integer,String>();
	for(Map.Entry<Character,Integer>entry:map.entrySet())
	{
		Integer value=entry.getValue();
		StringBuilder tmp=new StringBuilder("");
		 for(Map.Entry<Character, Integer>entry2:map.entrySet())
		 {
			if(value==entry2.getValue())
			{
				if(entry2.getKey()==' ') continue;
				tmp.append(entry2.getKey()+",");
			}
		}
		tmp.deleteCharAt(tmp.length()-1);//最后加的那个逗号
		treeMap.put(value, tmp.toString());
	}
	StringBuilder result=new StringBuilder("");
	 Iterator<Integer>it=treeMap.keySet().iterator();
	for(Map.Entry<Integer, String>entry:treeMap.entrySet())
	{
		String tmp="frequency:"+entry.getKey()+" char:"+entry.getValue();
		result.append(tmp+"\n");
		  
	}
	result.deleteCharAt(result.length()-1);//
	String[] datas=result.toString().split("\n");//
	for(int index=datas.length-1;index>=0;index--)
	{
		System.out.println(datas[index]);
	}
  }
	static boolean isAsked(char c)
	{
		if( c == '；' || c == '，' ||c == '.' ||c == '。' ||c == ',' ||c == '；' ||c == ' ' ||c == '\r' ||c == '\n' ||
		c == '\t') return false;
		if( c - '0' >= 0 &&  c - '0' <= 9) return false;
		return true;
	}
	
	static boolean text1(char c) //accodring to the ask of test1
	{
		if( c == '春' || c == '秋' ||c == '日' ||c == '月' ||c == '山' ||c == '水' ||c == '夜') return true;
		return false;
	}
	
	static String readFile(String fileName) throws IOException
	{
    	StringBuilder sb = new StringBuilder("");
        String s1="";
		int c1;
		FileInputStream f1= new FileInputStream(fileName);		
		InputStreamReader in = new InputStreamReader(f1, "UTF-8");

		while ((c1 = in.read()) != -1) {
			sb.append((char) c1);
		}        
		return sb.toString();
	}
}

