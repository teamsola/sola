<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<!-- ============================ DatePicker용 ============================================== -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 제이쿼리 코드 (순서상 DatePicker 안에 넣어놓음) -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">

<!-- ======================================== CSS작업 ========================================= -->

<link rel="stylesheet" type="text/css" href="ledgercss/ledgerViewTitle3.css?ver=1" />
<link rel="stylesheet" type="text/css" href="ledgercss/ledgerViewStats.css?ver=3" />

<!-- ==================================== 그래프(Pie-Div)용 ==================================== -->
<!-- JQ-PLOT의 CSS를 설정 -->
<link class="include" rel="stylesheet" type="text/css"
	href="chart/jquery.jqplot.css" />
<!-- JQ-PLOT의 기본 설정 -->
<script type="text/javascript" src="chart/jquery.jqplot.js" /></script>
<!-- Highlighter(마우스 접근시 데이터정보 표시) 설정 -->
<script type="text/javascript" src="plugins/jqplot.highlighter.js" /></script>
<!-- 좌표에 관한 정보나 Zoom 기능 사용시 설정 -->
<script type="text/javascript" src="plugins/jqplot.cursor.js" /></script>
<!-- 축의 데이터를 날짜형태로 입력하기 위해서 설정 -->
<script type="text/javascript" src="plugins/jqplot.dateAxisRenderer.js" /></script>
<!-- 축의 데이터의 Label Option을 설정 -->
<script type="text/javascript"
	src="plugins/jqplot.canvasAxisLabelRenderer.js" /></script>
<!-- Legend(Line에대한 간단한 범례)의 Option을 설정 -->
<script type="text/javascript"
	src="plugins/jqplot.enhancedLegendRenderer.js" /></script>
<!-- 축의 데이터를 순서에 상관없이 자동정렬을 설정 -->
<script type="text/javascript"
	src="plugins/jqplot.categoryAxisRenderer.js" /></script>
<!-- 축의 데이터 표현설정과 그래프위의 점의 Option을 설정 -->
<script type="text/javascript"
	src="plugins/jqplot.canvasAxisTickRenderer.js" /></script>

<!-- 파이형 그래프 -->
<script type="text/javascript" src="plugins/jqplot.pieRenderer.min.js"></script>



