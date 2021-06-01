<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>위치찾기</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${root}resources/css/hammenu.css">
    <link rel="stylesheet" href="${root }resources/css/all.css">
    <title>혹성탈출-위치찾기</title>

    <style>
        #spot{width: 1200px; height: 460px; margin-left: 7%; background-color: white;}
        table{margin-left: 12%;}
        td{width: 1200px;}
        .main{position: relative; top: 12%; left: 10%; margin: -150px 0 0 -150px;}
        #info{
        	color: rgb(55, 58, 54); font-family: 'Noto Sans KR', sans-serif;
			align-items: center;
			line-height: 40px;
			font-weight: bold;
			padding-left:15px;
			padding-right:50px;

        }
        #info button{
        align-content:center;
        background-color: rgb(55, 58, 54);
	    color: rgb(234, 170, 0);

	    font-size: 15px;
	    border-radius: 3px;
	    font-weight: bold; width: 80px; height: 30px;
	    border-color: rgb(55, 58, 54);
	    left:20%;
        }
    </style>

</head>
<body>
<script type="text/javascript">
</script>







       <c:set var="url" value="/rental/findspot"/>
       <br>
        <header style="height:130px;">
       <jsp:include page="../hammenu.jsp">
       		<jsp:param value="${url }" name="url"/>
       </jsp:include>
        </header>
  <section style="height:700px;">
        <div class="main">
        <br>
        <table id="fontc">
            <tr>
                <td>현재 위치를 기준으로 주변에 있는 대여소를 찾아볼 수 있습니다.</td>
            </tr>
            <tr>
                <td>지도에서 대여소를 클릭하면 현재 배치되어있는 자전거와 전동킥보드의 대수를 확인하고, 대여를 클릭하여 대여할 수 있습니다.</td>
            </tr>
            <tr>
                <td>1명당 1대의 장비만 대여 가능합니다!</td>
            </tr>
        </table>
        <br>
        <div id="spot"></div>
        </div>
    </section>
