<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>信息系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style type="text/css">
		#logodiv{
			float: left;
			margin-left: 47px;
			display: inline;
		}
		#logoutdiv{
			float: right;
			margin-right: 47px;
			margin-top: 10px;
			display: inline;
			text-align:right;
		}
	</style>
	<link href="easyui1.5/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="easyui1.5/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="easyui1.5/jquery.min.js" type="text/javascript"></script>
    <script src="easyui1.5/jquery.easyui.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			$(".easyui-accordion li a").bind("click",function(){
				//alert($(this).attr("href") + "---" + $(this).text());
				addTab($(this).text(),$(this).attr("name"));
			});
		});
		function addTab(title,url){
			var tabs = $("#tabs");
			if(!tabs.tabs("exists",title)){
				tabs.tabs("add",{    
				    title : title,    
				    content : "<iframe scrolling='no' frameborder='0'  src='" + url + "' style='width:100%;height:100%;'></iframe>",    
				    closable : true,
				    tools : [ {
						handler : function() {
							var tab = tabs.tabs('getTab', title);
							tabs.tabs('update', {
								tab : tab,
								options : tab.panel('options')
							});
						}
					} ]
				});
			}else{
				tabs.tabs("select",title);
			}
		}
	</script>
  </head>
  
  <body class="easyui-layout">
    <noscript>
        <div style="position: absolute; z-index: 100000; height: 2046px; top: 0px; left: 0px;
            width: 100%; background: white; text-align: center;">
            <img src="images/noscript.gif" alt='抱歉，请开启脚本支持！' />
        </div>
    </noscript>
    <div id="topdiv" data-options="region:'north',split:true" style="height:100px" >
    	<div id="logodiv"><img alt="信息系统" src="images/logo.png"></div>
    	<div id="logoutdiv">
    		当前登录用户：${loginUser.username }
    		<p><a href="user/logout.do">退出系统</a></p>
    	</div>
    </div>
	<div data-options="region:'south'" style="height:50px;"></div>
	<div data-options="region:'west',split:true,iconCls:'icon-redo'" title="导航菜单" style="width:180px;">
		<div class="easyui-accordion" data-options="fit:true,border:false">
			<div title="学生信息" data-options="iconCls:'icon-edit'" style="padding:10px">
				<ul class="easyui-tree">
                    <li>
                        <a title="班级管理" name="stu/stuclass.jsp">班级管理</a>
                    </li>
                    <li>
                        <a title="学生管理" name="stu/student.jsp">学生管理</a>
                    </li>
                </ul>
			</div>
			<div title="学习进度" data-options="iconCls:'icon-edit'" style="padding:10px;">
				<ul class="easyui-tree">
                    <li>
                        <a title="调查管理" name="inq/inq.jsp">调查管理</a>
                    </li>
                    <li>
                        <a title="反馈管理" name="inq/feedback.jsp">反馈管理</a>
                    </li>
                </ul>
			</div>
			<div title="系统设置" style="padding:10px;" data-options="selected:true,iconCls:'icon-edit'">
                <ul class="easyui-tree">
                    <li>
                        <a title="用户管理" name="user/user.jsp">用户管理</a>
                    </li>
                    <li>
                        <a title="部门管理" name="dept.html">部门管理</a>
                    </li>
                </ul>
			</div>
		</div>
	</div>
	<div data-options="region:'center'" id="mainPanle">
		<div id="tabs" class="easyui-tabs" data-options="fit:true,border:false">
			<div title="主页" id="home" style="padding:10px">
				<h1>Welcome...</h1>
			</div>
		</div>
	</div>
  </body>
</html>
