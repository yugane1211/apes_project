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
    var IMP = window.IMP; // ��������
    IMP.init('imp31492457');
    // 'iamport' ��� �ο����� "������ �ĺ��ڵ�"�� ���
    // i'mport ������ ������ -> ������ -> �������ĺ��ڵ�
    IMP.request_pay({
    pg: 'html5_inicis', // version 1.1.0���� ����.
    /*
    'kakao':īī������,
    html5_inicis':�̴Ͻý�(��ǥ�ذ���)
    'nice':���̽�����
    'jtnet':����Ƽ��
    'uplus':LG���÷���
    'danal':�ٳ�
    'payco':������
    'syrup':�÷�����
    'paypal':������
    */
    pay_method: 'card',
    /*
    'samsung':�Ｚ����,
    'card':�ſ�ī��,
    'trans':�ǽð�������ü,
    'vbank':�������,
    'phone':�޴����Ҿװ���
    */
    merchant_uid: 'merchant_' + new Date().getTime(),
    /*
    merchant_uid�� ���
    https://docs.iamport.kr/implementation/payment
    ���� url�� ���󰡽ø� ���� �� �ִ� ����� �ֽ��ϴ�.
    �����ϼ���.
    ���߿� ������ �غ��Կ�.
    */
    name: '[Ȥ��Ż��] �߰���� ����',
    //����â���� ������ �̸�
    amount: ${amount},
    //����
    buyer_email: '${sessionScope.userlogin.user_id}',
    buyer_name: '${sessionScope.userlogin.user_nickname}',
    buyer_tel: '${sessionScope.userlogin.user_phone}',
    buyer_addr: '����Ư���� ������ �Ｚ��',
    buyer_postcode: '123-456',
    m_redirect_url: 'https://www.yourdomain.com/payments/complete'
    /*
    ����� ������,
    ������ ������ �����Ǵ� URL�� ����
    (īī������, ������, �ٳ��� ���� �ʿ����. PC�� ���������� callback�Լ��� ����� ������)
    */
    }, function (rsp) {
    console.log(rsp);
    if (rsp.success) {
    var msg = '������ �Ϸ�Ǿ����ϴ�.';
    alert(msg);
   /* msg += '����ID : ' + rsp.imp_uid;
    msg += '���� �ŷ�ID : ' + rsp.merchant_uid;
    msg += '���� �ݾ� : ' + rsp.paid_amount;
    msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;*/
    location.href="${root}user/returnComplete?kind=${kind}&bike_num=${rented.bic_num}&kick_num=${rented.kick_num}&k_rental_num=${rented.rental_num}&b_rental_num=${rented.rental_num}&renoff_num=${rented.renoff_num}";
    } else {
    var msg = '������ �����Ͽ����ϴ�.';
    msg += '�������� : ' + rsp.error_msg;
    alert(msg);
    location.href="${root}user/proc_fail";
    }
    
    });
    });
    </script>

</body>
</html>