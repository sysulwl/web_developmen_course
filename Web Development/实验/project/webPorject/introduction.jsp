<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"
%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String content=request.getParameter("content");
		if(content==null) content="";
		else content=content;
	String success=request.getParameter("success");	
	String load_exit="";
	String register="";
	String load_jsp="load.jsp";
	String register_jsp="";
	String name="";
	String returnToMain=new String("返回主界面");
	if(returnToMain.equals(success)||success==null) 
	{
		load_exit="登录";
		register="注册";
		register_jsp="register_form.jsp";
		load_jsp="load.jsp";
		name="";
	}
	else 
	{
		load_exit="退出";
		register="";
		register_jsp="exit.jsp";
		load_jsp="exit.jsp";
		name=request.getParameter("name")+" 欢迎您！";	
	}
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>众里寻他 </title>
    <script src="js/menu.js"></script>
    <link rel="stylesheet" href="css/header.css"></link>
    <link rel="stylesheet" href="css/nav.css"></link>
    <link rel="stylesheet" href="css/subnav.css"></link>
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
 article {max-width:800px;text-align:center;font-size:20px;margin:20px auto;}

p {
text-indent: 2em;
text-align: left;
}
p:hover{color:green;}
p:first-letter {font-size:1.5em;}
p:first-line {font-style: italic;}
p:nth-child(odd) 
	{
	font-weight: bold;
	}
span{vertical-align:super;font-size:10px}   
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
			<a href="<%=load_jsp%>" id="load"><%=load_exit%><a/>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp 
			<a href="<%=register_jsp%>" id="resign"><%=register%><a />
			&nbsp&nbsp&nbsp
			<span><%=name%></span>
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
        <a href="zdgk/index.htm"><span class="sp" id="tag2" onmouseover="switchTag('tag2','subnav2');this.blur();">主页介绍</span></a>
        <a href="yx/index.htm"><span class="sp" id="tag3" onmouseover="switchTag('tag3','subnav3');this.blur();">查看用户</span></a>
        <a href="xksz/index.htm"><span class="sp" id="tag4" onmouseover="switchTag('tag4','subnav4');this.blur();">缘分配对</span></a>
    </div>
    <!--nav end-->

    <div id="main">
             <article>
<h1>项目简单介绍</h1>
<p>交友网站是基于网络平台的广泛性、互通性、娱乐性、经济性、安全性等优点，于本世纪初出现在网络交流方式中的互动型服务网站。</p>
<p>按照类型，可以简单的将它们分为婚恋交友类网站和社交交友类网站两种。婚恋交友类网站代表：世纪佳缘、珍爱网、百合网、一线姻缘。</p>
<p>“众里寻他网”的主要功能是，用户在我们的注册页面，通过填写姓名、性别、爱好等个人信息，选择是否允许他人查看自己的信息，注册成为会员后，可以查看到其他同样允许他人访问个人信息的其他用户，对感兴趣的用户设为特别关注，或者到留言区留言，以达到交友目的。同时可以随时修改自己的个人信息或者注销账户。另外我们的网站利用独特的系统配对以及测试方法，为每个用户筛选出配对率高的对象，为用户提供更多更好的交友选择。不仅如此，我们还会在平台定期发布同城联谊活动信息，有兴趣参加的用户可提交报名申请。</p>
<p>本项应用到本课程大部分知识，其中最核心是用户的数据库管理，包括表的曾删改查，包括数据库的浏览。同时还要编写一套用户配对的程序。</p>
</article>
    </div>
	<a href = "index.jsp">返回首页</a>
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
