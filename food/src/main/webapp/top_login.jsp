<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.atag {
  background:rgba(255,255,255,0.3);
  text-align:center;
  text-decoration:none;
  float:right;
  outline: none;

 
  display: block;
  width:auto;
  height:auto;
  padding:0.3vh 0.6vh;
  margin-left:5px;
  cursor: pointer;
  font-size: 0.8vw;

  position: relative;
  border: 1.4px solid rgba(255,255,255,0.5);
  transition: all 0.5s ease;
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  -ms-transition: all 0.5s ease;
}
.atag {
    border: 1.4px solid rgb(156, 205, 98);
    color: rgb(156, 205, 98);
  color: rgba(255,255,255,0.5);
  position:relative;
  z-index:999;
}

.atag:hover {
  border-color: #9ccd62;
  color: #9ccd62;
  animation: shakeThatBooty 0.3s linear 1;
  -webkit-animation: shakeThatBooty 0.3s linear 1;
  -moz-animation: shakeThatBooty 0.3s linear 1;
  -o-animation: shakeThatBooty 0.3s linear 1;
  -ms-animation: shakeThatBooty 0.3s linear 1;
}

@keyframes shakeThatBooty {
  33% {
    transform: rotateZ(10deg);
    -webkit-transform: rotateZ(10deg);
    -moz-transform: rotateZ(10deg);
    -o-transform: rotateZ(10deg);
    -ms-transform: rotateZ(10deg);
  }
  67% {
    transform: rotateZ(-10deg);
    -webkit-transform: rotateZ(-10deg);
    -moz-transform: rotateZ(-10deg);
    -o-transform: rotateZ(-10deg);
    -ms-transform: rotateZ(-10deg);
  }
  100% {
    transform: rotateZ(10deg);
    -webkit-transform: rotateZ(10deg);
    -moz-transform: rotateZ(10deg);
    -o-transform: rotateZ(10deg);
    -ms-transform: rotateZ(10deg);
  }
}
</style>
</head>
<body>
<div id="top_login">
	<c:if test="${userid == null}" >
    <a href="login" class="atag">로그인</a>
    <a href="clientjoin" class="atag">회원가입</a> 
    </c:if>

    <c:if test="${userid != null }">
    <a href="#" class="atag">${userid} 님</a> 
    <a href="logout" class="atag">로그아웃</a> 
    <a href="clientmodify" class="atag">정보수정</a>
    </c:if>

</div>
</body>
</html>