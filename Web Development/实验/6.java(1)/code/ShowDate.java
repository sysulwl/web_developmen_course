import java.util.*; 
import java.text.*; 

public class ShowDate{
    public static void main(String args[]) throws Exception {
		Date now = new Date();
		System.out.println("now: "+now);
		Calendar cal=Calendar.getInstance();
		cal.setTime(now);
		System.out.println("(1). "+getCnDate(cal)); 
		cal.set(2016,8,1,22,40,30);//设置的是9月，但是需要-1，参数为8
		System.out.println("设置的对象中，得不到星期几："+getCnDate(cal));
		cal.add(Calendar.DAY_OF_YEAR,135);
		cal.add(Calendar.SECOND,4000);
		System.out.println("(2). "+getCnDate(cal));
    }

    static String getCnDate(Calendar cal){
		
		String ans = "";
		ans += (cal.get(Calendar.YEAR)+ "年" + (int)(cal.get(Calendar.MONTH)+1) + "月" + cal.get(Calendar.DAY_OF_MONTH) + "日");
		ans += (cal.get(Calendar.HOUR_OF_DAY) + "时" + cal.get(Calendar.MINUTE) + "分" + "星期" );
		String temp = "";
		switch (cal.get(Calendar.DAY_OF_WEEK))
		{
		case 1:temp = "天";break; //星期天是一周的开始
		case 2:temp = "一";break;
		case 3:temp = "二";break;
		case 4:temp = "三";break;
		case 5:temp = "四";break;
		case 6:temp = "五";break;
		case 7:temp = "六";break;
		}
		System.out.println("DAY_OF_WEEK得到的值是："+ cal.get(Calendar.DAY_OF_WEEK));
		ans += temp;
		return ans;
    } 
}



