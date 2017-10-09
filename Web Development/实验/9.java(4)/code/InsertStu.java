import java.util.*;
import java.sql.*;

public class InsertStu {
	static private Connection conn;
	static int cnt = -1;
	static Scanner in = new Scanner(System.in);
        static int sno = 1;
	public static void main(String args[]) {
               	if (connect()) {
                        String lineWords[];
                        // �Ƿ�������
 		        while ((lineWords=getNextLineWords())!=null) { 
                            String num = "";
                            String name= "";
                            for(int i=0;i<lineWords.length;i++){
                                if(i==0)num = num + lineWords[i];
                                else name = name + lineWords[i];
                            }
                            updateStuInfo("INSERT INTO stu(num,name)VALUES('"+num+"','"+name+"');"); 
		        }

		} 
                else {
			System.out.println("Connect Error!");
		}

	}

        public static String[] getNextLineWords(){
           if (sno==1){
     	      System.out.println("����ѧ�ź�����(�ÿո���)��exit������˳�.\r\n");
           }
           System.out.print(sno+"> ");			
	   if (!in.hasNextLine()) { // �Ƿ�������
              return null;
           }
	   String line = in.nextLine(); // ��ȡ��һ��
           line = line.trim();
           if (line.equals("exit") || line.length() == 0) {
	       return null;
	   }
           sno++;
	   return line.split(" ");	
       } 


        // ��������
	private static boolean connect() {
		String connectString = "jdbc:mysql://172.18.187.230:3306/teaching"
				+ "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8&&useSSL=false";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(connectString, "user", "123");
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}
	
	//ִ��SQL�������, ���ؽ����
	static private boolean executeUpdate(String sqlSentence) {
	     Statement stat;
	     ResultSet rs = null;
	        
	     try {
		stat = conn.createStatement();       //��ȡִ��sql���Ķ���
		cnt = stat.executeUpdate(sqlSentence); //ִ��sql���룬���ؽ����
	     } catch (Exception e) {
		System.out.println(e.getMessage());
	     }
	     return (cnt>=0);
	}

	//��ʾ������
        private static void updateStuInfo(String sqlSentence){
             if(executeUpdate(sqlSentence)){
                 System.out.println(""+cnt + " ����¼������");
             }
             else{
                 System.out.println("0����¼������");             
             }
             
       }


}