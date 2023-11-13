<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<link rel="stylesheet" href="/ddstudio/asset/css/main.css">
<link rel="stylesheet" href="/ddstudio/asset/css/user.css">
<style>
ul, ol, li {
	list-style: none;
}

ul {
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

#cancel {
	margin-right: 15px;
}

.detail {
	border-top: 2px solid #e1e1e1;
	border-bottom: 2px solid #e1e1e1;
	padding: 44px 0;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 100px auto;
}

.img {
	width: 500px;
	height: 500px;
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
}

.infoArea {
	border: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	width: calc(100% - 615px);
	margin-left: 40px;
	word-wrap: break-word;
	word-break: keep-all;
	min-height: 512px;
	height: auto;
	float: right;
}

.infoArea li {
	margin-bottom: 20px;
	display: table;
	min-height: 80px;
	padding-left: 95px;
	color: #000;
}

.infoArea li.op1 {
	background: url('/ddstudio/asset/image/dininginfo_icon1.png') no-repeat
		0 center;
}

.infoArea li.op2 {
	background: url('/ddstudio/asset/image/dininginfo_icon2.png') no-repeat
		0 center;
}

.infoArea li.op3 {
	background: url('/ddstudio/asset/image/dininginfo_icon3.png') no-repeat
		0 center;
}

.infoArea li.op6 {
	background: url('/ddstudio/asset/image/dininginfo_icon6.png') no-repeat
		0 center;
}

.infoArea li.op7 {
	background: url('/ddstudio/asset/image/close_icon.png') no-repeat
		0 center;
}

.infoArea li.op8 {
	background: url('/ddstudio/asset/image/calendar_icon.png') no-repeat
		0 center;
}

.infoArea li .tableCell {
	display: table-cell;
	vertical-align: middle;
	min-height: 80px;
}

.infoArea li .txt1 {
	font-size: 18px;
	color: #555555;
	text-align: left;
}

.infoArea li .txt2 {
	margin-top: 8px;
	color: #555555;
	line-height: 20px;
	text-align: left;
}

#duplicate-check {
	padding: 0;
}

.sub-title {
	font-size: 26px;
	color: #000;
	text-align: center;
	margin-bottom: 30px;
}

#total-map {
	display: flex;
    justify-content: center;
    align-items: center;
    margin: 0 auto;
}
</style>
</head>
<body>
	<!-- register.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp"%><!-- Header -->

	<main id="main">
		<h1>${dto.name}</h1>
		<br>
		<h5>${dto.category}</h5>

		<div id="content">

			<div class="detail">
				<div class="img"
					style="background-image: url('/ddstudio/asset/image/${dto.img}');"></div>
				<ul class="infoArea">
					<li class="op1">
						<div class="tableCell">
							<p class="txt1">대표메뉴</p>
							<p class="txt2">${dto.menu}</p>
						</div>
					</li>
					<li class="op2">
						<div class="tableCell">
							<p class="txt1">운영시간</p>
							<p class="txt2">${dto.time}</p>
						</div>
					</li>
					<li class="op3">
						<div class="tableCell">
							<p class="txt1">전화번호</p>
							<p class="txt2">${dto.tel}</p>
						</div>
					</li>
					<li class="op6">
						<div class="tableCell">
							<p class="txt1">수용인원</p>
							<p class="txt2">${dto.capacity}명</p>
						</div>
					</li>
					<c:if test="${closeDTO.restaurant_close_seq != null}">
					<li class="op7">
						<div class="tableCell">
							<p class="txt1">운휴일정</p>
							<p class="txt2">금일 운휴</p>
						</div>
					</li>
					</c:if>
					<c:if test="${closeDTO.restaurant_close_seq == null}">
					<li class="op8">
						<div class="tableCell">
							<p class="txt1">운휴일정</p>
							<p class="txt2">정상 운영</p>
						</div>
					</li>
					</c:if>
				</ul>
			</div>

			<div class="container">
				<p class="sub-title">위치 정보</p>
				<div id="total-map">
					<div>
						<div id="map" style="width: 1125px; height: 380px;"></div>
					</div>
				</div>
				
				
			</div>


		</div>
	</main>

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%><!-- Footer -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae4c975e0553221a835879cdf6246a66"></script>
	<script>
		const container = document.getElementById('map');
		const options = {
			center : new kakao.maps.LatLng(33.3808, 126.5450),
			level : 10,
			draggable : false, // 이동 금지
			disableDoubleClick : true, // 더블클릭 확대 금지
			scrollwheel : false
		// 휠 확대/축소 금지
		};
		
		const map = new kakao.maps.Map(container, options);
		
		const lat = ${dto.lat};
		const lng = ${dto.lng};
		
		const m = new kakao.maps.Marker({
			position: new kakao.maps.LatLng(lat, lng)
		});
		
		m.setMap(map);
	</script>
</body>
</html>