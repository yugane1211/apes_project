<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
          <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${root }resources/css/all.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

</head>
<body>


<script>
    $(document).ready(function () {
    window.resizeTo(950,740);
    var IMP = window.IMP; // 생략가능
    IMP.init('imp31492457');
    // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
    IMP.request_pay({
    pg: 'html5_inicis', // version 1.1.0부터 지원.
    /*
    'kakao':카카오페이,
    html5_inicis':이니시스(웹표준결제)
    'nice':나이스페이
    'jtnet':제이티넷
    'uplus':LG유플러스
    'danal':다날
    'payco':페이코
    'syrup':시럽페이
    'paypal':페이팔
    */
    pay_method: 'card',
    /*
    'samsung':삼성페이,
    'card':신용카드,
    'trans':실시간계좌이체,
    'vbank':가상계좌,
    'phone':휴대폰소액결제
    */
    merchant_uid: 'merchant_' + new Date().getTime(),
    /*
    merchant_uid에 경우
    https://docs.iamport.kr/implementation/payment
    위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
    참고하세요.
    나중에 포스팅 해볼게요.
    */
    name: '[혹성탈출] 추가요금 결제',
    //결제창에서 보여질 이름
    amount: ${amount},
    //가격
    buyer_email: '${sessionScope.userlogin.user_id}',
    buyer_name: '${sessionScope.userlogin.user_nickname}',
    buyer_tel: '${sessionScope.userlogin.user_phone}',
    buyer_addr: '서울특별시 강남구 삼성동',
    buyer_postcode: '123-456',
    m_redirect_url: 'https://www.yourdomain.com/payments/complete'
    /*
    모바일 결제시,
    결제가 끝나고 랜딩되는 URL을 지정
    (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
    */
    }, function (rsp) {
    console.log(rsp);
    if (rsp.success) {
    var msg = '결제가 완료되었습니다.';
    alert(msg);
   /* msg += '고유ID : ' + rsp.imp_uid;
    msg += '상점 거래ID : ' + rsp.merchant_uid;
    msg += '결제 금액 : ' + rsp.paid_amount;
    msg += '카드 승인번호 : ' + rsp.apply_num;*/
    location.href="${root}user/returnComplete?kind=${kind}&bike_num=${rented.bic_num}&kick_num=${rented.kick_num}&k_rental_num=${rented.rental_num}&b_rental_num=${rented.rental_num}&renoff_num=${rented.renoff_num}";
    } else {
    var msg = '결제에 실패하였습니다.';
    msg += '에러내용 : ' + rsp.error_msg;
    alert(msg);
    location.href="${root}user/proc_fail";
    }
    
    });
    });
    </script>

</body>
</html>