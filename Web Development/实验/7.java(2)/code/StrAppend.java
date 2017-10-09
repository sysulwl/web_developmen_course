import java.io.*;

class StrAppend{
  public static void main(String[] args)throws IOException{
	  long time= System.currentTimeMillis();
    String content = readFile(".\\grassland.htm");
	long time2= System.currentTimeMillis();
	long diff = time2 - time;
    System.out.println(diff);
  }

  static String readFile(String fileName) throws IOException{
    String sb = new String();
	int c1;
	FileInputStream f1= new FileInputStream(fileName);		
	InputStreamReader in = new InputStreamReader(f1, "UTF-8");

	while ((c1 = in.read()) != -1) {
	  sb = sb + (char)(c1);
	}        
        return sb;
  }
}