<jsp:include page="../footer.jsp"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3bbe0fde41f8644b68f7001a6615cb20"></script>
<script>
		var mapContainer = document.getElementById('spot'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.57023066954302,
					126.98298102297943), // 지도의 중심좌표
			level : 6
		// 지도의 확대 레벨
		};

		var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커를 표시할 위치입니다 
		var position = [
				new kakao.maps.LatLng(37.57023066954302, 126.98298102297943),//종각0
				new kakao.maps.LatLng(37.56513005283353, 126.9771699794345),//시청1
				new kakao.maps.LatLng(37.566320388101474, 126.9832592276628),//을지로입구역2
				new kakao.maps.LatLng(37.570303659139, 126.99135183826469),//종로3가역3
				new kakao.maps.LatLng(37.569752204537984, 126.97739495869627),//광화문역5번출구4
				new kakao.maps.LatLng(37.5665105295552, 126.99224647854484),//을지로3가역5
				new kakao.maps.LatLng(37.57048357495338, 126.98809742940996),//탑골공원6
				new kakao.maps.LatLng(37.56609178635681, 126.96725994894827),//서대문역7
				new kakao.maps.LatLng(37.5661951432389, 127.00830811788836),//동대문ddp8
				new kakao.maps.LatLng(37.571105527303416, 127.00888596825268),//동대문역9
				new kakao.maps.LatLng(37.57335707393911, 127.01735362979929),//동묘앞10
				new kakao.maps.LatLng(37.5651717483914, 127.01579539492823),//신당역11
				new kakao.maps.LatLng(37.56422673583903, 126.99766269590778),//중구청12
				new kakao.maps.LatLng(37.56123524296285, 126.99299968630292),//충무로역13
				new kakao.maps.LatLng(37.56105887629906, 126.98558629189921),//명동역14
				new kakao.maps.LatLng(37.56194566171278, 126.9807079257182),//화폐박물관15
				new kakao.maps.LatLng(37.56031393425954, 126.97570575873863),//숭례문16
				new kakao.maps.LatLng(37.55883869809023, 127.00487233391102),//동대입구역17
				new kakao.maps.LatLng(37.57579327352522, 126.9768667334368),//광화문18
				new kakao.maps.LatLng(37.576195448242856, 126.98437208399031),//안국역19
				new kakao.maps.LatLng(37.55322692052593 , 126.97264681098265),//서울역20
				new kakao.maps.LatLng(37.53571181220532, 126.97405618935225 ),//삼각지역21
				new kakao.maps.LatLng(37.522449167370084 , 126.97451327639432 ),//이촌역22
				new kakao.maps.LatLng(37.565767223120304 , 126.96653002217369 ),//서대문역23
				new kakao.maps.LatLng(37.56592948517653 , 126.90196683316333 ),//마포구청24
				new kakao.maps.LatLng(37.549072038689395 , 126.9137805708561 ),//합정역25
				new kakao.maps.LatLng(37.53928823210451 , 126.945858238427 ),//마포역26
				new kakao.maps.LatLng(37.51991060947181 , 126.98935543960984 ),//서빙고역27
				new kakao.maps.LatLng(37.52938935612207 , 127.00810039274859 ),//한남역28
				new kakao.maps.LatLng(37.5402542809069 , 127.01833036329361 ),//옥수역29
				new kakao.maps.LatLng(37.56342363953144 , 127.03680789917406 ),//성동구청30
				new kakao.maps.LatLng(37.56121655600471 , 127.03564103794972 ),//왕십리역31
				new kakao.maps.LatLng(37.567409348056295 , 127.05197751400343 ),//답십리역32
				new kakao.maps.LatLng(37.5805125728894 , 127.04527319306068 ),//청량리역33
				new kakao.maps.LatLng(37.58548410328754 , 127.0195868552806 ),//보문역34
				new kakao.maps.LatLng(37.58220609629965 , 127.00196992104074),//혜화역35
				new kakao.maps.LatLng(37.57944808832623 , 127.01523802244368 ),//창신역36
				new kakao.maps.LatLng(37.568930756573934 , 126.91481038687917 ),//가좌역37
				new kakao.maps.LatLng(37.55855871362669 , 126.92582310183269 ),//홍대입구38
				new kakao.maps.LatLng(37.60310548566961 , 126.9284967851399 ) //은평구청39
		];
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png', // 마커이미지의 주소입니다    
		imageSize = new kakao.maps.Size(65, 60), // 마커이미지의 크기입니다
		imageOption = {
			spriteOrigin : new kakao.maps.Point(10, 72),
			spriteSize : new kakao.maps.Size(36, 98)
		}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
				imageOption);

		// 마커를 생성합니다
		var marker = [ new kakao.maps.Marker({
			position : position[0],
			clickable : true,
			image : markerImage
		// 마커이미지 설정 
		}), new kakao.maps.Marker({
			position : position[1],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[2],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[3],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[4],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[5],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[6],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[7],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[8],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[9],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[10],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[11],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[12],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[13],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[14],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[15],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[16],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[17],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[18],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[19],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[20],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[21],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[22],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[23],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[24],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[25],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[26],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[27],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[28],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[29],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[30],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[31],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[32],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[33],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[34],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[35],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[36],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[37],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[38],
			clickable : true,
			image : markerImage
		}), new kakao.maps.Marker({
			position : position[39],
			clickable : true,
			image : markerImage
		})];

		// 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
		// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
		// marker.setClickable(true);

		// 마커를 지도에 표시합니다.
		for (var i = 0; i < marker.length; i++) {
			marker[i].setMap(map);
		}
		var iwContent=new Array();
		<c:forEach var="rentaloffice" items="${rentaloffices }" varStatus="devidx">
			iwContent.push('<div id="info">${rentaloffice.renoff_name } 대여소<br>자전거 ${rentaloffice.renoff_bic}대<br>킥보드 ${rentaloffice.renoff_kick}대<br><form action="/" name="renT" mehtod="post"><input type="hidden" name="renoff_num" value="${rentaloffice.renoff_num}"/><button type="button" onclick="winOpen()">대여하기</button></form></div>');
		
		</c:forEach>
		
		//마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
		iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

		// 인포윈도우를 생성합니다
		var infowindow = [ new kakao.maps.InfoWindow({
			content : iwContent[0],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[1],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[2],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[3],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[4],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[5],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[6],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[7],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[8],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[9],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[10],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[11],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[12],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[13],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[14],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[15],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[16],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[17],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[18],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[19],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[20],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[21],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[22],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[23],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[24],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[25],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[26],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[27],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[28],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[29],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[30],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[31],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[32],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[33],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[34],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[35],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[36],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[37],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[38],
			removable : iwRemoveable
		}), new kakao.maps.InfoWindow({
			content : iwContent[39],
			removable : iwRemoveable
		})];

		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker[0], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[0].open(map, marker[0]);
		});
		kakao.maps.event.addListener(marker[1], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[1].open(map, marker[1]);
		});
		kakao.maps.event.addListener(marker[2], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[2].open(map, marker[2]);
		});
		kakao.maps.event.addListener(marker[3], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[3].open(map, marker[3]);
		});
		kakao.maps.event.addListener(marker[4], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[4].open(map, marker[4]);
		});
		kakao.maps.event.addListener(marker[5], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[5].open(map, marker[5]);
		});
		kakao.maps.event.addListener(marker[6], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[6].open(map, marker[6]);
		});
		kakao.maps.event.addListener(marker[7], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[7].open(map, marker[7]);
		});
		kakao.maps.event.addListener(marker[8], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[8].open(map, marker[8]);
		});
		kakao.maps.event.addListener(marker[9], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[9].open(map, marker[9]);
		});
		kakao.maps.event.addListener(marker[10], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[10].open(map, marker[10]);
		});
		kakao.maps.event.addListener(marker[11], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[11].open(map, marker[11]);
		});
		kakao.maps.event.addListener(marker[12], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[12].open(map, marker[12]);
		});
		kakao.maps.event.addListener(marker[13], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[13].open(map, marker[13]);
		});
		kakao.maps.event.addListener(marker[14], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[14].open(map, marker[14]);
		});
		kakao.maps.event.addListener(marker[15], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[15].open(map, marker[15]);
		});
		kakao.maps.event.addListener(marker[16], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[16].open(map, marker[16]);
		});
		kakao.maps.event.addListener(marker[17], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[17].open(map, marker[17]);
		});
		kakao.maps.event.addListener(marker[18], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[18].open(map, marker[18]);
		});
		kakao.maps.event.addListener(marker[19], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[19].open(map, marker[19]);
		});
		kakao.maps.event.addListener(marker[20], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[20].open(map, marker[20]);
		});
		kakao.maps.event.addListener(marker[21], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[21].open(map, marker[21]);
		});
		kakao.maps.event.addListener(marker[22], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[22].open(map, marker[22]);
		});
		kakao.maps.event.addListener(marker[23], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[23].open(map, marker[23]);
		});
		kakao.maps.event.addListener(marker[24], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[24].open(map, marker[24]);
		});
		kakao.maps.event.addListener(marker[25], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[25].open(map, marker[25]);
		});
		kakao.maps.event.addListener(marker[26], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[26].open(map, marker[26]);
		});
		kakao.maps.event.addListener(marker[27], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[27].open(map, marker[27]);
		});
		kakao.maps.event.addListener(marker[28], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[28].open(map, marker[28]);
		});
		kakao.maps.event.addListener(marker[29], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[29].open(map, marker[29]);
		});
		kakao.maps.event.addListener(marker[30], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[30].open(map, marker[30]);
		});
		kakao.maps.event.addListener(marker[31], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[31].open(map, marker[31]);
		});
		kakao.maps.event.addListener(marker[32], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[32].open(map, marker[32]);
		});
		kakao.maps.event.addListener(marker[33], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[33].open(map, marker[33]);
		});
		kakao.maps.event.addListener(marker[34], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[34].open(map, marker[34]);
		});
		kakao.maps.event.addListener(marker[35], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[35].open(map, marker[35]);
		});
		kakao.maps.event.addListener(marker[36], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[36].open(map, marker[36]);
		});
		kakao.maps.event.addListener(marker[37], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[37].open(map, marker[37]);
		});
		kakao.maps.event.addListener(marker[38], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[38].open(map, marker[38]);
		});
		kakao.maps.event.addListener(marker[39], 'click', function() {
			// 마커 위에 인포윈도우를 표시합니다
			infowindow[39].open(map, marker[39]);
		});

		function panToJonggak() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(37.57023066954302,
					126.98298102297943);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}
		function panToCityhall() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(37.56513005283353,
					126.9771699794345);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}
		//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;" >현 위치</div>'; // 인포윈도우에 표시될 내용입니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);

			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});

			var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			// 인포윈도우를 마커위에 표시합니다 
			infowindow.open(map, marker);

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		}
	</script>

<script type="text/javascript">
//팝업창 생성
function winOpen(){
	var winCre=window.open('about:blank','대여','width=800,height=800,left=100,top=100');
	var frm=document.renT;
	frm.action='/apes_project/rental/rentalpop';
	frm.target="대여";
	frm.submit();	
}
</script>
</body>
</html>