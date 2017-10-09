<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	StringBuilder table = new StringBuilder("");
	String con = "jdbc:mysql://172.18.187.234:3306/14353205"
		+ "?autoReconnect=true&useUnicode=true"
		+ "&characterEncoding=UTF-8&useSSL=false";
	try{
		Class.forName("com.mysql.jdbc.Driver");
		// 数据库用户名  
	    String usename = "user";  
	    // 数据库密码  
	    String psw = "123";  
	    // 创建Connection连接  
	    Connection connect = DriverManager.getConnection(con,usename,psw);
	    if(connect != null) {
	    	String sql = "select * from message;";
	    	Statement stmt = connect.createStatement();
	    	ResultSet rs = stmt.executeQuery(sql);
	    	while(rs.next()){
	    		table.append("<li><p>"+rs.getString("nickname")+" : "+rs.getString("message")+"</p></li>");
	    		//table.append("<p>"+rs.getString("message")+"</p>");
	    	}
	    	stmt.close();
			
	    }
	    connect.close();
	}
	catch (Exception e) {  
	    e.printStackTrace();  }

	
	String success=request.getParameter("success");	
	String load_exit="";
	String register="";
	String load_jsp="Login.jsp";
	String register_jsp="";
	String name="";
	String image="";
	String returnToMain=new String("返回主界面");
	name=request.getParameter("name");
	String path="";
	String welcome="";
	if(returnToMain.equals(success)||success==null) 
	{
		load_exit="登录";
		register="注册";
		register_jsp="register_form.jsp";
		load_jsp="Login.jsp";
		name="";
		image="";
		//path=".\\file\\SYSU.png";
	}
	else 
	{
		load_exit="退出";
		register="";
		register_jsp="exit.jsp";
		load_jsp="exit.jsp";
		name=request.getParameter("name");	
		welcome = name+ " 欢迎您！";
		image="修改头像";
	}
	if(name != null)
		if(!name.equals("")) {
			
			String connectStr = "jdbc:mysql://172.18.187.234:3306/14353205"
					+ "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8&useSSL=false";
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
				// 数据库用户名  
		        String usename = "user";  
		        // 数据库密码  
		        String psw = "123";  
		        // 创建Connection连接  
		        Connection connect = DriverManager.getConnection(connectStr,usename,psw);
		        if(connect != null) {
		        	String sql = "select avatar from user where nickname = '"+ name +"';";
		        	Statement stmt = connect.createStatement();
		        	ResultSet rs = stmt.executeQuery(sql);
		        	if(rs.next()){
		        		path = rs.getString("avatar");  
		        	}
		        	stmt.close();
					
		        }
		        connect.close();
			}
			catch (Exception e) {  
		        e.printStackTrace();  }  
	}
	if(path != null) {
		if(!path.equals(""))
			path = ".\\file\\"+path;
		else path = ".\\file\\SYSU.png";
	}	
	else {
		path = ".\\file\\SYSU.png";
	}
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>众里寻他 </title>
    <script src="js/menu.js"></script>
    <link rel="stylesheet" href="css/header.css"></link>
    <link rel="stylesheet" href="css/nav.css"></link>
    <link rel="stylesheet" href="css/indexline.css"></link>
    <link rel="stylesheet" href="css/colsleft.css"></link>
    <link rel="stylesheet" href="css/cols02.css"></link>
    <link rel="stylesheet" href="css/footer.css"></link>
    <a href="html/header.html"></a>
    <style>
        body {
            font-family: Arial,sans-serif;
            color: #000000;
            font-size: 12px;
            margin: 0px;
            padding: 0px;
            background: #CBE967;
	
	    background-repeat:no-repeat;
        }

        p {
            margin: 0px;
            padding: 0px;
        }

        /* test */
       

        /* frame */
        #header {
            width: 998px;
            height: 108px;
	    background-repeat:repeat;
            margin: 0px auto;
            position: relative;
            padding: 0px;
			
        }

        #nav {
            width: 998px;
            height: 45px;

            font-size: 14px;
            color: #FFF;

            margin: 0 auto;
            padding: 0px;

            font-weight: bold;
            line-height: 45px;
            text-align: center;
        }

        #subnav {
            width: 998px;
            height: 41px;    
            font-size: 13px;
            margin: 0 auto;
            text-align: left;
            color: #006600;
            line-height: 40px;
        }

        #main {
            background-color:#CBE967;

            overflow: hidden;
            padding: 0px 0px 5px 0px;
        }

        #mainbody {
            width: 998px;
            height:700px;

            margin: 0px auto;
            padding: 2px;
        }


        
        #footer {
            width: 958px;
            height: 85px;
            font-size: 12px;
            color: #008738;
            padding: 20px 20px;
            margin: 0px auto;
            _height: 105px;
	    
	    background:#CBE967;

        } 
		#slideMain {
            margin: 0 auto;
            padding: 0;
			width:998px;
			height:300px;
			overflow:hidden;
			position:relative;
        }

        .slides {
            margin: 0;
            padding: 0;
			position:absolute;
			animation-name:animation_test;
			animation-duration:10s;
			animation-timing-function:linear;
			animation-iteration-count:infinite;
			animation-direction:alternate;
			left:-2994px;
        }

        .slide {
		width:998px;
		position:absolute;
		left:0em;
        }
		.slide2 {
		width:998px;
		position:absolute;
		left:998px;;
        }
		.slide3 {
		width:998px;
		position:absolute;
		left:1996px;
        }
		.slide4 {
		width:998px;
		position:absolute;
		left:2994px;
        }
		@keyframes animation_test { 
		0%{left:0;}
		10%{left:0;}
		20%{left:-998px;}
		30%{left:-998px;}
		40%{left:-998px;}
		50%{left:-1996px;}
		60%{left:-1996px;}
		70%{left:-1996px;}
		80%{left:-2994px;}
		100%{left:-2994px;}
		}
        /* frame end */
    </style>
