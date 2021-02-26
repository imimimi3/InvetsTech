#!/usr/bin/env python3
import json
import requests
import pprint
tool = json.loads(requests.get("http://127.0.0.1:5000/todo/api/v1.0/tasks/EUR!USD").text)

print("Content-type: text/html")
print()
print("""

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link rel="stylesheet" href="css/stylesheet.css">
		<style>
@charset "UTF-8";

body {
	margin:0px;
	padding:0px;
	background-attachment: scroll;
	background-image: url(../images/background.jpg);
	background-repeat: repeat-x;
	background-position: left top;
}

#content_container {
	margin-left:auto;
	margin-right:auto;
	width:900px;
	height: 750px;
	background-attachment: scroll;
	background-image: url(../images/Untitled-4.png);
	background-repeat: no-repeat;
	background-position: right center;
}

#logo_container {
	height:90px;
	width:900px;
	margin-left:auto;
	margin-right:auto;
}

#main_container {
	height:90px;
	width:900px;
	margin-left:auto;
	margin-right:auto;
}

#logo_image {
	width:255px;
	height:75px;
	margin-left:10px;
	margin-top:15px;
	float:left;
	background-image: url(../images/logo.gif);
}

#top_bar_black {
	width:100%;
	height:90px;
	background-color:#000000;
}

#bottom_bar_black {
	width:100%;
	height:160px;
	background-color:#000000;
}

#nav_block {
	width: 600px;
	height:90px;
}

.nav_button {
	width: 70px; /*This number you can edit when you need to add more with to fit your text inside the button */
	color:#FFFFFF;
	font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size:12px;
	margin-left:5px;
	margin-top:35px;
	text-align:center;
	float:left;
}

.nav_button:link {
	text-decoration:none;
}

.nav_button:hover {
	text-decoration:none;
	background-color:#333333;
}

#header {
	width:500px;
	margin-top:100px;
	margin-bottom:250px;
	float: left;
}

.header_content_mainline {
	font-size:35px;
	color:#000000;
	width:500px;
	font-style: italic;
}

#header_content_boxline {
	font-size:35px;
	color:#000000;
	width:400px;
	font-style: italic;
}

#header_content_lowerline {
	font-size:35px;
	color:#FFFFFF;
	width:400px;
	font-style: italic;
}

#header_content_boxcontent {
	font-size:12px;
	color:#333333;
	width:400px;
	font-style: italic;
}

#header_content_lowerboxcontent {
	font-size:12px;
	color:#CCCCCC;
	width:400px;
}

#header_content_tagline {
	font-size:12px;
	color:#333333;
	width:500px;
}

#header_lower {
	width:400px;
	float:left;
	margin-right:40px;
}
		</style>
		<meta http-equiv="Content-Type" content="text/html; charset=cp1251" />
		<title>Heartlys - Place Your Company Name Here</title>
		<link href="css/stylesheet.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div id="top_bar_black">
			<div id="logo_container">
				<center><div id="nav_block">
					<a href="http://localhost:8000/cgi-bin/ideas.py"><div class="nav_button">Инвест идеи</div></a>
					<a href="http://localhost:8000/cgi-bin/forex.py"><div class="nav_button">Форекс</div></a>
					<div class="nav_button">Товары</div>
					<div class="nav_button">Индексы</div>
					<div class="nav_button">ETF</div>
					<div class="nav_button">Фонды</div>
					<div class="nav_button">Облигации</div>
					<div class="nav_button">Крипта</div>
				</center></div>
			</div>
		</div>
		<div id="content_container">""")


print("<br><br><br>")
print("""<center><img src="C:/Users/DonovDO/PycharmProjects/pythonProject/EURUSD - 2021-02-16.png"></center><br>""")
print("""<div align="right"><img src="C:/Users/DonovDO/PycharmProjects/pythonProject/EURUSD - 2021-02-16tech.png"></div>""")
print("""<div align="left"><img src="C:/Users/DonovDO/PycharmProjects/pythonProject/EURUSD - 2021-02-16ma.png"></div>""")
for key, value in tool[0]["short_anal"].items():
    print("<center>{0} {1}".format(key, value) + "</center><br>")




print("<center><br><br><br>© Invest tech 2021</center>")
print("""
		</div>
	</body>
</html>
""")