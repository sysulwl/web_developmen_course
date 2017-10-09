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
                        // 是否还有输入
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
     	      System.out.println("查询学号和姓名(部分匹配)，以-开头查询id，*查出所有的记录，exit或空行退出.\r\n");
           }
           System.out.print(sno+"> ");			
	   if (!in.hasNextLine()) { // 是否还有输入
              return null;
           }
	   String line = in.nextLine(); // 读取下一行
           line = line.trim();
           if (line.equals("exit") || line.length() == 0) {
	       return null;
	   }
           sno++;
	   return line.split(" ");	
       } 


        // 建立连接
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
	
	//执行SQL查询语句, 返回结果集
	static private ResultSet executeQuery(String sqlSentence) {
	     Statement stat;
	     ResultSet rs = null;
	        
	     try {
		stat = conn.createStatement();       //获取执行sql语句的对象
		rs = stat.executeQuery(sqlSentence); //执行sql查询，返回结果集
	     } catch (Exception e) {
		System.out.println(e.getMessage());
	     }
	     return rs;
	}

	//显示查询结果
	private static void showStudents(ResultSet rs){
	    try {
               int length = 0;
	       while(rs.next()){
	          System.out.println(rs.getString("id")+" "+rs.getString("num")+" "+rs.getString("name"));
                  length++;		   
	       }
               System.out.println("["+length+"条记录]");
	    }
	    catch (Exception e) {
		System.out.println(e.getMessage());
	    }
	}


}