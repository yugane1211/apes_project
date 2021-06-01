<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
  .site-footer
{
  background-color: rgb(55, 58, 54);
  padding-top:10px;
  padding-bottom:1px;
  padding-left:10px;
  font-size:15px;
  line-height:24px;
  color:rgb(255, 198, 88);
  position:relative;
  width:inherit;
  height:175px;
}
.site-footer hr
{
  border-top-color:#bbb;
  opacity:1;
}
.site-footer hr.small
{
  margin:20px 0
}
.site-footer h6
{
  color:#fff;
  font-size:16px;
  text-transform:uppercase;
  margin-top:5px;
  letter-spacing:2px
}
.site-footer a
{
  color:#737373;
}
.site-footer a:hover
{
  color:#3366cc;
  text-decoration:none;
}
.footer-links
{
  padding-left:0;
  list-style:none;
}
.footer-links li
{
  display:block;
}
.footer-links a
{
  color:#737373
}
.footer-links a:active,.footer-links a:focus,.footer-links a:hover
{
  color:#3366cc;
  text-decoration:none;
}
.footer-links.inline li
{
  display:inline-block;
}
.site-footer .social-icons
{
  text-align:right
}
.site-footer .social-icons a
{
  width:40px;
  height:40px;
  line-height:40px;
  margin-left:6px;
  margin-right:0;
  border-radius:100%;
  background-color:#33353d
}
.copyright-text
{
  margin:0
}
@media (max-width:991px)
{
  .site-footer [class^=col-]
  {
    margin-bottom:30px
  }
}
@media (max-width:767px)
{
  .site-footer
  {
    padding-bottom:0
    
  }
  .site-footer .copyright-text,.site-footer .social-icons
  {
    text-align:center
  }
}
.social-icons
{
  padding-left:0;
  margin-bottom:0;
  list-style:none;
  display:inline-block;
  
}
.social-icons li
{
  display:inline-block;
  margin-bottom:4px;
  margin-left:30px;
  position : absolute;
}
.social-icons li:first-of-type{
  bottom:40%;
  right:15%;
}
.social-icons li:last-of-type{
  bottom:40%;
  right:10%;
}

.social-icons li.title
{
  margin-right:15px;
  text-transform:uppercase;
  color:#96a2b2;
  font-weight:700;
  font-size:13px
}
.social-icons a{
  background-color:#eceeef;
  color:#818a91;
  font-size:16px;
  display:inline-block;
  line-height:44px;
  width:44px;
  height:44px;
  text-align:center;
  margin-right:8px;
  border-radius:100%;
  -webkit-transition:all .2s linear;
  -o-transition:all .2s linear;
  transition:all .2s linear
}
.social-icons a:active,.social-icons a:focus,.social-icons a:hover
{
  color:#fff;
  background-color:#29aafe
}
.social-icons.size-sm a
{
  line-height:34px;
  height:34px;
  width:34px;
  font-size:14px
}
.social-icons a.facebook:hover
{
  background-color:#3b5998
}
.social-icons a.instargram:hover
{
  background-color:#00aced
}
.facebook{
  background-size: contain;
}
.instargram{
  background-size: contain;
  bottom:10%;
  right:10%;
}
@media (max-width:767px)
{
  .social-icons li.title
  {
    display:inline-block;
    margin-right:0;
    font-weight:600
  }
}
.row{
	display:inline-block;
}

</style>
</head>
<body>
	   <!-- Site footer -->
   <footer class="site-footer">
    <div class="container">
      <div class="row">
        <div class="col-sm-12 col-md-6">
          <h6>About</h6>
          <p class="text-justify"><i>Online rent service </i>서울특별시 종로구 관철동 13-13 10층 1014호 혹성탈출</p>
        </div>
      </div>
      <hr>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-md-8 col-sm-6 col-xs-12">
          <p class="copyright-text">Copyright &copy; 2021 All Rights Reserved by Apes.
          </p>
        </div>

        <div class="col-md-4 col-sm-6 col-xs-12">
          <ul class="social-icons">
            <li><a class="facebook" href="https://facebook.com/groups/324682819070316" target="_black" style="background-image: url(${root }resources/images/facebook.png)"><i class="fa fa-facebook"></i></a></li>
            <li><a class="instargram" href="https://www.instagram.com/apess_2021" target="_black" style="background-image: url(${root }resources/images/instar3.png)"><i class="fa fa-instagram"></i></a></li>
          </ul>
        </div>
      </div>
    </div>
</footer>




</body>
</html>