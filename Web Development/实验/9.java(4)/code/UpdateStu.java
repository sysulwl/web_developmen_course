import java.util.*;
import java.sql.*;

public class UpdateStu {
	static private Connection conn;
	static int cnt = -1;
	static Scanner in = new Scanner(System.in);
        static int sno = 1;
	public static void main(String args[]) {
               	if (connect()) {
                        String lineWords[];
                        // 是否还有输入
 		        while ((lineWords=getNextLineWords())!=null) { 
                            String num = "";
                            String name= "";
                            String id= "";
                            for(int i=0;i<lineWords.length;i++){
                                if(lineWords.length==3){
                                   if(i==0)id= id + lineWords[i];
                                   else if(i==1) num = num + lineWords[i];
                                   else name = name + lineWords[i];
                                }
                                else {
                                   if(i==0) num = num + lineWords[i];
                                   else name = name + lineWords[i];
                                }
                            }
                            if(lineWords.length==3){
                               updateStuInfo("UPDATE stu SET num='"+num+"', name='"+name+"'  WHERE id="+id+";"); 
                            }
                            else{
                               updateStuInfo("UPDATE stu SET name='"+name+"'  WHERE num= '"+num+"';");        
                            }
                            
		        }

		} 
                else {
			System.out.println("Connect Error!");
		}

	}

        public static String[] getNextLineWords(){  //可以读取空格，通过空格分隔返回一个字符串数组
           if (sno==1){
     	      System.out.println("输入学号,姓名或者id,学号，姓名，exit或空行退出.\r\n");
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
	
	//执行SQL修改语句, 返回结果集
	static private boolean executeUpdate(String sqlSentence) {
	     Statement stat;
	     ResultSet rs = null;
	        
	     try {
		stat = conn.createStatement();       //获取执行sql语句的对象
		cnt = stat.executeUpdate(sqlSentence); //执行sql修改，返回结果集
	     } catch (Exception e) {
		System.out.println(e.getMessage());
	     }
	     return (cnt>=0);
	}

	//显示插入结果
        private static void updateStuInfo(String sqlSentence){
             if(executeUpdate(sqlSentence)){
                 System.out.println(""+cnt + " 个记录被修改");
             }
             else{
                 System.out.println("0个记录被修改");             
             }
             
       }


}