<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="js/custom.css"  rel="stylesheet" type="text/css" />
	<link href="easyui1.5/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="easyui1.5/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="easyui1.5/jquery.min.js" type="text/javascript"></script>
    <script src="easyui1.5/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="easyui1.5/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
  	<script type="text/javascript">
  		var deptid;
  		$(function(){
  			//左侧组织机构树
  			$("#treeData").tree({    
  			    url:"deptTree.do",
  				onClick:function(node){
  					$("#queryForm").form("reset");
  					deptid = node.id;
  					$("#data").datagrid("load",{"dept.deptid":node.id});
  				}
  			}); 
  			//表格
  			$("#data").datagrid({ 
        		url: "queryUser.do",
        		fitColumns:true, //自动展开/收缩列的大小
        		striped:true,//斑马线效果
        		method:"post",
        		idField:"userid", //指明哪一个字段是标识字段
		        rownumbers: true, //显示一个行号列
		        singleSelect: false,//只允许选择一行
                pagination: true,//显示分页 
		        pageSize:10,//分页大小  
		        pageList:[10,20,30,40,50],//每页的个数  
		        sortOrder:"asc",//排序顺序
		        fit:true,
		        columns: [[
                    {field:"cb", checkbox:true},
                    {field:"userid", hidden:true},
                    {field:"usercode", title: "用户名", width:10},
                    {field:"username", title: "真实姓名", width:10},
                    {field:"dept", title: "部门名称", width:10, formatter: function(value,row,index){
                    	if(value)
                    		return value.deptname;
                    	return "";
                    }},
                    //{field:"password", title: "密码", width:10},
                    {field:"email", title: "邮箱", width:15},
                    {field:"postid", title: "岗位", width:10},
                    {field:"plevelid", title: "职务级别", width:10},
                    {field:"sex", title: "性别", width:5, formatter: function(value){
                    	if(value == 1) return "男";
                    	else if(value == 2) return "女";
                    	else return "";
                    }},
                    {field:"birthday", title: "出生日期", width:10},
                    {field:"cellphone", title: "手机", width:15},
                    {field:"home_phone", title: "家庭电话", width:15},
                    {field:"office_phone", title: "办公电话", width:15},
                    {field:"address", title: "家庭地址", width:10},
                    {field:"remark", title: "备注", width:10},
                    //{field:"pic", title: "照片", width:10},
                    {field:"loginIP", title: "最后登录IP", width:10},
                    {field:"loginDate", title: "最后登录时间", width:10}
                ]],
                 toolbar: "#tb"
  			});
  			
  			//保存窗口
  			$("#div-win").dialog({
  				width:840,    
			    height:470,
			    resizable:true,
			    closed:true,
			    modal:true,
			    buttons:[{
			    	text:"确定",
			    	iconCls:"icon-save",
			    	handler:confirm
			    },{
			    	text:"取消",
			    	iconCls:"icon-cancel",
			    	handler:function(){
			    		$("#div-win").dialog("close");
			    	}	
			    }],
			    onClose:function(){
			    	$("#div-form").form("reset");
			    }
  			});
  		});
  		function save(){
  			$("#div-win").window("open");
  			$("#div-win").window("setTitle","新增用户");
  			$("#div-form").form("reset");
  		}
		function confirm(){
			var url = "";
			var str = "";
			if($("#userid").val()){
				url = "editUser.do";
				str = "修改";
			}else{
				url = "saveUser.do";
				str = "新增";
			}
			$("#div-form").form("submit",{
				url : url,
				onSubmit: function(){    
			    	return $(this).form("validate");        
			    },    
			    success:function(data){
			        if(data=="success"){
			        	$("#div-win").window("close");
			        	$("#data").datagrid("reload");
			        	$("#data").datagrid("clearSelections");
			        	$.messager.alert("提示","数据"+str+"成功"); 
			        }else{
			        	$.messager.alert("提示","数据"+str+"失败"); 
			        }
			        $("#userid").val("");
			    }
			});
  		}
  		function edit(){
  			var ss = $("#data").datagrid("getSelections");
  			if(ss.length == 0){
  				$.messager.alert("提示","请选择一条要修改的数据");
  			}else if(ss.length > 1){
  				$.messager.alert("提示","只能选择一条数据");
  			}else{
	  			$("#div-win").window("open");
	  			$("#div-win").window("setTitle","修改用户");
	  			$("#div-form").form("reset");
	  			$("#div-form").form("load","getUser.do?userid="+ss[0].userid);
  			}
  		}
  		function delData(){
  			var ss = $("#data").datagrid("getSelections");
  			if(ss.length == 0){
  				$.messager.alert("提示","请选择一条要删除的数据");
  			}else{
  				$.messager.confirm("确认","您确认想要删除记录吗？",function(r){    
					if(r == false) return;
					var ids = [];
					for(var i=0;i<ss.length;i++){
						ids.push(ss[i].userid);
					}
					$.post("delUser.do",{
						ids : ids
					},function(data){
						if(data=="success"){
		        			$("#data").datagrid("reload");
		        			$("#data").datagrid("clearSelections");
							$.messager.alert("提示","数据删除成功");
						}else{
				        	$.messager.alert("提示","数据删除失败"); 
				        }
					});
				});  
  			}
  		}
  		function queryData(){
  			$("#data").datagrid("load",{
  				"dept.deptid":deptid,
  				username:$("#qname").val(),
  				postid:$("#qpost").val(),
  				plevelid:$("#qplevel").val()
  			});
  		}
  	</script>
  </head>
  
  <body class="easyui-layout">
	<div data-options="region:'center',border:false">
		<div id="data"></div>
	</div>
	<div data-options="region:'west',split:true,border:false" title="组织机构" style="width:220px;"">
		<ul id="treeData"></ul>
	</div>
	<div id="tb" style="padding:5px;height:auto">    
	    <div>
	    <form id="queryForm">
	    	用户姓名:<input id="qname" class="easyui-textbox" style="width:100px">    
	                岗位:
	        <input id="qpost" class="easyui-combotree" style="width:150px" data-options="url:'',valueField:'id',textField:'text'">    
	                职务级别:
	        <input id="qplevel" class="easyui-combotree" style="width:150px" data-options="url:'',valueField:'id',textField:'text'">    
	        <a href="javascript:void(0)" onclick="queryData()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>
	        <a href="javascript:void(0)" onclick="$('#queryForm').form('reset');" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true">清空条件</a>    
	    </form>
	    </div>
	    <div style="margin-bottom:5px">    
	        <a href="javascript:void(0)" onclick="save()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
	        <span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>
	        <a href="javascript:void(0)" onclick="edit()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
	        <span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>
	        <a href="javascript:void(0)" onclick="delData()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>    
	    </div>
	</div> 
	<div id="div-win">
		<form id="div-form" method="post">
			<input type="hidden" id="userid" name="userid">
            <table id="div-table">
                <tr>
                    <th>用户名：</th>
                    <td><input id="usercode" class="easyui-textbox" data-options="required:true" name="usercode"/></td>
                    <th>真实姓名：</th>
                    <td><input class="easyui-textbox" data-options="required:true" name="username"/></td>
                </tr>
                <tr>
                    <th>手机：</th>
                    <td><input class="easyui-textbox" data-options="required:true" name="cellphone"/></td>
                    <th>所在部门：</th>
                    <td><input class="easyui-combotree" data-options="url:'deptTree.do',required:true" name="dept.deptid"/></td>
                </tr>
                <tr>
                    <th>岗位：</th>
                    <td><input class="easyui-textbox" name="postid"/></td>
                    <th>职务级别：</th>
                    <td><input class="easyui-textbox" name="plevelid"/></td>
                </tr>
                <tr>
                	<th>出生日期：</th>
                    <td><input class="easyui-datebox" data-options="required:true" name="birthday"/></td>
                    <th>性别：</th>
                    <td><input class="easyui-combobox" data-options="valueField:'id',textField:'text',url:'js/sex.json',required:true" name="sex"/></td>
                </tr>
                <tr>
                    <th>家庭电话：</th>
                    <td><input class="easyui-textbox" name="home_phone"/></td>
                    <th>办公电话：</th>
                    <td><input class="easyui-textbox" name="office_phone"/></td>
                </tr>
                <tr>
                    <th>邮箱：</th>
                    <td><input class="easyui-textbox" name="email"/></td>
                    <th>家庭地址：</th>
                    <td><input class="easyui-textbox" name="address"/></td>
                </tr>
                <tr>
                    <th>备注：</th>
                    <td colspan="3"><textarea style="width: 540px;height: 110px;" name="remark"></textarea></td>
                </tr>
            </table>
		</form>
	</div>
  </body>
</html>
