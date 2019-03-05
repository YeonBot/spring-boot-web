<%@ page import="com.springboot.web.Board.paging.Paging" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Spring Online Judge</title>

    <!-- Bootstrap core CSS -->
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
                    <a class="nav-link" href="/post.html">Sample Post</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/board/list">Board</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Header -->
<header class="masthead" style="background-image: url('/img/home-bg.jpg'); background-size: cover">
    <div class="overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <div class="site-heading">
                    <h1>ONLINE JUDGE !</h1>
                    <span class="subheading">프로그래밍 문제를 풀고 온라인으로 채점받을 수 있는 곳입니다.</span>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Main Content -->
<div class="container">
    <div class="page-header">
        <h2>
            현재 알고리즘 채점 상황
        </h2>
    </div>
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th>&nbsp;채점번호</th>
            <th>&nbsp;문제번호</th>
            <th>&nbsp;ID</th>
            <th>&nbsp;언어</th>
            <th>&nbsp;작성일</th>
            <th>&nbsp;결과</th>
        </tr>
        </thead>
        <tbody>
        <!-- boardList는 DomainController에서 보내준 변수임 -->
        <c:forEach var="list" items="${compileList}">
            <tr>
                <td>${list.sNo}</td>
                <td>${list.proNo}</td>
                <td>${list.email}</td>
                <c:if test="${list.language == 88}">
                    <td>C++14</td>
                </c:if>
                <td id="compile_diff${list.sNo}">${list.timeDifference}</td>
                <td id="compile_strRe${list.sNo}">${list.strResult}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
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

<script type="text/javascript">

    i = 0;
    count = 0;

    onload = function () {
        realTime();
    };

    function realTime() {
        psList = [];

        <c:forEach var="ps" items="${compileList}">
        ps = {};
        ps.sNo = ${ps.sNo};
        ps.dateTime = "${ps.dateTime}";
        ps.timeDifference = "";
        ps.result = ${ps.result};
        psList.push(ps);
        </c:forEach>

        var data = {
            "psList": psList
        };

        //Json 형태로 데이터 전달
        //data -> 객체안에 배열 , 배열 안에 여러개의 객체로 이루어짐
        $.ajax({
            url: "/problem/compileList/realTime",
            type: "POST",
            cache: false,
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (response) { // 성공했을 때의 처리 콜백함수
                //성공시 controller로 부터 전달받은 data로 text 변경
                for (i = 0; i < response.length; i++) {
                    var sNo = response[i].sNo;
                    var timeDifference = response[i].timeDifference;
                    var strResult = response[i].strResult;

                    $("#compile_diff" + sNo).text(timeDifference);
                    $("#compile_strRe" + sNo).text(strResult);
                }
            }
        });

        setTimeout("realTime()",1000);
        count++;
        if (count > 60) {
            count = 0;
            location.reload();
        }
    }
</script>

</body>
</html>