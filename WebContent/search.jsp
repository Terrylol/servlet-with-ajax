<%@ page language="java" import="java.util.*" contentType="text/html "
    pageEncoding="UTF-8"%>

<html>
<head>
<style type="text/css">
	#mydiv{
		position: absolute;
		left:50%;
		top:50%;
		margin-left: -200;
		margin-top: -50;
	}
	.mouseOver{
	background: #708090;
	color:#FFFAFA;
	}
	.mouseOut{
	background: #FFFAFA;
	color: #000000
	}

</style>

<script type="text/javascript">
var xmlHttp;
//huoquxinxi 
function getMoreContents(){
	var content = document.getElementById("keyword");
	if(content.value==""){
		clearContent();
		return;
	}
	
	//	<!--alert(content.value);use XmlHttp-->
	xmlHttp = createXMLHttp();
	//	alert(xmlHttp);
	//  send message
	var url = "search?keyword="+escape(content.value);
	// javascrite will go on after send() ;
	xmlHttp.open("GET",url,true);
	//bind callback function,will open while xmlHttp change;
	//xmlhttp 0-4; care about 4--complete;
	xmlHttp.onreadystatechange=callback;
	xmlHttp.send(null);
	}

function callback(){
	if (xmlHttp.readyState==4){
		if(xmlHttp.status==200){
			//500 fuwuqi cuowu
			var result = xmlHttp.responseText;
			// get json file; eval javascript function 
			var json = eval("("+result+")");
			//show
			setContent(json);
		}
	}	
}

function clearContent(){
	var contentTableBody = document.getElementById("content_table_body");
	var size = contentTableBody.childNodes.length;
	for(var i = size-1;i>=0;i--){
		contentTableBody.removeChild(contentTableBody.childNodes[i]);
	}
	document.getElementById("popDiv").style.border="none";
}

function setContent(contents){
	clearContent();
	//setLocation();
	var size = contents.length;
	for(var i=0;i<size;i++){
		var nextNode=contents[i];
		var tr=document.createElement("tr");
		var td=document.createElement("td");
		td.setAttribute("border","0");
		td.setAttribute("bgcolor", "#FFFAFA");
		td.onmouseover = function(){
			this.className = 'mouseOver';
		};
		td.onmouseout = function(){
			this.className = 'mouseOut';
		};
		td.onclick=function(){
			//mouse click message ,message will go to input;
		};
		var text = document.createTextNode(nextNode);
		td.appendChild(text);
		tr.appendChild(td);
		document.getElementById("content_table_body").appendChild(tr);
	}
}

function createXMLHttp(){
	//most browser
	var xmlHttp;
	if(window.XMLHttpRequest){
		xmlHttp=new XMLHttpRequest();		
	}
	if(window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		if(!xmlHttp){
			xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
		}
	}
	return xmlHttp;
}

function keywordblur(){
	clearContent();
}
function setLocation(){
	//guanlianxinxixianshi 
	var content = document.getElementById("keyword");
	var width = content.offsetWidth;
	var left = content["offsetLeft"];
	var top = content["offsetTop"]+content.offsetHeight;
	//get div
	var popDiv = document.getElementById("popDiv");
	popDiv.style.border="black 1px solid";
	popDiv.style.left = left+"px";
	popDiv.style.top = top+"px";
	popDiv.stytle.width = width +"px";
	document.getElementById("content_table").style.width = width+"px";
}
</script>

</head>
<body>
	<div id="mydiv">
		<input type="text" size="50" id="keyword" onkeyup="getMoreContents()" onfocus="getMoreContents()" onblur="clearContent"/>
		<input type="button" value="baidu" width="50px"/>
		<div id="popDiv">
			<table id="content_table" bgcolor="#FFFAFA" border ="0" cellspacing="0" cellpadding="0">
			<tbody id="content_table_body">
			</tbody>

			</table>
		</div>
	</div>
</body>
</html>