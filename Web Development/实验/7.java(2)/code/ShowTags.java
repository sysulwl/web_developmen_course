import java.io.*;

class ShowTags{
  public static void main(String[] args)throws IOException{
     String content = readFile(".\\grassland.htm");
     System.out.println(content);
  }

  static String readFile(String fileName) throws IOException{
    	StringBuilder sb = new StringBuilder("");
	int c1;
	FileInputStream f1= new FileInputStream(fileName);		
	InputStreamReader in = new InputStreamReader(f1, "UTF-8"); //why UTF-8
	int flag = 0;
	while ((c1 = in.read()) != -1) {  //read() reads next byte
		String out;
		char temp = (char) c1;
		if(flag == 1 && (temp == '>' || temp == ' '))
		{
			flag = 0;
			sb.append('\n');
		}
		if(flag == 1)
		{
			sb.append(temp);
		}
		
		
		if(temp == '<' )
		{
			flag = 1;
		}
		
	    
	}        
        return sb.toString();
  }
}


