<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>业务需求管理</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/BusinessCode.js"></script>
	<script language="javascript" type="text/javascript" src="http://bossres.yunpal.cn:9002/static/DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div id="content_2" class="content_wrapper">
		<div class="content_main">
			<div class="panel panel-default">
				<div class="panel-heading">内容筛选</div>
				<div class="panel-body">
			   <form class="cmxform form-horizontal"
			   action="${pageContext.request.contextPath}/bussDemand/bussDemandIndex"
						method="get" id="godownForma" name="godownForma"
			   >
              <div class="form-group">
                <label class="col-xs-2 control-label">发送日期</label>
                <div class="col-xs-3 during">
                  <input id="datePickerE" name="timeFrom" type="text" class="form-control input_left" placeholder="" aria-describedby="basic-addon2" onclick="WdatePicker()">-
                  <input id="datePicker" name="timeTo" type="text" class="form-control input_right" placeholder="" aria-describedby="basic-addon2" onclick="WdatePicker(WdatePicker({minDate:'#F{$dp.$D(\'datePickerE\')}'}))">
                </div>
                <label class="col-xs-offset-1 col-xs-2 control-label">需求类型</label>
                 <div class="col-xs-3">
      				<select class="form-control" id="type"
									name="type">
									<script type="text/javascript">
										BusinessCode.getSysConfigCode(
												"BUSS_DEMAND_TYPE",
												"type",
												"$!{query.type}");
									</script>
								</select>
              </div>
              </div>
              <div class="form-group selectDepart">
                <label class="col-xs-2 control-label">申请人姓名</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="" name="name"/>
                </div>
                <div class="col-xs-1 tip"></div>
                <label class="col-xs-2 control-label">联系电话</label>
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder="" value="" name="phone"/>
                </div>
                <div class="col-xs-1 tip"></div>
              </div>
              <div class="col-xs-12 align_center">
              <a onclick="BusinessCode.clearAllInput('godownForma');">
								<button class="btn btn-default button" type="button">清 除</button>
							</a>
                <button class="btn btn-primary submit">查   询</button>
              </div></form>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">查询结果</div>
				<div class="panel-body">
					<div class="form-group">
						<div class="col-lg-4"></div>
					</div>
					<!-- 结果列表 -->
					<div class="col-lg-12">
						<q:table queryService="queryService" queryKey="queryBussDemand"
							formId="godownForma" class="table table-striped table-bordered"
							pageSize="10" 
							>
							<q:column title="编号" value="${id}" hidden="hidden" dataIndex="id" />
							<q:nodata>无符合条件的记录</q:nodata>
							<q:column title="上送时间" escapeHtml="false"  dataIndex="createTime" >
							${fn:substring(create_time, 0, 19)}
							</q:column>
							<q:column title="申请人姓名" value="${name}" dataIndex="name" />
							<q:column title="联系电话" value="${phone}" dataIndex="phone" />
							<q:column title="需求类型" escapeHtml="false"   dataIndex="type"  id="${id}type">
							<script type="text/javascript">
									BusinessCode.transGirdData("BUSS_DEMAND_TYPE",
											"${type}", "${id}type");
								</script>
							</q:column>
							<q:column title="关联微信号" value="${wechat}" dataIndex="wechat" />
							<q:column title="金额（万元）" value="${amount}" dataIndex="amount" />
							<q:column title="操作" escapeHtml="false">
									<a class="in_table" data-href="" data-toggle="modal" data-target=".bs-example-modal-lg" onclick="getBuss(${id});">详情</a>
								<span>&nbsp;&nbsp;</span>
							</q:column>
						</q:table>

					</div>
				</div>
			</div>
		</div>
	</div>
 <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            <h4 class="modal-title" id="myLargeModalLabel">业务需求详情</h4>
          </div>
          <div class="modal-body clearfix">
            <div class="form-group clearfix">
              <label class="col-xs-4 control-label align_right">编号</label>
              <label class="col-xs-2 control-label" id="bianNo"></label>
              <label class="col-xs-2 control-label align_right">上送时间</label>
              <label class="col-xs-4 control-label" id="shangTime"></label>
            </div>
            <div class="form-group clearfix">
              <label class="col-xs-4 control-label align_right" >申请人姓名</label>
              <label class="col-xs-2 control-label" id="shenName"></label>
              <label class="col-xs-2 control-label align_right">申请人手机</label>
              <label class="col-xs-4 control-label"  id="shenPhone"></label>
            </div>
            <div class="form-group clearfix">
              <label class="col-xs-4 control-label align_right" >需求类型</label>
              <label class="col-xs-2 control-label" id="xuType"></label>
              <label class="col-xs-2 control-label align_right" >金额</label>
              <label class="col-xs-4 control-label" id="xuAmount"></label>
            </div>
            <div class="form-group clearfix">
              <label class="col-xs-4 control-label align_right" >楼盘信息</label>
              <label class="col-xs-2 control-label" id="xuAddress"></label>
              <label class="col-xs-2 control-label align_right" >其他信息</label>
              <label class="col-xs-4 control-label" id="xuNote"></label>
            </div>
            <div class="form-group clearfix">
              <label class="col-xs-4 control-label align_right" >关联微信号</label>
              <label class="col-xs-2 control-label" id="xuWechat"></label>
            </div>
          </div>
        </div>
      </div>
    </div>
    
        <script type="text/javascript">
        function getBuss(id){
        			$.ajax({
				type : 'POST',
				url : '/ransomfloor-boss/bussDemand/getBussDemand',
				dataType : "json",
				"async":false,
				data : {id:id},
				beforeSend : function(data) {
		
				}// 发送请求前
				,
				success : function(data) {
					var demand = data.bussDemand;
					$("label#bianNo").html(demand.id) ;
					$("label#shangTime").html(data.createTime) ;
					$("label#shenName").html(demand.name) ;
					$("label#shenPhone").html(demand.phone) ;
					$("label#xuType").html(data.typeName) ;
					$("label#xuAmount").html(demand.amount.value+"万") ;
					$("label#xuAddress").html(demand.address) ;
					$("label#xuNote").html(demand.note) ;
					$("label#xuWechat").html(demand.wechat) ;
					
				}
				// 请求成功后
				,
				error : function(data) {

				}// 请求错误
				,
				complete : function(data) {
					
				}

			});
        }
        </script>
</body>
</html>