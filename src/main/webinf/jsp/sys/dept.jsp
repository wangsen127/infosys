<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>部门信息</title>
    
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
  		//var ids = [];
  		$(function(){
  			//表格
  			$("#data").datagrid({
  				//title: "部门管理",
        		//iconCls: "icon-save",
        		url: "queryDept.do",
        		//queryParams:{
        			//deptno : 1
        		//},
        		fitColumns:true, //自动展开/收缩列的大小
        		striped:true,//斑马线效果
        		method:"post",
        		idField:"deptid", //指明哪一个字段是标识字段
		        rownumbers: true, //显示一个行号列
		        singleSelect: false,//只允许选择一行
                pagination: true,//显示分页 
		        pageSize:10,//分页大小  
		        pageList:[10,20,30,40,50],//每页的个数  
		        sortOrder:"asc",//排序顺序
		        fit:true,
		        columns: [[
		        	//title标题文本
		        	//field字段名称
		        	//width宽度。如果没有定义，宽度将自动扩充以适应其内容
		        	//align对齐列数据。可以使用的值有：'left','right','center'。
		        	//halign对齐列标题
		        	//hidden隐藏列
		        	//sortable允许列使用排序
		        	//checkbox显示复选框
                    {field:"cb", checkbox:true},
                    {field:"deptid", hidden:true},
                    {field:"deptcode", title: "部门代码", width:15},
                    {field:"deptname", title: "部门名称", width:20},
                    {field:"manager", title: "部门经理", width:10, formatter: function(value,row,index){
                    	if(row.manager)
                    		return row.manager.username;
                    	return "";
                    }},
                    {field:"parent", title: "父部门", width:20, formatter: function(value,row,index){
                    	if(row.parent)
                    		return row.parent.deptname;
                    	return "";
                    }},
                    {field:"deptlevel", title: "部门级别", width:10, formatter: function(value){
                    	if(value == 1) return "总部";
                    	else if(value == 2) return "地区";
                    	else if(value == 3) return "部门";
                    	else return "";
                    }}
                ]],
                toolbar: "#tb"
  			});
  			
  			//窗口
  			$("#div-win").dialog({
  				width:470,    
			    height:310,
			    //resizable:true,
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
  			
  			//部门经理下拉表格
  			$("#manager").combogrid({
  				url: "queryUser.do",
        		fitColumns:true, //自动展开/收缩列的大小
        		striped:true,//斑马线效果
        		method:"post",
        		idField:"userid", //指明哪一个字段是标识字段
		        rownumbers: true, //显示一个行号列
		        singleSelect: true,//只允许选择一行
                pagination: true,//显示分页 
		        pageSize:10,//分页大小  
		        pageList:[10,20,30,40,50],//每页的个数  
  			    textField:"username",
  			  	panelWidth:450,
  			  	//required:true,
  			    columns:[[    
  			    	{field:"username", title: "真实姓名", width:10},
  			        {field:"dept", title: "部门名称", width:10, formatter: function(value,row,index){
                    	if(value)
                    		return value.deptname;
                    	return "";
                    }},
                    {field:"postid", title: "岗位", width:10},
                    {field:"plevelid", title: "职务级别", width:10},
                    {field:"cellphone", title: "手机", width:15},
                    {field:"sex", title: "性别", width:5, formatter: function(value){
                    	if(value == 1) return "男";
                    	else if(value == 2) return "女";
                    	else return "";
                    }}
  			    ]],
  			  	toolbar:[{
  			  		text:"用户姓名:<input id='qusername' class='easyui-textbox' style='width:100px'>"
  			  	},{
  			  		text:"查询",
  			  		iconCls:"icon-search",
  			  		handler:function(){
	  			  		$("#manager").combogrid("grid").datagrid("load",{
	  			  			username:$("#qusername").val()
	  		  			});
  			  		}
  			  	}]
  			});
  			
  			//验证部门代码是否重复
  			$("#deptcode").textbox("textbox").blur(function(){
  				var deptcode = $("#deptcode").val();
  				alert(deptcode);
  				if(deptcode){
	  				$.post("existsDept.do",{deptcode:deptcode},function(data){
	  					if(data=="success"){
						}else{
				        	$.messager.alert("提示","部门代码已存在！"); 
				        }
	  				});
  				}
  			});
  		});
  		
  		
  		function save(){
  			$("#deptcode").textbox("readonly",false);
			$("#deptcode").textbox("enableValidation");
  			$("#div-win").dialog("open");
  			$("#div-win").dialog("setTitle","新增部门");
  		}
		function confirm(){
			var url = "";
			var str = "";
			if($("#deptid").val()){
				url = "editDept.do";
				str = "修改";
			}else{
				url = "saveDept.do";
				str = "新增";
			}
			$("#div-form").form("submit",{
				url : url,
				onSubmit: function(){    
			    	return $(this).form("validate");        
			    },    
			    success:function(data){
			        if(data=="success"){
			        	$("#div-win").dialog("close");
			        	$("#data").datagrid("reload");
			        	$("#data").datagrid("clearSelections");
			        	$.messager.alert("提示","数据"+str+"成功"); 
			        }else{
			        	$.messager.alert("提示","数据"+str+"失败"); 
			        }
			        $("#deptid").val("");
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
  				$("#deptcode").textbox("readonly",true);
  				$("#deptcode").textbox("disableValidation");
	  			$("#div-win").dialog("open");
	  			$("#div-win").dialog("setTitle","修改部门");
	  			//$("#div-form").form("load","getDept.do?deptid="+ss[0].deptid);
	  			$("#div-form").form("load",{
	  				deptid:ss[0].deptid,
	  				deptcode:ss[0].deptcode,
	  				deptname:ss[0].deptname,
	  				deptlevel:ss[0].deptlevel,
	  				"manager.userid":ss[0].manager==null?"":ss[0].manager.userid,
	  				"parent.deptid":ss[0].parent==null?"":ss[0].parent.deptid
	  			});
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
						ids.push(ss[i].deptid);
					}
					$.post("delDept.do",{
						ids : ids
					},function(data){
						if(data=="success"){
		        			$("#data").datagrid("reload");
		        			$("#data").datagrid("clearSelections");
							$.messager.alert("提示","数据删除成功");
						}else{
				        	$.messager.alert("提示","<p>数据删除失败</p><p>原因：数据中可能存在有子部门的父部门，情先删除子部门后才能进行删除操作</p>"); 
				        }
					});
				});  
  			}
  		}
  		function queryData(){
  			$("#data").datagrid("load",{
  				deptname:$("#qdeptname").val(),
  				"parent.deptid":$("#qparent").val(),
  				deptlevel:$("#qdeptlevel").val()
  			});
  		}
  	</script>
  </head>
  
  <body class="easyui-layout">
	<div data-options="region:'center',border:false">
		<div id="data"></div>
	</div>
	<div id="tb" style="padding:5px;height:auto">    
	    <div>
	    <form id="queryForm">
	    	部门名称:<input id="qdeptname" class="easyui-textbox" style="width:100px">    
	                父部门:
	        <input id="qparent" class="easyui-combotree" style="width:150px" data-options="url:'deptTree.do',valueField:'id',textField:'text'">    
	                部门级别:
	        <input id="qdeptlevel" class="easyui-combotree" style="width:150px" data-options="url:'js/deptlevel.json',valueField:'id',textField:'text'">    
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
			<input type="hidden" id="deptid" name="deptid">
            <table>
                <tr>
                    <th>部门代码：</th>
                    <td><input id="deptcode" class="easyui-textbox" data-options="required:true" name="deptcode"/></td>
                </tr>
                <tr>
                    <th>部门名称：</th>
                    <td><input class="easyui-textbox" data-options="required:true" name="deptname"/></td>
                </tr>
                <tr>
                    <th>部门经理：</th>
                    <td><input id="manager" class="easyui-textbox" name="manager.userid"/></td>
                </tr>
                <tr>
                    <th>管理部门：</th>
                    <td><input class="easyui-combotree" data-options="url:'deptTree.do',required:true" name="parent.deptid"/></td>
                </tr>
                <tr>
                    <th>部门级别：</th>
                    <td><input class="easyui-combobox" data-options="valueField:'id',textField:'text',url:'js/deptlevel.json',required:true" name="deptlevel"/></td>
                </tr>
            </table>
		</form>
	</div>
  </body>
</html>