<script type="text/javascript">

	$(document).ready(function() {
		
		setting();

		// ---------------- 월간-지출에 사용할 리스트 
		<c:set var="tempList" value="${ledgerList}"/>
		
		// ======================= 페이지 시작 Setting() 함수 ============================
		function setting(){	
			
		//	기존 기간별 셋팅 (월간 / 연간 / 기간)
			if('${period}' == 'month'){			// 월간
				monthFunc();	// 기간별
			}else if('${period}' == 'year'){	// 연간
				yearFunc();
			}else if('${period}' == 'selectPeriod'){	// 기간
			 	periodFunc('${startDay}','${endDay}');
			}
			
		// 기존 분류별 셋팅 (수입-지출 / 수입 / 지출)		
			if('${inout}' == '수입-지출'){
			//	restoreCSS();
				inoutFunc('${period}');
			}else if('${inout}' == '수입'){
			//	changeCSS();
				inFunc('${period}');
			}else if('${inout}' == '지출'){
			//	changeCSS();
				outFunc('${period}');
			}
			
		selectedFunc('${inout}','${period}');	// 기존에 선택된 값 셋팅하기
		}
		
		// ========================== Select 선택 (수입-지출 / 수입 / 지출) ======================
		$("#inout").change(function() {
			
			if ($("#inout option:selected").val() == '수입') {
			//	changeCSS();
				inFunc('${period}');
				
			} else if ($("#inout option:selected").val() == '지출') {
			//	changeCSS();
				outFunc('${period}');
			} else if ($("#inout option:selected").val() == '수입-지출') {
			//	restoreCSS();
				inoutFunc('${period}');
			}
		});
		
		// ========================== Select 선택 (월간 / 연간 / 기간) ======================
		$("#period").change(function() {
			var inout = $("#inout option:selected").val();		// 현재 선택된 항목
			var period = $("#period option:selected").val();	// 현재 선택된 기간
			
			if($("#period option:selected").val() == 'month'){			// 월간, 기본
				if('${period}' == 'year' || '${period}' == 'selectPeriod'){	// 연간 -> 월별  또는 기간 -> 월간 
					location.href="ledgerViewStats.do?year=${year }&cmd=stats&period=month&inout="+inout;
				}else{
					location.href="ledgerViewStats.do?year=${calendarDTO.year }&month=${calendarDTO.month }&cmd=stats&period=month&inout="+inout;
				}
			}else if($("#period option:selected").val() == 'year'){		// 연간
				if('${period}' == 'year'){	// 연간 -> 기간 -> 연간 일경우
					location.href="ledgerViewStats.do?year=${year }&cmd=stats&period=year&inout="+inout;
				}else{
					location.href="ledgerViewStats.do?year=${calendarDTO.year }&cmd=stats&period=year&inout="+inout;
				}
				
			}else if($("#period option:selected").val() == 'selectPeriod'){	// 기간
				// 기간 클릭시에 그래프 비활성화-불투명
				$("#graphPie, #graphDiv, #item_title, #item_contents, #inout ").css('opacity', '0.5' ).css('pointer-events', 'none');
			//	$("#startDatePic").focus();
				periodFunc();
			}
		});
		
		
		
		// ========================== 이전-다음 달력 이동 (월간/ 연간 / 기간) ==========================
		// 1. 월간
		function monthFunc(){
			$("#date").html("${calendarDTO.year }년 &nbsp; ${calendarDTO.month+1 }월");
			$(".view_before").attr("onclick","sendPage('lastMonth')");
			$(".view_after").attr("onclick","sendPage('nextMonth')");
		}
		// 2. 연간
		function yearFunc(){
			$("#date").html("${year } 년");
			$(".view_before").attr("onclick","sendPage('lastYear')");
			$(".view_after").attr("onclick","sendPage('nextYear')");
		}
		
		// 3. 기간
		function periodFunc(startDay, endDay){
			if(startDay==null && endDay==null){
				startDay="클릭하세요";
				endDay = "클릭하세요";
			}
			var beforeText = "조회 기간 : ";
			var startDay = "<input type=\"text\" id=\"startDatePic\" name=\"startDatePic\" value=\""+startDay+"\" readonly>";
			var centerText = " - ";
			var endDay = "<input type=\"text\" id=\"endDatePic\" name=\"endDatePic\" value=\""+endDay+"\"readonly>"
			$("#date").html(beforeText+startDay+centerText+endDay);
			$(".view_before, .view_after").removeAttr("onclick");
			$(".view_before, .view_after").removeAttr("style");
			$(".view_before, .view_after").css("background-image", "url('')");
			
			
			
		// ========================== datePicker 자바 스크립트 ======================
				
				// 조회 시작일
				$("#startDatePic").datepicker({
				   // minDate: ,    //최소날짜
				    maxDate: '+1Y+6M',   //최대날짜
				    showButtonPanel:true,
				    closeText:'닫기',
				    dateFormat : 'yy-mm-dd',
				    onSelect: function (dateStr) {
				        var min = $(this).datepicker('getDate'); // Get selected date
				    
				        var startDay = $("#startDatePic").val();
				        var endDay = $("#endDatePic").val();
				    
				        if(endDay!='클릭하세요'){
				        	if(startDay > endDay){
						    	alert("조회종료날보다 이전날로 선택해주세요");
						    	   $("#startDatePic").val('클릭하세요');
				        	}else{
						    	sendPage('selectPeriod');
						    }
				        }else if(endDay=='클릭하세요'){
				        	/* 내용없음 */
				        }
				    }
				});

				// 조회 종료일
				$("#endDatePic").datepicker({
					   // minDate: ,    //최소날짜
					    maxDate: '+1Y+6M',   //최대날짜
					    showButtonPanel:true,
					    closeText:'닫기',
					    dateFormat : 'yy-mm-dd',
					    onSelect: function (dateStr) {	// 달력 클릭후 이벤트
					        var min = $(this).datepicker('getDate'); 
					    	
					        var startDay = $("#startDatePic").val();
					        var endDay = $("#endDatePic").val();
					    
					       if(startDay=='클릭하세요'){
					    		alert("조회 시작 일을 선택해주세요."); 
					       }else if(startDay > endDay){
					    	   alert("조회시작보다 다음날로 선택해주세요");
					    	   $("#endDatePic").val('클릭하세요');
					       }else if(endDay=='클릭하세요'){
					    	   alert("조회 종료 일을 선택해주세요.");
					       }else{
					    	   sendPage('selectPeriod');
					       }
					    }
					});
		}
		
		// ========================== 기존 셀렉터 선택 ==========================
		function selectedFunc(inout, period){
			$('#inout option[value='+inout+']').attr('selected', 'selected');
			$('#period option[value='+period+']').attr('selected', 'selected');
		}
		
		
		
		
		
	//	========================== 수입, 지출 CSS 변경 ==========================
		/* function changeCSS(){
			$(".graphPie").css("width","50%");
			$(".graphPie").css("float","left");
			$(".item_title, .item_contents").css("display","block");
		}
	
		function restoreCSS(){
			$(".graphPie").css("width","100%");
			$(".graphPie").css("float","");
			$(".item_title, .item_contents").css("display","none");
		} */
		
		
	
		
		// 불투명 바탕화면 누르면 달력으로
		$("#ledger_background").click(function(){
			location.href='calendar.do?cmd=main';
		});
		
		
// ========================== Pie 그래프 데이터 조합 (수입-지출 / 수입 / 지출) ==========================
		
		// 1. 수입-지출 차드 정보
		function inoutFunc(keyword){
			var data = []; // 그래프에 들어갈 내용 
			$("#item_contents").html("");	// 기존 데이터 삭제
			$("#graphDiv").html("");	// 기존 데이터 삭제
			
			
			if(keyword == 'month' || keyword == 'selectPeriod'){	// 월별 - 기간별
				// 1. 수입-지출 (월별)
				<c:set var="insum" value="0"/>
				<c:set var="outsum" value="0"/>
				
				<c:forEach var="ledgerDTO" items="${ledgerList}" >
					<c:if test="${ledgerDTO.inOut eq '수입'}">
						<c:set var="insum" value="${insum+ledgerDTO.income}"/>
					</c:if>
					<c:if test="${ledgerDTO.inOut eq '지출'}">
						<c:set var="outsum" value="${outsum+ledgerDTO.spand}"/>
					</c:if>
				</c:forEach>
				
				<c:if test="${fn:length(ledgerList) ne 0  }">	// 리스트가 O
					data.push([ "수입", Number("${insum}") ]);
					data.push([ "지출", Number("${outsum}") ]);
					if(keyword == 'month'){
						$("#item_title").text("지난달과 항목별 비교");
						$("#item_contents").append("<input type=\"button\" onclick=\"chartDivData('수입','cateinout','month','${year}','beforeTime');\" value=\"수입\" />");
						$("#item_contents").append("<input type=\"button\" onclick=\"chartDivData('지출','cateinout','month','${year}','beforeTime');\" value=\"지출\" />");
						
					}else if(keyword == 'selectPeriod'){
						$("#item_title").text("일년전과 항목별 비교");
						$("#item_contents").append("<input type=\"button\" onclick=\"chartDivData('수입','cateinout','selectPeriod','${year}','beforeTime');\" value=\"수입\" />");
						$("#item_contents").append("<input type=\"button\" onclick=\"chartDivData('지출','cateinout','selectPeriod','${year}','beforeTime');\" value=\"지출\" />");
					}
					
				</c:if>
				<c:if test="${fn:length(ledgerList) eq 0  }">	// 리스트가 X
					data.push(["등록된 가계부가 없습니다.", 0]);
				</c:if>
			}else if(keyword=='year'){	// 년별
				<c:set var="totalin" value="0"/>	<!-- 해당월의 수입 합계 -->
				<c:set var="totalout" value="0"/>	<!-- 해당월의 지출 합계 -->
				
				<c:forEach var="i" begin="1" end="12" step="1">
				<!-- 당일에 해당하는 수입/지출 금액 합산 -->
				<c:set var="insum" value="0"/>	// 수입 
				<c:set var="outsum" value="0"/>	// 지출 
				
					<c:set var="list" value="${yearMap[i] }"/>	// 키(달)값을 넣고 list 빼옴 
					<c:if test="${fn:length(list) ne 0  }"> // 리스트의 사이즈가 0이 아닐때 
						<c:forEach var="ledgerDTO" items="${list}">	
							<c:if test="${ledgerDTO.inOut eq '수입'}" >	
								<c:set var="insum" value="${insum+ledgerDTO.income }"/>	<!-- 해당일의 수입 합계 -->
								<c:set var="totalin" value="${totalin+ledgerDTO.income}"/>	<!-- 해당월의 수입 합계 -->
							</c:if>
							<c:if test="${ledgerDTO.inOut eq '지출'}" >
								<c:set var="outsum" value="${outsum+ledgerDTO.spand }"/> 	<!-- 해당일의 지출 합계 -->
								<c:set var="totalout" value="${totalout+ledgerDTO.spand}"/><!-- 해당월의 지출 합계 -->
							</c:if>
						</c:forEach>
					</c:if>
				</c:forEach>
				
				<c:if test="${totalin ne 0 || totalout ne 0}">	// 리스트 O
					data.push([ "수입", Number("${totalin}") ]);
					data.push([ "지출", Number("${totalout}") ]);
					$("#item_title").text("1년전과 항목별 비교");
					$("#item_contents").append("<input type=\"button\" onclick=\"chartDivData('수입','cateinout','year','${year}','beforeTime');\" value=\"수입\" />");
					$("#item_contents").append("<input type=\"button\" onclick=\"chartDivData('지출','cateinout','year','${year}','beforeTime');\" value=\"지출\" />");
				</c:if>
				<c:if test="${totalin eq 0 || totalout eq 0}">	// 리스트 X
					data.push(["등록된 가계부가 없습니다.", 0]);
				</c:if>
			}
			
			makeChartPie(data);
		}
		
		// 2. 수입
	 	function inFunc(keyword){
			var data = []; 	// Pie 그래프에 들어갈 내용 
			$("#item_contents").html("");	// 기존 데이터 삭제
			$("#graphDiv").html("");	// 기존 데이터 삭제
			
			if(keyword == 'month' || keyword == 'selectPeriod'){	// 월간 또는 기간
				<c:if test="${fn:length(ledgerList) ne 0  }">	// 리스트가 O
					<c:forEach var="cate" items="${categoryIn}" >
						<c:set var="cash" value="0"/>
						<c:forEach var="ledgerDTO" items="${ledgerList}">
							<c:if test="${cate eq ledgerDTO.category }">
								<c:set var="cash" value="${cash+ledgerDTO.income }"/>
							</c:if>
						</c:forEach>
					data.push([ "${cate }", Number("${cash }") ]);
					
					if(keyword == 'month'){
						$("#item_title").text("지난달과 항목별 비교");
						$("#item_contents").append("<input type=\"button\" onclick=\"chartDivData('${cate}','catein','month','${year}','beforeTime');\" value=\"${cate}\" />");
					}else if(keyword == 'selectPeriod'){
						$("#item_title").text("1년전과 항목별 비교");
						$("#item_contents").append("<input type=\"button\" onclick=\"chartDivData('${cate}','catein','selectPeriod','${year}','beforeTime');\" value=\"${cate}\" />");
					}
					</c:forEach> 
				</c:if>
				<c:if test="${fn:length(ledgerList) eq 0  }">	// 리스트가 X
					data.push(["등록된 가계부가 없습니다.", 0]);
				</c:if>
				
			}else if(keyword=='year'){	// 연간
				
				<c:set var="listCheck" value="stop"/>
				<c:forEach var="i" begin="1" end="12" step="1">		// 데이터 유무 확인
				<c:set var="ledgerList" value="${yearMap[i] }"/>
					<c:if test="${fn:length(ledgerList) ne 0 }">
						<c:set var="listCheck" value="pass"/>
					</c:if>
				</c:forEach>
				
				<c:if test="${listCheck eq 'pass'}">	// 데이터 O
				$("#item_title").text("1년전과 항목별 비교");
					<c:forEach var="cate" items="${categoryIn}" >
					<c:set var="cash" value="0"/>
						<c:forEach var="i" begin="1" end="12" step="1">
						<c:set var="ledgerList" value="${yearMap[i] }"/>	
							<c:if test="${fn:length(ledgerList) ne 0  }">
								<c:forEach var="ledgerDTO" items="${ledgerList}">	<!--  -->
									<c:if test="${cate eq ledgerDTO.category }">
										<c:set var="cash" value="${cash+ledgerDTO.income }"/>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
					
					$("#item_contents").append("<input type=\"button\" onclick=\"chartDivData('${cate}','catein','year','${year}','beforeTime');\" value=\"${cate}\" />");
					data.push([ "${cate }", Number("${cash }") ]);
				
					</c:forEach>
				</c:if>
				<c:if test="${listCheck eq 'stop'}">	// 데이터 X
					data.push(["등록된 가계부가 없습니다.", 0]);
				</c:if>
			}
			
			makeChartPie(data);
		} 
		
		// 3. 지출
		function outFunc(keyword){
			var data = []; // 그래프에 들어갈 내용
			$("#item_contents").html("");	// 기존 데이터 삭제
			$("#graphDiv").html("");	// 기존 데이터 삭제
			
			if(keyword == 'month' || keyword == 'selectPeriod'){
				<c:if test="${fn:length(tempList) ne 0  }">	// 리스트가 O
				if(keyword == 'month'){
					$("#item_title").text("지난달과 항목별 비교");
				}else if(keyword == 'selectPeriod'){
					$("#item_title").text("1년전과 항목별 비교");
				}
				
					<c:forEach var="cate" items="${categoryOut}" >
					<c:set var="cash" value="0"/>
					<c:forEach var="ledgerDTO" items="${tempList}">
						<c:if test="${cate eq ledgerDTO.category }">
							<c:set var="cash" value="${cash+ledgerDTO.spand }"/>
						</c:if>
					</c:forEach>
				data.push([ "${cate }", Number("${cash }") ]);
				if(keyword == 'month'){
					$("#item_contents").append("<input type=\"button\" onclick=\"chartDivData('${cate}','cateout','month','${year}','beforeTime');\" value=\"${cate}\" />");
				}else if(keyword == 'selectPeriod'){
					$("#item_contents").append("<input type=\"button\" onclick=\"chartDivData('${cate}','cateout','selectPeriod','${year}','beforeTime');\" value=\"${cate}\" />");
				}
					</c:forEach> 
				</c:if>
				<c:if test="${fn:length(tempList) eq 0  }">	// 리스트가 X
					data.push(["등록된 가계부가 없습니다.", 0]);
				</c:if>
			}else if(keyword=='year'){
				<c:set var="listCheck" value="stop"/>
				<c:forEach var="i" begin="1" end="12" step="1">		// 데이터 유무 확인
				<c:set var="ledgerList" value="${yearMap[i] }"/>
					<c:if test="${fn:length(ledgerList) ne 0 }">
						<c:set var="listCheck" value="pass"/>
					</c:if>
				</c:forEach>
			
				<c:if test="${listCheck eq 'pass'}">	// 데이터 O
				$("#item_title").text("1년전과 항목별 비교");
					<c:forEach var="cate" items="${categoryOut}" >
					<c:set var="cash" value="0"/>
						<c:forEach var="i" begin="1" end="12" step="1">
						<c:set var="ledgerList" value="${yearMap[i] }"/>	<!-- 키(달)값을 넣고 list 빼옴 -->
							<c:if test="${fn:length(ledgerList) ne 0  }">
								<c:forEach var="ledgerDTO" items="${ledgerList}">
									<c:if test="${cate eq ledgerDTO.category }">
										<c:set var="cash" value="${cash+ledgerDTO.spand }"/>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>	
						$("#item_contents").append("<input type=\"button\" onclick=\"chartDivData('${cate}','cateout','year','${year}','beforeTime');\" value=\"${cate}\" />");
					data.push([ "${cate }", Number("${cash }") ]);
					</c:forEach> 
				</c:if>
				<c:if test="${listCheck eq 'stop'}">	// 데이터 X
					data.push(["등록된 가계부가 없습니다.", 0]);
				</c:if>
			}
			
			makeChartPie(data);
		}
		
		// ========================== Pie 그래프 제작 ==========================
		 function makeChartPie(data) {
			$('#graphPie').empty();	// 기존 그래프 삭제
			$.jqplot('graphPie', [ data ], {
				seriesDefaults : {
					//원형으로 렌더링
					renderer : $.jqplot.PieRenderer,
					//원형상단에 값보여주기(알아서 %형으로 변환)
					rendererOptions : {
						showDataLabels : true,
						sliceMargin: 4, 
						startAngle: -90,
						padding: 2
					}
				},
				// 색상별 타이틀 
				legend : {
					show:true, 
					placement: '', /* outside */
					rendererOptions: {
					  numberRows: 3
					}, 
					 location:'s',
					 marginTop: '15px'
					/* show : true,
					location : 'e' */
				},
				/* Pie 그래프 마우스 hover 기능 추가(데이터 뜸) */
				highlighter: {
				      show: true,
				      useAxesFormatters: false,
				      tooltipFormatString: '%s'
				    }
			});
		}
		
		// =========================== Pie 그래프 클릭 이벤트 ============================
			$('#graphPie').bind('jqplotDataClick',
				    function (ev, seriesIndex, pointIndex, data) {  
		        var cate = data[0];	// 카테고리
		        var inout = $("#inout option:selected").val();		// 현재 선택된 항목 (수입-지출, 수입, 지출)
				var period = $("#period option:selected").val(); 	// 선택된 기간	(월간, 연간, 기간)
				
				if(inout == '수입-지출'){
					inout = 'cateinout';
				}else if(inout == '수입'){
					inout = 'catein';
				}else if(inout == '지출'){
					inout = 'cateout';
				}
				
				chartDivData(cate, inout, period, '${year}','thisTime');
		    	
				}
			);
	});

	