</head>
<body>
      <div id="header">
         <div id="logo">
            <img src="images/title.png" alt="众里寻他">
        </div>
		<div id="header_inner">
            <div class="nav">
			<a href="<%=load_jsp%>" id="load"><%=load_exit%></a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp 
			<%System.out.print(load_jsp); %>
			<a href="<%=register_jsp%>" id="resign"><%=register%></a>
			<img src="<%=path %>" style="width:20px;">
			<span><%=welcome%></span>
			<a href="image.jsp?name=<%=name %>" id="image"><%=image%></a>
			
			</div>
        </div>
        <form name="searchingForm" action="http://zhannei.baidu.com/cse/search" target="_blank">
            <div id="searchbox">
                <input name="q" type="text" id="search" value="好友搜索">
                <input type="button" id="cnsearchbotton" name="sbtn" onclick="submit()">
            </div>
        </form>
     </div>
    <!--header end-->

   <div id="nav">
        <a href="introduction.jsp?name=<%=name%>"><span class="sp" id="tag2" onmouseover="switchTag('tag2','subnav2');this.blur();">主页介绍</span></a>
        <a href="showOppositeSex.jsp?name=<%=name%>"><span class="sp" id="tag3" onmouseover="switchTag('tag3','subnav3');this.blur();">查看用户</span></a>
        <a href="matching.jsp?name=<%=name%>"><span class="sp" id="tag4" onmouseover="switchTag('tag4','subnav4');this.blur();">缘分配对</span></a>
    </div>

    <div id="main">
               <div id="mainbody">
             <div id="indexline">
                 <div id="content_main">
					<div id="slideMain" width="228" height="300">
						<div class="slides">
							<a href="zdgk/zdgk08/tuzwq/tuzwq2015/tu201503/index.htm" target="_blank" title="活动1">
							<img class="slide" src="images/image4.jpg">
							</a>
							<a href="zdgk/zdgk08/tuzwq/tuzwq2015/tu201503/index.htm" target="_blank" title="活动2">
							<img class="slide2" src="images/image2.jpg">
							</a>
							<a href="zdgk/zdgk08/tuzwq/tuzwq2015/tu201503/index.htm" target="_blank" title="活动3">
							<img class="slide3" src="images/image3.jpg">
							</a>
							<a href="zdgk/zdgk08/tuzwq/tuzwq2015/tu201503/index.htm" target="_blank" title="活动4">
							<img class="slide4" src="images/image1.jpg">
							</a>
						</div>
					</div>
                </div>
            </div>
            <!-- indexline end -->

            <div class="cols">
     <div class="colsleft">
                    <div class="cols01">
                        <div class="channel_shadow">
                            <div class="channel">
                                <h3><span class="newsmore"><a href="http://news2.sysu.edu.cn">进入&gt;&gt;</a></span><span id="sysunews01" class="" onmouseover="switchNews('sysunews01','newslist01');this.blur();">留言版</span> <span id="sysunews02" class="newsdown" onmouseover="switchNews('sysunews02','newslist02');this.blur();" onclick="location.href='../en/news/index.htm';">NEWS &amp; EVENTS</span></h3>
                                <div id="newslist03">
                                    <ul id="xsyg01">
                                        <%=table %>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                   
				<!-- colsleft end -->
                    
              
            </div>
            <!-- cols end -->
			<div class="cols02">
                    <div class="channel">
                        <h4>我的留言</h4>
                        <form action="Message.jsp?name=<%=name %>" method="post">
							<fieldset>
								<legend>留言</legend>
							<table>
								<tr>
									<td valign="top"> 内容：</td>
										<td><textarea name="content" id="content"></textarea></td>
							</table>
							</br>
							<br>
								<input  name="save" type="submit" value="提交">&nbsp
							</br>
							</fieldset>
						</form>

                    </div>
                </div>  
				<!-- cols2 end -->
        </div>
        <!--mainbody end-->

        </div>
        <!--quicklinks end-->
    </div>
    <!--main end-->

	
       <div id="footer">
        <div class="bottomlogo">
            <img src="images/foot.png"></div>
        <div class="bottomcontact_cn">刘万里&nbsp&nbsp钟海鹏<br>
            罗鎏月&nbsp&nbsp尹晓琳</div>
        <div class="bottomcontact_en">
            14353205 &nbsp&nbsp 14353432<br>
			14353225&nbsp&nbsp14353370
        </div>
        <div class="clear"></div>
        <div class="copyright">联系我们：13226318353</div>
    </div>
    <!--footer end-->

</body>
</html>
