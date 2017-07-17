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
	<link href="easyui1.5/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="easyui1.5/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="easyui1.5/jquery.min.js" type="text/javascript"></script>
    <script src="easyui1.5/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="easyui1.5/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
  	<script type="text/javascript">
  		//var ids = [];
  		$(function(){
  			//测试树
  			$("#treeData").tree({    
			    url:"deptTree.do"
			});  

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
                    {field:"manager", title: "部门经理", width:10},
                    {field:"parent", title: "父部门", width:20, formatter: function(value,row,index){
                    	if(value)
                    		return value.deptname;
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
  			
  			//设置表单元素为必填
			$(".check").validatebox({    
			    required: true
			}); 
  			
  			//设置部门下拉树
  			$("#parent").combotree({    
  			    url:"deptTree.do" 
  			});
  			
  			//设置部门级别下拉选
  			$("#deptlevel").combobox({    
  				valueField:"id",    
  			    textField:"text",
  			    url:"js/deptlevel.json"
  			}); 

  			//保存窗口
  			$("#dept-win").window({
  				width:350,    
			    height:248,
			    collapsible:false,
			    minimizable:false,
			    closed:true
  			});
  		});
  		
  		
  		function save(){
  			$("#dept-win").window("open");
  			$("#dept-win").window("setTitle","新增部门");
  			$("#dept-form").form("reset");
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
			$("#dept-form").form("submit",{
				url : url,
				onSubmit: function(){    
			    	return $(this).form("validate");        
			    },    
			    success:function(data){
			        if(data=="success"){
			        	$("#dept-win").window("close");
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
	  			$("#dept-win").window("open");
	  			$("#dept-win").window("setTitle","修改部门");
	  			$("#dept-form").form("reset");
	  			$("#dept-form").form("load","getDept.do?deptid="+ss[0].deptid);
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
  				deptname:$("#qname").val(),
  				"parent.deptid":$("#qparent").val(),
  				deptlevel:$("#qlevel").val()
  			});
  		}
  	</script>
  </head>
  
  <body class="easyui-layout">
	<div data-options="region:'center',border:false">
		<div id="data"></div>
	</div>
	<div data-options="region:'west',split:true,border:false" title="部门" style="width:220px;"">
		<ul id="treeData"></ul>
	</div> 
	<div id="tb" style="padding:5px;height:auto">    
	    <div>
	    	部门名称:<input id="qname" class="easyui-textbox" style="width:100px">    
	                父部门:
	        <input id="qparent" class="easyui-combotree" style="width:150px" data-options="url:'deptTree.do',valueField:'id',textField:'text'">    
	                部门级别:
	        <input id="qlevel" class="easyui-combotree" style="width:150px" data-options="url:'js/deptlevel.json',valueField:'id',textField:'text'">    
	        <a href="javascript:queryData()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">查询</a>    
	    </div>
	    <div style="margin-bottom:5px">    
	        <a href="javascript:save()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
	        <span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>
	        <a href="javascript:edit()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
	        <span class="datagrid-btn-separator" style="vertical-align: middle;display:inline-block;float:none"></span>
	        <a href="javascript:delData()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>    
	    </div>
	</div> 
	<div id="dept-win">
		<div style="padding: 20px 0px 0px 40px">
			<form id="dept-form" method="post">
				<input type="hidden" id="deptid" name="deptid">
	            <table>
	                <tr>
	                    <td>部门代码：</td>
	                    <td><input class="check" name="deptcode" style="width: 150px;"/></td>
	                </tr>
	                <tr>
	                    <td>部门名称：</td>
	                    <td><input class="check" name="deptname" style="width: 150px;"/></td>
	                </tr>
	                <tr>
	                    <td>部门经理：</td>
	                    <td><input class="check1" name="manager" style="width: 150px;"/></td>
	                </tr>
	                <tr>
	                    <td>管理部门：</td>
	                    <td><input class="check" id="parent" name="parent.deptid" style="width: 150px;"/></td>
	                </tr>
	                <tr>
	                    <td>部门级别：</td>
	                    <td><input class="check" id="deptlevel" name="deptlevel" style="width: 150px;"/></td>
	                </tr>
	            </table>
			</form>
		</div>
		<div style="text-align: right; padding: 5px;">
            <a href="javascript:void(0)" onclick="confirm()" class="easyui-linkbutton" data-options="iconCls:'icon-save'">确定</a>
            <a href="javascript:void(0)" onclick="$('#dept-win').window('close')" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>
        </div>
	</div>
  </body>
</html>