// ========================== Div 그래프 데이터 조합  ==========================
function chartDivData(cate, inout, period, year, time){
	var data = [];			// 조회한 달, 년, 기간 데이터
	var dataBefore = [];	// 조회한 지난 달, 년, 기간 데이터
	var maxMoney = 0;		// 최대 금액
	var dayMaxMoney = 0;	// 하루 또는 달의 최대금액
	var i=0;
	var dateFormat = null;
	var divColor = "";
	var date = "";
	var xBarTitle =""; 		// div x축 title
	var cateBefore="";		// 저번 카테고리
	var cateThis="";		// 이번 카테고리
	var maxDay=0;			// 이달의 마지막 일
	
	if(period == 'month'){		// 월간
		dateFormat = '%y/%m/%d';
		
		<c:forEach var="monthDays" items="${monthDay}">
		var income = 0;
		var outcome = 0;
		var inoutcash = 0;
		i++;
		dayMaxMoney = 0;
			
			<c:forEach var="ledgerDTO" items="${tempList}">
				if("${monthDays}"=="${ledgerDTO.stringDate}"){	// 날짜와 같으면
					if(inout == 'cateinout'){	// 수입-지출
						if(cate == '수입'){
							inoutcash += Number('${ledgerDTO.income}');
							dayMaxMoney = dayMaxMoney+Number('${ledgerDTO.income}');
						}else if(cate =='지출'){
							inoutcash += Number('${ledgerDTO.spand}');
							dayMaxMoney = dayMaxMoney+Number('${ledgerDTO.spand}');
						}
					}else{	// 수입, 지출
						if('${ledgerDTO.category }'== cate){
							if(inout == 'catein'){
								dayMaxMoney = dayMaxMoney+Number('${ledgerDTO.income}');
								income = income+Number('${ledgerDTO.income}');
							}else if(inout == 'cateout'){
								dayMaxMoney = dayMaxMoney+Number('${ledgerDTO.spand}');
								outcome = outcome+Number('${ledgerDTO.spand}');
							}
						}
					}
					if(maxMoney < dayMaxMoney){	// 하루 금액이 최대 금액보다 클경우
						maxMoney = dayMaxMoney;
					}
				}
			</c:forEach>
			if(time == 'thisTime'){
				date = "${calendarDTO.year}/"+Number("${calendarDTO.month+1}")+"/"+i;
				xBarTitle = "년/월/일";
			}else if(time == 'beforeTime'){	
				date = "${calendarDTO.year}/"+Number("${calendarDTO.month+1}")+"/"+i;
			//	date =i;
				maxDay = i;	// 이달의 마지막날을 저장
				xBarTitle = "일";
			}
			cateThis = "${calendarDTO.month+1}"+"월 "+cate;
			
			if(inout == 'catein'){			// 수입
				data.push([ date , Number(income) ]);
			}else if(inout == 'cateout'){	// 지출
				data.push([ date , Number(outcome) ]);
			}else if(inout == 'cateinout'){	// 수입-지출
				data.push([ date , Number(inoutcash) ]);
			}
			
		</c:forEach>
	
		if(time == 'beforeTime'){	// 전월 비교용
		dateFormat = '%e';
		i = 0;
		maxDay=0;
		<c:forEach var="monthDays" items="${monthDayBefore}">
		var income = 0;
		var outcome = 0;
		var inoutcash = 0;
		
		i++;
		dayMaxMoney = 0;
			
			<c:forEach var="ledgerDTO" items="${ledgerListBefore}">
				if("${monthDays}"=="${ledgerDTO.stringDate}"){	// 날짜와 같으면
					if(inout == 'cateinout'){	// 수입-지출
						if(cate == '수입'){
							inoutcash += Number('${ledgerDTO.income}');
							dayMaxMoney = dayMaxMoney+Number('${ledgerDTO.income}');
						}else if(cate =='지출'){
							inoutcash += Number('${ledgerDTO.spand}');
							dayMaxMoney = dayMaxMoney+Number('${ledgerDTO.spand}');
						}
					}else{	// 수입, 지출
						if('${ledgerDTO.category }'== cate){
							if(inout == 'catein'){
								dayMaxMoney = dayMaxMoney+Number('${ledgerDTO.income}');
								income = income+Number('${ledgerDTO.income}');
							}else if(inout == 'cateout'){
								dayMaxMoney = dayMaxMoney+Number('${ledgerDTO.spand}');
								outcome = outcome+Number('${ledgerDTO.spand}');
							}
						}
					}
					if(maxMoney < dayMaxMoney){	// 하루 금액이 최대 금액보다 클경우
						maxMoney = dayMaxMoney;
					}
				}
			</c:forEach>
			date = "${calendarDTO.year}/"+Number("${calendarDTO.month+1}")+"/"+i;
			maxDay=i;
			if(inout == 'catein'){			// 수입
				dataBefore.push([ date, Number(income) ]);
			}else if(inout == 'cateout'){	// 지출
				dataBefore.push([ date , Number(outcome) ]);
			}else if(inout == 'cateinout'){	// 수입-지출
				dataBefore.push([ date , Number(inoutcash) ]);
			}
			
		</c:forEach>
		
		cateBefore = "${calendarDTO.month}"+"월 "+cate;
		}
	}else if(period == 'year'){	// 연간
		dateFormat = '%y/%m';
		<c:forEach var="i" begin="1" end="12" step="1">
			var income = 0;
			var outcome = 0;
			var inoutcash = 0;
			<c:set var="ledgerList" value="${yearMap[i] }"/>	
			<c:if test="${fn:length(ledgerList) ne 0  }">
				dayMaxMoney = 0;
			
				<c:forEach var="ledgerDTO" items="${ledgerList}">	
					if(inout == 'cateinout'){	// 수입-지출
						if(cate == '수입'){
							inoutcash += Number('${ledgerDTO.income}');
							dayMaxMoney += Number('${ledgerDTO.income}');
						}else if(cate =='지출'){
							inoutcash += Number('${ledgerDTO.spand}');
							dayMaxMoney += Number('${ledgerDTO.spand}');
						}
					}else{	// 수입, 지출
						if('${ledgerDTO.category }'== cate){
							if(inout == 'catein'){
								dayMaxMoney += Number('${ledgerDTO.income}');
								income += Number('${ledgerDTO.income}');
							}else if(inout == 'cateout'){
								dayMaxMoney += Number('${ledgerDTO.spand}');
								outcome += Number('${ledgerDTO.spand}');
							}
						}
					}
				</c:forEach>
				
				if(maxMoney < dayMaxMoney){	// 하루 금액이 최대 금액보다 클경우
					maxMoney = dayMaxMoney;
				}
			</c:if>
			if(time == 'thisTime'){
				date = year+"/${i}";
				xBarTitle = "년/월";
			}else if(time == 'beforeTime'){
				date = '${i}';
				xBarTitle = "월";
			}
			cateThis = Number(year)+"년 "+cate;
			
			if(inout == 'catein'){			// 수입 
				data.push([ date , Number(income) ]);
			}else if(inout == 'cateout'){	// 지출
				data.push([ date , Number(outcome) ]);
			}else if(inout == 'cateinout'){	// 수입-지출
				data.push([ date , Number(inoutcash) ]);
			}
		
		</c:forEach>
		
		if(time =='beforeTime'){	// 지난 해
			dateFormat = '%m';
			<c:forEach var="i" begin="1" end="12" step="1">
				var income = 0;
				var outcome = 0;
				var inoutcash = 0;
				<c:set var="ledgerListBefore" value="${yearMapBefore[i] }"/>	
				<c:if test="${fn:length(ledgerListBefore) ne 0  }">
					dayMaxMoney = 0;
				
					<c:forEach var="ledgerDTO" items="${ledgerListBefore}">	
						if(inout == 'cateinout'){	// 수입-지출
							if(cate == '수입'){
								inoutcash += Number('${ledgerDTO.income}');
								dayMaxMoney += Number('${ledgerDTO.income}');
							}else if(cate =='지출'){
								inoutcash += Number('${ledgerDTO.spand}');
								dayMaxMoney += Number('${ledgerDTO.spand}');
							}
						}else{	// 수입, 지출
							if('${ledgerDTO.category }'== cate){
								if(inout == 'catein'){
									dayMaxMoney += Number('${ledgerDTO.income}');
									income += Number('${ledgerDTO.income}');
								}else if(inout == 'cateout'){
									dayMaxMoney += Number('${ledgerDTO.spand}');
									outcome += Number('${ledgerDTO.spand}');
								}
							}
						}
					</c:forEach>
					
					if(maxMoney < dayMaxMoney){	// 하루 금액이 최대 금액보다 클경우
						maxMoney = dayMaxMoney;
					}
				</c:if>
				if(inout == 'catein'){			// 수입 
					dataBefore.push([ "${i}" , Number(income) ]);
				}else if(inout == 'cateout'){	// 지출
					dataBefore.push([ "${i}" , Number(outcome) ]);
				}else if(inout == 'cateinout'){	// 수입-지출
					dataBefore.push([ "${i}" , Number(inoutcash) ]);
				}
			
				cateBefore = Number(year)-1+"년 "+cate;
			</c:forEach>
		}
		
	}else if(period == 'selectPeriod'){	// 기간 
		dateFormat = '%y/%m/%d';
		var periodDays = [];	// 조회 기간 date
		
		<c:forEach var="periodDay" items="${selectPeriodList}">
		var income = 0;
		var outcome = 0;
		var inoutcash = 0;
		dayMaxMoney = 0;
			<c:forEach var="ledgerDTO" items="${tempList}">
				<c:if test="${periodDay eq ledgerDTO.stringDate}">	// 날짜가 같으면
				if(inout == 'cateinout'){	// 수입-지출
					if(cate == '수입'){
						inoutcash += Number('${ledgerDTO.income}');
						dayMaxMoney = dayMaxMoney+Number('${ledgerDTO.income}');
					}else if(cate =='지출'){
						inoutcash += Number('${ledgerDTO.spand}');
						dayMaxMoney = dayMaxMoney+Number('${ledgerDTO.spand}');
					}
				}else{	// 수입, 지출
					if('${ledgerDTO.category }'== cate){	// 카테고리가 같으면
						if(inout == 'catein'){			// 수입
							dayMaxMoney = dayMaxMoney+Number('${ledgerDTO.income}');
							income = income+Number('${ledgerDTO.income}');
						}else if(inout == 'cateout'){	// 지출
							dayMaxMoney = dayMaxMoney+Number('${ledgerDTO.spand}');
							outcome = outcome+Number('${ledgerDTO.spand}');
						}
					}
				}
				</c:if>
		
				if(maxMoney < dayMaxMoney){	// 하루 금액이 최대 금액보다 클경우
					maxMoney = dayMaxMoney;
				}
			</c:forEach>
			if(time == "thisTime"){
				xBarTitle = "년/월/일";
			}else if(time == "beforeTime"){
				xBarTitle = "년/월/일";
				
			}
			
			cateThis = "조회기간 "+cate;
			periodDays.push("${periodDay}");
			
			if(inout == 'catein'){			// 수입
				data.push([ "${periodDay}" , Number(income) ]);
			}else if(inout == 'cateout'){	// 지출
				data.push([ "${periodDay}" , Number(outcome) ]);
			}else if(inout == 'cateinout'){	// 수입-지출
				data.push([ "${periodDay}" , Number(inoutcash) ]);
			}
		</c:forEach>
		
		
		if(time =='beforeTime'){
		dateFormat = '%m/%d';
		var i = 0;
		<c:forEach var="periodDay" items="${selectPeriodListBefore}">
		var income = 0;
		var outcome = 0;
		var inoutcash = 0;
		dayMaxMoney = 0;
			<c:forEach var="ledgerDTO" items="${ledgerListBefore}">
				<c:if test="${periodDay eq ledgerDTO.stringDate}">	// 날짜가 같으면
				if(inout == 'cateinout'){	// 수입-지출
					if(cate == '수입'){
						inoutcash += Number('${ledgerDTO.income}');
						dayMaxMoney = dayMaxMoney+Number('${ledgerDTO.income}');
					}else if(cate =='지출'){
						inoutcash += Number('${ledgerDTO.spand}');
						dayMaxMoney = dayMaxMoney+Number('${ledgerDTO.spand}');
					}
				}else{	// 수입, 지출
					if('${ledgerDTO.category }'== cate){	// 카테고리가 같으면
						if(inout == 'catein'){			// 수입
							dayMaxMoney = dayMaxMoney+Number('${ledgerDTO.income}');
							income = income+Number('${ledgerDTO.income}');
						}else if(inout == 'cateout'){	// 지출
							dayMaxMoney = dayMaxMoney+Number('${ledgerDTO.spand}');
							outcome = outcome+Number('${ledgerDTO.spand}');
						}
					}
				}
				</c:if>
		
				if(maxMoney < dayMaxMoney){	// 하루 금액이 최대 금액보다 클경우
					maxMoney = dayMaxMoney;
				}
			</c:forEach>
			
			if(inout == 'catein'){			// 수입
				dataBefore.push([ periodDays[i] , Number(income) ]);
			}else if(inout == 'cateout'){	// 지출
				dataBefore.push([ periodDays[i] , Number(outcome) ]);
			}else if(inout == 'cateinout'){	// 수입-지출
				dataBefore.push([ periodDays[i] , Number(inoutcash) ]);
			}
			i++;
		</c:forEach>
		cateBefore="1년전 "+cate;
		}
	}
	// div 그래프 글자 색 설정
	if(inout == 'catein' || cate == '수입'){
		divColor = '#3B36CF';	// 파란색
	}else if(inout == 'cateout' || cate == '지출'){
		divColor = '#CE3636';	// 빨간색
	}
	
	if(time == 'thisTime'){
		makeChartDiv(data, maxMoney, cateThis, dateFormat, divColor, xBarTitle);
	}else if(time == 'beforeTime'){
		makeChartDivBefore(data, dataBefore, maxMoney, cateThis, cateBefore, dateFormat, divColor, xBarTitle);
	}
}
		
		
// ========================== Div 그래프 제작 (조회기간) ==========================
function makeChartDiv(data, maxMoney, cateThis, dateFormat, divColor, xBarTitle) {
    
	$('#graphDiv').empty();	// 기존 그래프 삭제
    var plot = $.jqplot('graphDiv', [data],{	// 라인 1, 라인 2
     axes:{
      xaxis:{
    	  label : xBarTitle, // '날짜'
       // 날짜 형태로 입력: Date형식의 Renderer을 사용.
       renderer:$.jqplot.DateAxisRenderer,
       tickOptions:{ // 축에관한 옵션                   
       // format 형식: 입력값(yyyy/mm/dd)
        formatString: dateFormat
       }
      },
      yaxis: { // y축 옵션
          label : '사용 금액(원)', // y축 Label
          min : 0, // 최소값
          max : maxMoney+5000,  // 최대값
          numberTicks : 11, // 인위적으로 축을 나누는 개수
          tickOptions:{
        //  fontString : '%1f' // 소수점 1째 자리까지 표기
          }
  }
     },
     series:[        // 속성?  양쪽에 선그리기
      {         // 두번째 그래프 속성
       label:cateThis,	// 선택된 항목으로 표시
       color : divColor, //'#CE3636',
       rendererOptions: {
        animation: {
         speed: 2500    // 노랑선 그려지는 속도
        }
       }
      }
     ],
     animate: true,     // 그래프 그려지는 애니메이션
     animateReplot: true,
     cursor: {
      show: true,
      zoom: true,
      looseZoom: true,
      showTooltip: true,     // 툴팁 유무
      tooltipLocation:'sw'   // 툴팁 위치
     },
     highlighter: {
      show: true,
      showLabel: true,
      tooltipAxes: 'y',
      sizeAdjust: 7.5 , tooltipLocation : 'ne'
     },
     legend:{ show: true }      
     }); // plot
   }
   
