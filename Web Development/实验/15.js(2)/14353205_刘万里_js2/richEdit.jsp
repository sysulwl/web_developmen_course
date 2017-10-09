<%@ page language="java" import="java.util.*,java.io.*"
contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html><head><title>Rich Text Editing</title></head>
<body>
<div id="cs" name="edit" style="height:200px;width:600px;border:solid 1px black" contenteditable="true">
</div><br>
<input type="button" value="斜体" onclick="italic()">
<input type="button" value="颜色" onclick="col()">
<input type="button" value="字号" onclick="big()">
<input type="button" value="图像" onclick="pic()">
<input type="button" value="链接" onclick="htm()">
<input type="button" value="撤销" onclick="cle()">
<input type="button" value="代码" onclick="show()">
<script>
function italic() {
	document.execCommand("italic",false,null);
}
function big() {
	document.execCommand("fontsize",false,7);
}
function col() {
	document.execCommand("forecolor",false,"red");
}
function pic() {
	document.execCommand("insertimage",false,"images/home.gif");
}
function htm() {
	document.execCommand("createlink",false,"http://www.sysu.edu.cn");
}
function cle() {
	var o = document.execCommand('undo');;
}
function show() {
	var cs=document.getElementById("cs");
	var t=document.querySelectorAll("#cs");
	alert(cs.innerHTML);
}
</script>
</body>
</html>