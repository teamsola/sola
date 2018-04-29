<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
session.setAttribute("memId","jaesuk");
session.setAttribute("memName", "서재석");
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset=UTF-8">
	<title>SOLA > 장소 등록</title>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5f80aacb55527fc9a78de91374d1d0c3&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript">
		$(function(){
			
		});
	</script>
	</head>
	<body>
		<div id="place_add">	<!-- 장소 등록 div -->
    <div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	<div class="opt">
            <div>
                <input type="text" value="종로 1" id="exp_keyword" size="25"> 
                <input id="srchBtn" type="button" value="검색">

            </div>
        </div>
</div><!-- map_wrap END -->
<div class="map_sb">
	<hr>
	<span style="color:#ff8400; margin-left:10px; font-weight: bold; font-size: 25px;">
		${memName }</span><span> 님이 추천하는 장소
	</span><div style="float:right; height:40px; vertical-align:bottom; display: table-cell; line-height: 70px;">
	<!-- 도움말 --><img class="help_icon" width="70px" height="auto" src="../img/help.png"><div class="help_info"></div></div>
	<hr>
	<div id="map_sb_form">
		<form action="/sola/tip/addExpress.do" method="post" id="map_sb_form" name="map_sb_form">
		<input type="hidden" value="" id="auto_express_lat" name="auto_express_lat" class="auto_input">
		<input type="hidden" value="" id="auto_express_lng" name="auto_express_lng" class="auto_input">
		<input type="hidden" value="" id="auto_express_region_1depth_name" name="auto_express_region_1depth_name" class="auto_input">
		<input type="hidden" value="" id="auto_express_region_2depth_name" name="auto_express_region_2depth_name" class="auto_input">
			<table id="map_sb_tb">
				<tr>
					<th class="left">장소명</th>
					<td class="right"><input type="text" name="auto_expressname" id="auto_expressname" class="auto_input" required="required"></td>
				</tr>
				<tr>
					<th class="left">지번주소</th>
					<td class="right"><input type="text" name="auto_addressname" id="auto_addressname" required="required" readonly></td>
				</tr>
				<tr>
					<th class="left">도로명주소</th>
					<td class="right"><input type="text" name="auto_roadaddressname" id="auto_roadaddressname" readonly></td>
				</tr>
				<tr>
					<th class="left">상세위치</th>
					<td class="right"><input type="text" name="express_addressdetail" id="express_addressdetail" class="auto_input" required="required" placeholder="예) 솔라빌딩 1층 정문 옆"></td>
				</tr>
				<tr>
					<th class="left">장소설명</th>
					<td class="right"><textarea cols="15" rows="5" name="express_detail" id="express_detail"
					placeholder="장소에 대해 설명해주세요.&#13;&#10;선정 이유를 덧붙여주시면 더 좋습니다.&#13;&#10;(예) 바로 위에 CCTV가 있어서 안심해도 돼요!"></textarea></td>
				</tr>
			</table>
			<div id="btn_area">
				<input type="button" value="취소" onclick="cancelBtn()" class="place_btn">&nbsp;&nbsp;&nbsp; <input type="button" value="등록" onclick="place_submit()" class="place_btn">
			</div>
		</form>
	</div><!-- map_sb_form END -->
</div><!-- map_sb END -->
</div><!-- place_add END -->
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
center: new daum.maps.LatLng(37.466826, 126.9786567), // 지도의 중심좌표
level: 13 // 지도의 확대 레벨
};  



//마커를 생성합니다
var marker;

//인포윈도우를 생성합니다
var infowindow;

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

daum.maps.event.addListener(map, 'center_changed', function() {


if(marker != null) marker.setMap(null);
// 지도의 중심좌표를 얻어옵니다 
var latlng = map.getCenter(); 

marker = new daum.maps.Marker({
   map: map,
   position: latlng
});
marker.setMap(map);

geocoder.coord2Address(latlng.getLng(), latlng.getLat(), function(result, status){
if (status === daum.maps.services.Status.OK) {
	if(infowindow != null) infowindow.close();
    infowindow = createInfowindow(latlng, result[0].address.address_name, result[0].road_address.address_name, result[0].address.region_1depth_name, result[0].address.region_2depth_name);
	   infowindow.open(map, marker);
}else{
	alert("해당 좌표의 주소가 존재하지 않습니다.");
}
});

// 인포윈도우로 장소에 대한 설명을 표시합니다

// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
map.setLevel(3);
map.setCenter(latlng);

});

searchAddressKeyword('종로 1');