//========================== Div 그래프 제작 (조회기간 전) ==========================
function makeChartDivBefore(data, dataBefore, maxMoney, cateThis, cateBefore, dateFormat, divColor, xBarTitle) {
	$('#graphDiv').empty();	// 기존 그래프 삭제
    var plot = $.jqplot('graphDiv', [data,dataBefore],{	// 라인 1, 라인 2
     axes:{
      xaxis:{
    	  label : xBarTitle,	// '날짜'
       // 날짜 형태로 입력: Date형식의 Renderer을 사용.
       renderer:$.jqplot.DateAxisRenderer,
       tickOptions:{ // 축에관한 옵션                   
       // format 형식: 입력값(yyyy/mm/dd)
        formatString: dateFormat //dateFormat - '%e'
       }
      },
      yaxis: { // y축 옵션
          label : '사용 금액(원)', // y축 Label
          min : 0, // 최소값
          max : maxMoney+5000,  // 최대값
          numberTicks : 11, // 인위적으로 축을 나누는 개수
          tickOptions:{
        //  fontString : '%1f' // 소수점 1째 자리까지 표기
          }
  }
     },
     series:[        // 속성?  양쪽에 선그리기
      {         // 첫번째 그래프 속성
       label: cateThis,	// 선택된 항목으로 표시
       color : divColor, //'#CE3636',
       rendererOptions: {
        animation: {
         speed: 2500    // 노랑선 그려지는 속도
        }
       }
      },
      {         // 두번째 그래프 속성
          label: cateBefore,	// 선택된 항목으로 표시
          color : '#000000', //'#CE3636',
          rendererOptions: {
           animation: {
            speed: 2500    // 노랑선 그려지는 속도
           }
          }
         }
     ],
     animate: true,     // 그래프 그려지는 애니메이션
     animateReplot: true,
     cursor: {
      show: true,
      zoom: true,
      looseZoom: true,
      showTooltip: true,     // 툴팁 유무
      tooltipLocation:'sw'   // 툴팁 위치
     },
     highlighter: {
      show: true,
      showLabel: true,
      tooltipAxes: 'y',
      sizeAdjust: 7.5 , tooltipLocation : 'ne'
     },
     legend:{ show: true }      
     }); // plot
   }


	
	// ========================== 이동 페이지 조합 (월간 / 년간 / 기간) ==========================
			
	function sendPage(keyword){	// 페이지 전송
				
		var inout = $("#inout option:selected").val();	// 현재 선택된 항목
		var period = $("#period option:selected").val();	// 현재 선택된 기간
		
				
		if(keyword == 'lastMonth'){			// 월 - 이전달
			location.href="ledgerViewStats.do?year=${calendarDTO.year }&month=${calendarDTO.month-1 }&cmd=stats&period=month&inout="+inout;
		}else if(keyword =='nextMonth'){	// 월 - 다음달
			location.href="ledgerViewStats.do?year=${calendarDTO.year }&month=${calendarDTO.month+1 }&cmd=stats&period=month&inout="+inout;
		}else if(keyword == 'lastYear'){	// 년 - 지난해
			location.href="ledgerViewStats.do?year=${year-1 }&cmd=stats&period=year&inout="+inout;
		}else if(keyword == 'nextYear'){	// 년 - 다음해
			location.href="ledgerViewStats.do?year=${year+1 }&cmd=stats&period=year&inout="+inout;
		}else if(keyword == 'selectPeriod'){	// 기간 선택
			var startDay = $("#startDatePic").val();
			var endDay = $("#endDatePic").val();
			location.href="ledgerViewStats.do?cmd=stats&period=selectPeriod&inout="+inout
							+"&startDay="+startDay+"&endDay="+endDay;
		}
	} 
	
	
	//숫자 3번째 자리마다 콤마(,) 찍기
	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
