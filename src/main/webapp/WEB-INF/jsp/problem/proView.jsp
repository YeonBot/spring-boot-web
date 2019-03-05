<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%
    pageContext.setAttribute("rn", "\n");
    pageContext.setAttribute("br", "<br>");
%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Clean Blog - Start Bootstrap Theme</title>

    <!-- Bootstrap core CSS-->
    <link href="/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet'
          type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
          rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="/css/clean-blog.css" rel="stylesheet">

</head>
<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="/">Spring Online Judge</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/about.html">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/problem/problemset">문제</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/board/list">게시판</a>
                </li>
                <sec:authorize access="isAnonymous()">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown nav-item"><a style="text-decoration:none;" href="#" class="dropdown-toggle"
                                                         data-toggle="dropdown" role="button" aria-haspopup="true"
                                                         aria-expanded="false">회원 관리<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a style="color:black;text-decoration:none;" href="/security/login"> 로그인</a></li>
                                <li><a style="color:black;text-decoration:none;" href="/security/signUp"> 회원가입</a></li>
                            </ul></li>
                    </ul>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown nav-item"><a style="text-decoration:none;" href="#" class="dropdown-toggle"
                                                         data-toggle="dropdown" role="button" aria-haspopup="true"
                                                         aria-expanded="false">회원 관리<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a style="color:black;text-decoration:none;" href="/security/#"> 정보수정</a></li>
                                <li><a style="color:black;text-decoration:none;" href="/logout"> 로그아웃</a></li>
                            </ul></li>
                    </ul>
                </sec:authorize>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Header -->
<header class="masthead" style="background-image: url('/img/home-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <div class="site-heading">
                    <h1>Clean Blog</h1>
                    <span class="subheading">A Blog Theme by Start Bootstrap</span>
                </div>
            </div>
        </div>
    </div>
</header>

<div class="container">
<br>
    <nav class="navbar navbar-expand-md bg-light">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link"  href="/problem/proView/${problem.proNo}"> ${problem.proNo}번</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/problem/submit/${problem.proNo}">제출</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
        </ul>
    </nav>
</div>

<!-- Main Content -->
<div class="container">
    <div class="page-header">
        <h2>문제</h2>
        <h5>
            No.<span id="board_bno">${problem.proNo}</span>
            &nbsp;&nbsp;
            <span class="h-normal">문제 제목 : ${problem.proName}</span>
        </h5>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            &nbsp;&nbsp; 문제
        </div>
        <!-- DB는 엔터를 줄바꿈으로 인식X 따로 처리 -->
        <div class="panel-body">
                ${problem.proContents}
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            &nbsp;&nbsp; 입력
        </div>
        <!-- DB는 엔터를 줄바꿈으로 인식X 따로 처리 -->
        <div class="panel-body">
                ${problem.proInput}
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            &nbsp;&nbsp; 출력
        </div>
        <!-- DB는 엔터를 줄바꿈으로 인식X 따로 처리 -->
        <div id=post_contents class="panel-body">

                ${problem.proOutput}
        </div>
    </div>
</div>



<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <ul class="list-inline text-center">
                    <li class="list-inline-item">
                        <a href="#">
                  <span class="fa-stack fa-lg">
                    <i class="fas fa-circle fa-stack-2x"></i>
                    <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                  </span>
                        </a>
                    </li>
                    <li class="list-inline-item">
                        <a href="#">
                  <span class="fa-stack fa-lg">
                    <i class="fas fa-circle fa-stack-2x"></i>
                    <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                  </span>
                        </a>
                    </li>
                    <li class="list-inline-item">
                        <a href="#">
                  <span class="fa-stack fa-lg">
                    <i class="fas fa-circle fa-stack-2x"></i>
                    <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                  </span>
                        </a>
                    </li>
                </ul>
                <p class="copyright text-muted">Copyright &copy; Your Website 2018</p>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap core JavaScript -->
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Custom scripts for this template -->
<script src="/js/clean-blog.min.js"></script>

</body>
</html>