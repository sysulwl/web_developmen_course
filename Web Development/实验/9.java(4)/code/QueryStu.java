import java.util.*;
import java.sql.*;

public class QueryStu {
	static private Connection conn;
	static int cnt = 0;
	static Scanner in = new Scanner(System.in);
        static int sno = 1;
	public static void main(String args[]) {
               	if (connect()) {
                        String lineWords[];
                        // �Ƿ�������
 		        while ((lineWords=getNextLineWords())!=null) { 
                            String s = "";
                            for(int i=0;i<lineWords.length;i++){
                                s = s + lineWords[i];
                            }
                            ResultSet rs;
                            String ss = s.substring(0,1); 
                            if(ss.equals("*")){
                                rs = executeQuery("select * from stu;");
                            }
                            else if(ss.equals("-")){
                                s = s.substring(1,s.length());
                                rs = executeQuery("SELECT * FROM stu WHERE id="+s + ";");
                            }
                            else{
                                rs = executeQuery("SELECT * FROM stu WHERE num LIKE \"%"+s+"%\""+" OR name LIKE \"%"+s+"%\" ORDER BY num;");
                            }
			    showStudents(rs);  
		        }

		} 
                else {
			System.out.println("Connect Error!");
		}

	}

        public static String[] getNextLineWords(){
           if (sno==1){
     	      System.out.println("��ѯѧ�ź�����(����ƥ��)����-��ͷ��ѯid��*������еļ�¼��exit������˳�.\r\n");
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
	
	//ִ��SQL��ѯ���, ���ؽ����
	static private ResultSet executeQuery(String sqlSentence) {
	     Statement stat;
	     ResultSet rs = null;
	        
	     try {
		stat = conn.createStatement();       //��ȡִ��sql���Ķ���
		rs = stat.executeQuery(sqlSentence); //ִ��sql��ѯ�����ؽ����
	     } catch (Exception e) {
		System.out.println(e.getMessage());
	     }
	     return rs;
	}

	//��ʾ��ѯ���
	private static void showStudents(ResultSet rs){
	    try {
               int length = 0;
	       while(rs.next()){
	          System.out.println(rs.getString("id")+" "+rs.getString("num")+" "+rs.getString("name"));
                  length++;		   
	       }
               System.out.println("["+length+"����¼]");
	    }
	    catch (Exception e) {
		System.out.println(e.getMessage());
	    }
	}


}