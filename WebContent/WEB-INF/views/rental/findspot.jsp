<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ġã��</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${root}resources/css/hammenu.css">
    <link rel="stylesheet" href="${root }resources/css/all.css">
    <title>Ȥ��Ż��-��ġã��</title>

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
                <td>���� ��ġ�� �������� �ֺ��� �ִ� �뿩�Ҹ� ã�ƺ� �� �ֽ��ϴ�.</td>
            </tr>
            <tr>
                <td>�������� �뿩�Ҹ� Ŭ���ϸ� ���� ��ġ�Ǿ��ִ� �����ſ� ����ű������ ����� Ȯ���ϰ�, �뿩�� Ŭ���Ͽ� �뿩�� �� �ֽ��ϴ�.</td>
            </tr>
            <tr>
                <td>1��� 1���� ��� �뿩 �����մϴ�!</td>
            </tr>
        </table>
        <br>
        <div id="spot"></div>
        </div>
    </section>
<jsp:include page="../footer.jsp"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3bbe0fde41f8644b68f7001a6615cb20"></script>
<script>
		var mapContainer = document.getElementById('spot'), // ������ ǥ���� div 
		mapOption = {
			center : new kakao.maps.LatLng(37.57023066954302,
					126.98298102297943), // ������ �߽���ǥ
			level : 6
		// ������ Ȯ�� ����
		};

		var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';

		var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

		// ��Ŀ�� ǥ���� ��ġ�Դϴ� 
		var position = [
				new kakao.maps.LatLng(37.57023066954302, 126.98298102297943),//����0
				new kakao.maps.LatLng(37.56513005283353, 126.9771699794345),//��û1
				new kakao.maps.LatLng(37.566320388101474, 126.9832592276628),//�������Ա���2
				new kakao.maps.LatLng(37.570303659139, 126.99135183826469),//����3����3
				new kakao.maps.LatLng(37.569752204537984, 126.97739495869627),//��ȭ����5���ⱸ4
				new kakao.maps.LatLng(37.5665105295552, 126.99224647854484),//������3����5
				new kakao.maps.LatLng(37.57048357495338, 126.98809742940996),//ž�����6
				new kakao.maps.LatLng(37.56609178635681, 126.96725994894827),//���빮��7
				new kakao.maps.LatLng(37.5661951432389, 127.00830811788836),//���빮ddp8
				new kakao.maps.LatLng(37.571105527303416, 127.00888596825268),//���빮��9
				new kakao.maps.LatLng(37.57335707393911, 127.01735362979929),//������10
				new kakao.maps.LatLng(37.5651717483914, 127.01579539492823),//�Ŵ翪11
				new kakao.maps.LatLng(37.56422673583903, 126.99766269590778),//�߱�û12
				new kakao.maps.LatLng(37.56123524296285, 126.99299968630292),//�湫�ο�13
				new kakao.maps.LatLng(37.56105887629906, 126.98558629189921),//����14
				new kakao.maps.LatLng(37.56194566171278, 126.9807079257182),//ȭ��ڹ���15
				new kakao.maps.LatLng(37.56031393425954, 126.97570575873863),//���ʹ�16
				new kakao.maps.LatLng(37.55883869809023, 127.00487233391102),//�����Ա���17
				new kakao.maps.LatLng(37.57579327352522, 126.9768667334368),//��ȭ��18
				new kakao.maps.LatLng(37.576195448242856, 126.98437208399031),//�ȱ���19
				new kakao.maps.LatLng(37.55322692052593 , 126.97264681098265),//���￪20
				new kakao.maps.LatLng(37.53571181220532, 126.97405618935225 ),//�ﰢ����21
				new kakao.maps.LatLng(37.522449167370084 , 126.97451327639432 ),//���̿�22
				new kakao.maps.LatLng(37.565767223120304 , 126.96653002217369 ),//���빮��23
				new kakao.maps.LatLng(37.56592948517653 , 126.90196683316333 ),//������û24
				new kakao.maps.LatLng(37.549072038689395 , 126.9137805708561 ),//������25
				new kakao.maps.LatLng(37.53928823210451 , 126.945858238427 ),//������26
				new kakao.maps.LatLng(37.51991060947181 , 126.98935543960984 ),//������27
				new kakao.maps.LatLng(37.52938935612207 , 127.00810039274859 ),//�ѳ���28
				new kakao.maps.LatLng(37.5402542809069 , 127.01833036329361 ),//������29
				new kakao.maps.LatLng(37.56342363953144 , 127.03680789917406 ),//������û30
				new kakao.maps.LatLng(37.56121655600471 , 127.03564103794972 ),//�սʸ���31
				new kakao.maps.LatLng(37.567409348056295 , 127.05197751400343 ),//��ʸ���32
				new kakao.maps.LatLng(37.5805125728894 , 127.04527319306068 ),//û������33
				new kakao.maps.LatLng(37.58548410328754 , 127.0195868552806 ),//������34
				new kakao.maps.LatLng(37.58220609629965 , 127.00196992104074),//��ȭ��35
				new kakao.maps.LatLng(37.57944808832623 , 127.01523802244368 ),//â�ſ�36
				new kakao.maps.LatLng(37.568930756573934 , 126.91481038687917 ),//���¿�37
				new kakao.maps.LatLng(37.55855871362669 , 126.92582310183269 ),//ȫ���Ա�38
				new kakao.maps.LatLng(37.60310548566961 , 126.9284967851399 ) //����û39
		];
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png', // ��Ŀ�̹����� �ּ��Դϴ�    
		imageSize = new kakao.maps.Size(65, 60), // ��Ŀ�̹����� ũ���Դϴ�
		imageOption = {
			spriteOrigin : new kakao.maps.Point(10, 72),
			spriteSize : new kakao.maps.Size(36, 98)
		}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.

		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
				imageOption);

		// ��Ŀ�� �����մϴ�
		var marker = [ new kakao.maps.Marker({
			position : position[0],
			clickable : true,
			image : markerImage
		// ��Ŀ�̹��� ���� 
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

		// �Ʒ� �ڵ�� ���� ��Ŀ�� �����ϴ� �ڵ忡�� clickable: true �� ����
		// ��Ŀ�� Ŭ������ �� ������ Ŭ�� �̺�Ʈ�� �߻����� �ʵ��� �����մϴ�
		// marker.setClickable(true);

		// ��Ŀ�� ������ ǥ���մϴ�.
		for (var i = 0; i < marker.length; i++) {
			marker[i].setMap(map);
		}
		var iwContent=new Array();
		<c:forEach var="rentaloffice" items="${rentaloffices }" varStatus="devidx">
			iwContent.push('<div id="info">${rentaloffice.renoff_name } �뿩��<br>������ ${rentaloffice.renoff_bic}��<br>ű���� ${rentaloffice.renoff_kick}��<br><form action="/" name="renT" mehtod="post"><input type="hidden" name="renoff_num" value="${rentaloffice.renoff_num}"/><button type="button" onclick="winOpen()">�뿩�ϱ�</button></form></div>');
		
		</c:forEach>
		
		//��Ŀ�� Ŭ������ �� ��Ŀ ���� ǥ���� ���������츦 �����մϴ�
		iwRemoveable = true; // removeable �Ӽ��� ture �� �����ϸ� ���������츦 ���� �� �ִ� x��ư�� ǥ�õ˴ϴ�

		// ���������츦 �����մϴ�
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

		// ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
		kakao.maps.event.addListener(marker[0], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[0].open(map, marker[0]);
		});
		kakao.maps.event.addListener(marker[1], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[1].open(map, marker[1]);
		});
		kakao.maps.event.addListener(marker[2], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[2].open(map, marker[2]);
		});
		kakao.maps.event.addListener(marker[3], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[3].open(map, marker[3]);
		});
		kakao.maps.event.addListener(marker[4], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[4].open(map, marker[4]);
		});
		kakao.maps.event.addListener(marker[5], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[5].open(map, marker[5]);
		});
		kakao.maps.event.addListener(marker[6], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[6].open(map, marker[6]);
		});
		kakao.maps.event.addListener(marker[7], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[7].open(map, marker[7]);
		});
		kakao.maps.event.addListener(marker[8], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[8].open(map, marker[8]);
		});
		kakao.maps.event.addListener(marker[9], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[9].open(map, marker[9]);
		});
		kakao.maps.event.addListener(marker[10], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[10].open(map, marker[10]);
		});
		kakao.maps.event.addListener(marker[11], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[11].open(map, marker[11]);
		});
		kakao.maps.event.addListener(marker[12], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[12].open(map, marker[12]);
		});
		kakao.maps.event.addListener(marker[13], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[13].open(map, marker[13]);
		});
		kakao.maps.event.addListener(marker[14], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[14].open(map, marker[14]);
		});
		kakao.maps.event.addListener(marker[15], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[15].open(map, marker[15]);
		});
		kakao.maps.event.addListener(marker[16], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[16].open(map, marker[16]);
		});
		kakao.maps.event.addListener(marker[17], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[17].open(map, marker[17]);
		});
		kakao.maps.event.addListener(marker[18], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[18].open(map, marker[18]);
		});
		kakao.maps.event.addListener(marker[19], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[19].open(map, marker[19]);
		});
		kakao.maps.event.addListener(marker[20], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[20].open(map, marker[20]);
		});
		kakao.maps.event.addListener(marker[21], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[21].open(map, marker[21]);
		});
		kakao.maps.event.addListener(marker[22], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[22].open(map, marker[22]);
		});
		kakao.maps.event.addListener(marker[23], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[23].open(map, marker[23]);
		});
		kakao.maps.event.addListener(marker[24], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[24].open(map, marker[24]);
		});
		kakao.maps.event.addListener(marker[25], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[25].open(map, marker[25]);
		});
		kakao.maps.event.addListener(marker[26], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[26].open(map, marker[26]);
		});
		kakao.maps.event.addListener(marker[27], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[27].open(map, marker[27]);
		});
		kakao.maps.event.addListener(marker[28], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[28].open(map, marker[28]);
		});
		kakao.maps.event.addListener(marker[29], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[29].open(map, marker[29]);
		});
		kakao.maps.event.addListener(marker[30], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[30].open(map, marker[30]);
		});
		kakao.maps.event.addListener(marker[31], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[31].open(map, marker[31]);
		});
		kakao.maps.event.addListener(marker[32], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[32].open(map, marker[32]);
		});
		kakao.maps.event.addListener(marker[33], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[33].open(map, marker[33]);
		});
		kakao.maps.event.addListener(marker[34], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[34].open(map, marker[34]);
		});
		kakao.maps.event.addListener(marker[35], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[35].open(map, marker[35]);
		});
		kakao.maps.event.addListener(marker[36], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[36].open(map, marker[36]);
		});
		kakao.maps.event.addListener(marker[37], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[37].open(map, marker[37]);
		});
		kakao.maps.event.addListener(marker[38], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[38].open(map, marker[38]);
		});
		kakao.maps.event.addListener(marker[39], 'click', function() {
			// ��Ŀ ���� ���������츦 ǥ���մϴ�
			infowindow[39].open(map, marker[39]);
		});

		function panToJonggak() {
			// �̵��� ���� �浵 ��ġ�� �����մϴ� 
			var moveLatLon = new kakao.maps.LatLng(37.57023066954302,
					126.98298102297943);

			// ���� �߽��� �ε巴�� �̵���ŵ�ϴ�
			// ���� �̵��� �Ÿ��� ���� ȭ�麸�� ũ�� �ε巯�� ȿ�� ���� �̵��մϴ�
			map.panTo(moveLatLon);
		}
		function panToCityhall() {
			// �̵��� ���� �浵 ��ġ�� �����մϴ� 
			var moveLatLon = new kakao.maps.LatLng(37.56513005283353,
					126.9771699794345);

			// ���� �߽��� �ε巴�� �̵���ŵ�ϴ�
			// ���� �̵��� �Ÿ��� ���� ȭ�麸�� ũ�� �ε巯�� ȿ�� ���� �̵��մϴ�
			map.panTo(moveLatLon);
		}
		//HTML5�� geolocation���� ����� �� �ִ��� Ȯ���մϴ� 
		if (navigator.geolocation) {

			// GeoLocation�� �̿��ؼ� ���� ��ġ�� ���ɴϴ�
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // ����
				lon = position.coords.longitude; // �浵

				var locPosition = new kakao.maps.LatLng(lat, lon), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�
				message = '<div style="padding:5px;" >�� ��ġ</div>'; // ���������쿡 ǥ�õ� �����Դϴ�

				// ��Ŀ�� ���������츦 ǥ���մϴ�
				displayMarker(locPosition, message);

			});

		} else { // HTML5�� GeoLocation�� ����� �� ������ ��Ŀ ǥ�� ��ġ�� ���������� ������ �����մϴ�

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation�� ����Ҽ� �����..'

			displayMarker(locPosition, message);
		}

		// ������ ��Ŀ�� ���������츦 ǥ���ϴ� �Լ��Դϴ�
		function displayMarker(locPosition, message) {

			// ��Ŀ�� �����մϴ�
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});

			var iwContent = message, // ���������쿡 ǥ���� ����
			iwRemoveable = true;

			// ���������츦 �����մϴ�
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			// ���������츦 ��Ŀ���� ǥ���մϴ� 
			infowindow.open(map, marker);

			// ���� �߽���ǥ�� ������ġ�� �����մϴ�
			map.setCenter(locPosition);
		}
	</script>

<script type="text/javascript">
//�˾�â ����
function winOpen(){
	var winCre=window.open('about:blank','�뿩','width=800,height=800,left=100,top=100');
	var frm=document.renT;
	frm.action='/apes_project/rental/rentalpop';
	frm.target="�뿩";
	frm.submit();	
}
</script>
</body>
</html>