</script>


<title>통계 보기</title>
</head>
<body>

	<!-- 흐릿한 뒷 배경 -->
	<div id="ledger_background"></div>
<div class="container">
	<div class="ledger_body">

		<div class="top">
			<div class="close" onclick="location.href='calendar.do?cmd=main'">x</div>
			<div class="before" onclick="javascript:history.back()">←</div>
			<div class="subject">통계 보기</div>
		</div>

		<div class="bottom">

			<!-- 이전 화살표 -->
			<div class="view_before" onclick="" style="cursor: pointer;"></div>


			<div class="view_center">
				<div class="info" id="date"></div>
				<!-- 해당 날짜 -->
				<div class="contents">
					<div class="contents_top">
						<div id="select" class="select">
							<select name="inout" id="inout" class="inout">
								<option value="수입-지출">수입-지출</option>
								<option value="수입">수입</option>
								<option value="지출">지출</option>
							</select> 
							<select name="period" id="period" class="period">
								<option value="month">월간</option>
								<option value="year">연간</option>
								<option value="selectPeriod">기간</option>
							</select>
						</div>
					</div>
					<div class="contents_center_top">
						<!-- Pie 그래프  -->
						<div id="graphPie" class="graphPie"></div>
						
						<!-- 항목별 버튼 위치 -->
						<div id="item_title" class="item_title">타이틀</div>
						<div id="item_contents" class="item_contents">컨텐츠</div>
						
					</div>
					<div class="contents_center_bottom">
						<!-- Div 그래프  -->
						<div id="graphDiv" class="graphDiv"></div>
					</div>
				</div>
			</div>

			<!-- 다음 화살표 -->
			<div class="view_after" onclick="" style="cursor: pointer"></div>
		</div>
	</div>
</div>
</body>
</html>