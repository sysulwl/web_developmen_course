import java.io.*;
import java.util.*;

public class MapTest1{
  public static void main(String[] args)throws IOException{
     char keys[] ={'春','秋','日','月','山','水','夜'}; 
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
	 
	 Iterator<Character> it= map.keySet().iterator(); 
	 while (it.hasNext()) 
	{
		Character key = (Character) it.next();
		Integer value = map.get(key); // 根据
		if (text1(key))
			 System.out.println(key + " " + value);
		 
	}
	
	 Iterator<Character> it2= map.keySet().iterator(); 
	 while (it2.hasNext()) 
	{
		Character key = (Character) it2.next();
		Integer value = map.get(key); // 根据
		if (value > 10 ) 
			 System.out.println(key + " " + value);
		 
	}
  }
	static boolean isAsked(char c)
	{
		if( c == '；' || c == '，' ||c == '.' ||c == '。' ||c == ',' ||c == '；' ||c == ' ' ||c == '\r' ||c == '\n' ||c == '\n' ||
		c == '\t') return false;
		if( c - '0' >= 0 &&  c - '0' <= 9) return false;
		return true;
	}
	
	static boolean text1(char c) //accodring to the ask of test1
	{
		if( c == '春' || c == '秋' ||c == '日' ||c == '月' ||c == '山' ||c == '水' ||c == '夜') return true;
		return false;
	}
	
  static String readFile(String fileName) throws IOException{
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

