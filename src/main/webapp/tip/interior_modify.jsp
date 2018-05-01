<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert_title_here</title>
	<link rel="stylesheet" type="text/css" href="/sola/css/tip.css">
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript" src="/sola/resources_tip/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<style type="text/css">
		#i_add_title{width:100%; height:170px;background: url("/sola/img/interior_drawing.jpg") repeat left center;}
		#i_add_content{margin:40px; float:left; width:1200px; overflow:hidden;height:auto;}
		#i_add_subtitle{margin:20px 0;}
		#i_add_subtitle .subtitle_detail{border:1px solid #DCDCDC;height:80px; padding: 20px; font-size:17px; line-height: 26px;}
		#i_add_form{ background-color: #6a6763; padding:40px;overflow:hidden;height:auto;}
		#i_add_form .form_title{border-bottom:1px solid white; color:white; font-size:20px;padding:10px 0;margin-bottom:20px;}
		#i_add_form .form_detail{height:100%;}
		#price, #roomsize{font-size: 18px; padding:10px;border-style: none;}
		.interior_btn{outline: none;border-style:none;width:200px; border:1px solid #ff8400; background: none;font-size:16px;border-radius:20px;height:40px;}
		.interior_btn:hover, .interior_btn:active{background: #ff8400;color:white;}
		#fileAdd{outline:none;background:none;color:white;width:130px;margin-top:10px; height:30px;border-style: none;border:1px solid white; border-radius: 5px;}
		#fileAdd:hover, #fileAdd:active{background: white; font-weight:bold; color:black;outline:none;}
		.filename{margin:5px 20px;color:white;font-size:14px;}
		.write_required{font-weight: bold;color:#ff8400; margin-left: 4px;}
	</style>
	<script type="text/javascript">
	
		$(function(){
			var widthBefore = $('#imgBefore').width();
			var heightBefore = $('#imgBefore').height();
			if(widthBefore/heightBefore > 2){
				$('#imgBefore').css({
					"display":"block",
					"margin" : "auto",
					"max-height" : "100%"
				});
			}else{
				$('#imgBefore').css({
					"display":"block",
					"margin" : "auto",
					"max-width" : "100%"
				});
			}
			
			//전역변수
		    var obj = [];              
		    //스마트에디터 프레임생성
		    nhn.husky.EZCreator.createInIFrame({
		        oAppRef: obj,
		        elPlaceHolder: "editor",
		        sSkinURI: "/sola/resources_tip/editor/SmartEditor2Skin.html",
		       /* sSkinURI: "./SmartEditor2Skin.html", */
		        htParams : {
		            // 툴바 사용 여부
		            bUseToolbar : true,            
		            // 입력창 크기 조절바 사용 여부
		            bUseVerticalResizer : true,    
		            // 모드 탭(Editor | HTML | TEXT) 사용 여부
		            bUseModeChanger : true
		        }
		    });
		    //전송버튼
		    $("#formSubmit").click(function(){
		    	if($('#price').val() == ''){
		    		alert("가격은 필수 입력사항입니다.");
					$('#price').focus();
					return false;
		    	}
		    	if($('#interior_mainimage').val() == ''){
		    		if(confirm("대표 이미지가 없습니다.\n그래도 수정하시겠습니까?")){
		    			sub();
		    		}
		    	} else{
		    		if(confirm("수정하시겠습니까?")){
		    			sub();
		    		}
	    		}
		    
		    });
		    
		    $('#price').on("keyup", function(){
				$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
			});

		    $('#roomsize').on("keyup", function(){
				$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
			});
		    
			function sub(){
				 //id가 smarteditor인 textarea에 에디터에서 대입
	            obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
	            //폼 submit
	            $("#insertBoardFrm").submit();
			};
			$('#fileAdd').on('click', function(){
				$('#interior_mainimage').click();
			});
		
			$('.imgDisplay').hide();
		});


		var loadFile = function(event) {
		    document.getElementById('afterImg').innerHTML = '<img src="#" id="imgAfter" width="" height="">';
		    var output = document.getElementById('imgAfter');
		    output.src = URL.createObjectURL(event.target.files[0]);
		    $('#imgAfter').on('load', function(){
		    	var widthAfter = $(this)[0].naturalWidth;
				var heightAfter = $(this)[0].naturalHeight;
				if(widthAfter/heightAfter > 2){
					$('#imgAfter').css({
						"display":"block",
						"margin" : "auto",
						"max-width" : "100%",
						"height" : "auto"
					});
				}else{
					$('#imgAfter').css({
						"display":"block",
						"margin" : "auto",
						"max-height" : "100%",
						"width" : "auto"
					});
				}
		    });
		  };
		  
			function cancelBtn(){
				if(confirm("수정을 취소하시겠습니까?")){
					history.back();
				}
			};
			
	</script>
	</head>
	<body>
		<div id="i_add_title">
			<h1 style=" float:left;background: white; font-family:'NanumGothic';font-weight:normal;font-size:40px; margin-top:60px;margin-left: 30px;">인테리어 수정하기</h1>
		</div>
		<div id="i_add_content">
			
			<div id="i_add_form">
				<form action="./insertInteriorBoard.do" method="post" id="insertBoardFrm" enctype="multipart/form-data">
				<div style="text-align: left; color: #ff8400;font-size:12px;margin-bottom:20px;"> * 는 필수 입력 사항입니다.</div>
					<div style="color:white; margin-bottom:50px;">
					<div class="form_title">한줄소개<span style="font-size:14px;color:white;margin:10px 10px;">| 방에 대한 소개를 한줄로 적어주세요</span></div>
					<input type="text" id="interior_title" value="${interiorDTO.interior_title }" name="interior_title" placeholder="방 꾸미는 데 하루면 충분!" style="width: 98%;font-size: 18px; padding:10px;border-style: none;">
					</div>
					<div style="color:white; margin-bottom:50px;">
					<div class="form_title">총 비용<span class="write_required">*</span><span style="font-size:14px;color:white;margin:10px 10px;">| 대략적으로 적어주세요</span></div>
					<input type="text" id="price" name="price" value="${interiorDTO.price }" style="width:100px;text-align: right;">&nbsp;만원
					</div>
					<div style="color:white; margin-bottom:50px;">
					<div class="form_title">평수<span style="font-size:14px;color:white;margin:10px 10px;">| 방의 크기를 대략적으로 적어주세요</span></div>
					<input type="text" id="roomsize" name="roomsize" value="${interiorDTO.roomsize }" style="width:100px;text-align: right;">&nbsp;평
					</div>
				<div class="form_title">대표사진 등록<span style="font-size:14px;color:white;margin:10px 10px;">| 본문의 첨부사진과는 무관하게 메인에 보일 대표사진입니다.</span></div>
					<div style="width:100%;">
					<div style="float:left;width:35%;height:100px;">
						<input type="file" id="interior_mainimage" value="${interiorDTO.interior_mainimage }"name="interior_mainimage" onchange="loadFile(event)" style="display:none;" multiple>
						<input type="button" id="fileAdd" value="사진 첨부하기">
					</div>
					<div style="float:left;width:65%;height:100px;">
							<div style="float:left;width:50%;height:100px;">
							<div style="float:left;font-size:12px; color:white;">현재사진 &gt;&nbsp;</div>
							<c:if test="${interiorDTO.interior_mainimage != 'null'}">
								<div style="float:left;width:200px;height:100px;overflow:hidden;border-radius: 10px; border:1px solid #6a6763;"><img src="/sola/storage/${interiorDTO.interior_mainimage}" id="imgBefore" width="" height=""></div>
							</c:if>
							<c:if test="${interiorDTO.interior_mainimage == 'null'}">
							없음
							</c:if>
							
							</div>
							<div style="float:left;width:50%;height:100px;">
							<div style="float:left;font-size:12px; font-weight:bold; color:#ff8400;">수정 사진 &gt;&nbsp;</div>
								<div id="afterImg" style="float:left;width:200px;height:100px;overflow:hidden;border-radius: 10px; border:1px solid #6a6763;"></div>
							</div>
						
						</div>
					</div>
						
				<div class="form_title">나만의 인테리어 작성하기<span class="write_required">*</span></div>
				<div class="form_detail"><!-- 레시피 내용 입력 부분 -->
				
				
			    <div style="background: white;">
			        <textarea name="editor" id="editor" style="width: 100%; height: 600px;">${interior_content }</textarea>
			    </div>
			   
				
				</div> 
				</form>
			</div>
			<div style="float:right;text-align:right;width:80%;padding:20px 0;">
				<input type="button" value="취소" onclick="javascript:cancelBtn()" class="interior_btn">&nbsp;&nbsp;&nbsp; <input id="formSubmit" type="button" value="수정" class="interior_btn">
			</div>
			
		</div>
	</body>
</html>