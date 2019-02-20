<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="euc-kr" dir="ltr">

<head>
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>�ڵ��ν���</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/codingBooster.css">
    <style type="text/css">
        .panel-login {
            border-color: #ccc;
            -webkit-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
            -moz-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
            box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
        }

        .panel-login>.panel-heading {
            color: #00415d;
            background-color: #fff;
            border-color: #fff;
            text-align: center;
        }

        .panel-login>.panel-heading a {
            text-decoration: none;
            color: #666;
            font-weight: bold;
            font-size: 15px;
            -webkit-transition: all 0.1s linear;
            -moz-transition: all 0.1s linear;
            transition: all 0.1s linear;
        }

        .panel-login>.panel-heading a.active {
            color: #029f5b;
            font-size: 18px;
        }

        .panel-login>.panel-heading hr {
            margin-top: 10px;
            margin-bottom: 0px;
            clear: both;
            border: 0;
            height: 1px;
            background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
            background-image: -moz-linear-gradient(left, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
            background-image: -ms-linear-gradient(left, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
            background-image: -o-linear-gradient(left, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
        }

        .panel-login input[type="text"],
        .panel-login input[type="email"],
        .panel-login input[type="password"] {
            height: 45px;
            border: 1px solid #ddd;
            font-size: 16px;
            -webkit-transition: all 0.1s linear;
            -moz-transition: all 0.1s linear;
            transition: all 0.1s linear;
        }

        .panel-login input:hover,
        .panel-login input:focus {
            outline: none;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
            border-color: #ccc;
        }

        .btn-login {
            background-color: #59B2E0;
            outline: none;
            color: #fff;
            font-size: 14px;
            height: auto;
            font-weight: normal;
            padding: 14px 0;
            text-transform: uppercase;
            border-color: #59B2E6;
        }

        .btn-login:hover,
        .btn-login:focus {
            color: #fff;
            background-color: #53A3CD;
            border-color: #53A3CD;
        }

        .forgot-password {
            text-decoration: underline;
            color: #888;
        }

        .forgot-password:hover,
        .forgot-password:focus {
            text-decoration: underline;
            color: #666;
        }

        .btn-register {
            background-color: #1CB94E;
            outline: none;
            color: #fff;
            font-size: 14px;
            height: auto;
            font-weight: normal;
            padding: 14px 0;
            text-transform: uppercase;
            border-color: #1CB94A;
        }

        .btn-register:hover,
        .btn-register:focus {
            color: #fff;
            background-color: #1CA347;
            border-color: #1CA347;
        }
    </style>

</head>

<body>



<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index">�ڵ� �ν���</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index">�Ұ�<span class="sr-only"></span></a></li>
                <li><a href="instructor">������</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">����<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="lecture?lectureName=C">C���</a></li>
                        <li><a href="lecture?lectureName=Java">Java</a></li>
                        <li><a href="lecture?lectureName=Android">�ȵ���̵�</a></li>
                    </ul>
                </li>
                <li><a href="bbs">�Խ���</a></li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="������ �Է��ϼ���.">

                </div>
                <button type="submit" class="btn btn-default">�˻�</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">�����ϱ�<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="loginForm">�α���</a></li>
                        <li><a href="registerForm">ȸ������</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-login">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-6">
                            <a href="#" class="active" id="login-form-link">�α���</a>
                        </div>
                        <div class="col-xs-6">
                            <a href="#" id="register-form-link">ȸ������</a>
                        </div>
                    </div>
                    <hr>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form id="login-form"  method="post" role="form" style="display: block;">
                                <input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <div class="form-group">
                                    <input type="email" name="username" id="userID" tabindex="1" class="form-control" placeholder="�̸���" value="">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" id="userPassword" tabindex="2" class="form-control" placeholder="��й�ȣ">
                                </div>
                                <div class="form-group text-center">
                                    <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                                    <label for="remember"> ���̵� ����ϱ�</label>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="�α���">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="text-center">
                                                <a href="https://phpoll.com/recover" tabindex="5" class="forgot-password">��й�ȣ�� �ؾ�����̳���?</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <form id="register-form" action="/member" method="post" role="form" style="display: none;">
                                <input type ="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <div class="form-group">
                                    <input type="email" name="uemail" id="uid" tabindex="1" class="form-control" placeholder="���̵�(�̸��� ����)" value="">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="upw" id="password" tabindex="2" class="form-control" placeholder="��й�ȣ">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="�̸�" name="uid" tabindex="1">
                                </div>
                                <div class="form-group" style="text-align:center;">
                                    <div class="btn-group" data-toggle="buttons">
                                        <label class="btn btn-primary active">
                                            <input type="radio" name="userGender" autocomplete="off" value="����" checked>����
                                        </label>
                                        <label class="btn btn-primary">
                                            <input type="radio" name="userGender" autocomplete="off" value="����">����
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="�����ϱ�">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<footer style="background-color: #000000; color:#ffffff">
    <div class="container">
        <br>
        <div class="row">
            <div class="col-sm-2" style="text-align:center;">
                <h5>Copyright &copy; 2019</h5>
                <h5>������(YeonBot)</h5>
            </div>
            <div class="col-sm-4">
                <h4>��ǥ�� �Ұ�</h4>
                <p>���� �ڵ� �ν����� ��ǥ �������Դϴ�. �����߿� ������ �����ϴ�.</p>
            </div>
            <div class="col-sm-2">
                <h4 style="text-align:center;">���̰��̼�</h4>
                <div>
                    <a href="index" class="list-group-item">�Ұ�</a>
                    <a href="instructor" class="list-group-item">������</a>
                    <a href="lecture" class="list-group-item">����</a>
                </div>
            </div>
            <div class="col-sm-2">
                <h4 style="text-align:center;">SNS</h4>
                <div>
                    <a href="#" class="list-group-item">���̽���</a>
                    <a href="#" class="list-group-item">��Ʃ��</a>
                </div>
            </div>
            <div class="col-sm-2">
                <h4 style="text-align:center;"><span class="glyphicon glyphicon-ok"></span> &nbsp;by ������</h4>
            </div>
        </div>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
    $(function() {

        $('#login-form-link').click(function(e) {
            $("#login-form").delay(100).fadeIn(100);
            $("#register-form").fadeOut(100);
            $('#register-form-link').removeClass('active');
            $(this).addClass('active');
            e.preventDefault();
        });
        $('#register-form-link').click(function(e) {
            $("#register-form").delay(100).fadeIn(100);
            $("#login-form").fadeOut(100);
            $('#login-form-link').removeClass('active');
            $(this).addClass('active');
            e.preventDefault();
        });

    });
</script>
</body>

</html>