//주소로 좌표를 검색합니다
function searchAddressKeyword(keyword){
geocoder.addressSearch(keyword, function(result, status) {

 if (status === daum.maps.services.Status.OK) {
	 

		if(marker != null) marker.setMap(null);
	   var coords = new daum.maps.LatLng(result[0].y, result[0].x);

	   // 결과값으로 받은 위치를 마커로 표시합니다
	   marker = new daum.maps.Marker({
	       map: map,
	       position: coords
	   });
   
	marker.setMap(map);
	geocoder.coord2Address(coords.getLng(), coords.getLat(), function(result, status){
		if (status === daum.maps.services.Status.OK) {
			if(infowindow != null) infowindow.close();
	        infowindow = createInfowindow(coords, result[0].address.address_name, result[0].road_address.address_name, result[0].address.region_1depth_name, result[0].address.region_2depth_name);

			   infowindow.open(map, marker);
	    }else{
	    	alert("해당 좌표의 주소가 존재하지 않습니다.");
	    }
	});

   // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
   map.setLevel(3);
   map.setCenter(coords);


   
   
} else{
	alert('해당 주소가 존재하지 않습니다.\n도로명 또는 주소명으로 입력해주세요.\nex) 양현로 192');
}
});    
};
function clickev(lat, lng, auto_address, auto_roadaddress, region_1depth_name, region_2depth_name){
	document.getElementById("auto_express_lat").value = lat;
	document.getElementById("auto_express_lng").value = lng;
	document.getElementById("auto_addressname").value = auto_address;
	document.getElementById("auto_roadaddressname").value = auto_roadaddress;
	document.getElementById("auto_express_region_1depth_name").value = region_1depth_name;
	document.getElementById("auto_express_region_2depth_name").value = region_2depth_name;
	
};


function createInfowindow(coords, auto_address, auto_roadaddress, region_1depth_name, region_2depth_name){



var content1 =
	'<div class="infowindow" style="float:left;margin:0 auto;width:350px;padding:6px 0;">' + 

	// ooo님의 추천장소
	'<div style="width:250px;border-bottom:1px solid gray;text-align:center;margin:0 auto;">'+
		'<span style="font-weight:bold;font-size:14px;color:#ff8400;">'+'${memName}' + '</span>' + '님의 추천장소' +
	'</div>' +

	// 지번주소 표시 칸
	'<div style="width:320px;height:25px;margin:10px auto;">'+
	'<span style="font-weight:bold;font-size:12px;color:#ff8400;">'+'<지번주소>'+'</span>&nbsp;'+ auto_address +
	'</div>'+

	// 도로명주소 표시 칸
	'<div style="width:320px;height:25px;margin:10px auto;">'+
	'<span style="font-weight:bold;font-size:12px;color:#ff8400;">'+'<도로명주소>'+'</span>&nbsp;'+ auto_roadaddress +
	'</div>'+


	//버튼 칸
	'<div style="width:250px;height:32px; border-top:1px solid gray;padding-top:5px;text-align:center;margin:0 auto;">'+
		'<input type="button" id="auto_btn" onclick="javascript:clickev(__lat,__lng,__auto_address,__auto_roadaddress,__region_1depth_name,__region_2depth_name)" value="주소 입력하기 >>" style="outline:none;width:150px;height:30px;cursor:pointer;font-weight:bold; font-size:12px; color:#6a6763; border-radius:15px; border:1px solid #6a6763; background:none;">'+
	'</div>'+
	'</div>';
	content1 = content1.replace(/__lat/gi, "'" + coords.getLat() + "'").replace(/__lng/gi, "'" + coords.getLng() + "'").replace(/__auto_address/gi, "'" + auto_address + "'").replace(/__auto_roadaddress/gi, "'" + auto_roadaddress + "'").replace(/__region_1depth_name/gi, "'" + region_1depth_name + "'").replace(/__region_2depth_name/gi, "'" + region_2depth_name + "'");
var window = new daum.maps.InfoWindow({
position: coords,
content: content1
});

return window;

}

$('#srchBtn').click(function(){
var kw = $('#exp_keyword').val();
searchAddressKeyword(kw);
});

function cancelBtn(){
if(confirm("등록을 취소하시겠습니까?")){
history.back();
}
}

$("#auto_addressname").on("mouseup", function(){
alert("주소는 지도 검색을 통해서만 입력 가능합니다.");
});

$("#auto_roadaddressname").on("mouseup", function(){
alert("주소는 지도 검색을 통해서만 입력 가능합니다.");
});
function place_submit(){
var flag = false;
if($("#auto_expressname").val() == ""){
alert("장소명을 입력해주세요.");
$("#auto_expressname").focus();
return false;
}
if($("#auto_addressname").val() == ""){
alert("주소를 입력해주세요.");
$("#auto_addressname").focus();
return false;
}
if($("#express_addressdetail").val() == ""){
	alert("장소 설명을 적어주세요.");
	$("#express_addressdetail").focus();
	return false;
}
if($("#express_detail").val() == ""){
alert("장소 설명을 적어주세요.");
$("#express_detail").focus();
return false;
}
if(confirm("작성하신 내용대로 공유하시겠습니까?")){
	document.map_sb_form.submit();
}
};

$('input[id=exp_keyword]').keydown(function(e){
	if(e.keyCode == 13){
		var kw = $(this).val();
		searchAddressKeyword(kw);
	}
});
$('.help_info').hide();
// 도움말 버튼
$(".help_icon").hover(function(){
	$(this).attr("src", "../img/help_sel.png");
	$('.help_info').fadeIn(200);
}, function(){
	$(".help_icon").attr("src", "../img/help.png");
	$('.help_info').fadeOut(200);
});



</script>
	</body>
</html>