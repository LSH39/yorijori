<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <style>

        input#menu{
            display: none;
        }
        input#menu+label{
            display: block;
            width: 50px;
            height:37px;
            position: fixed;
            top: calc(50%);
            left: 0px;
            cursor: pointer;
            display: inline-block;
            overflow: hidden;
            z-index: 2;
        }
        input#menu+label span{
            display: block;
            position: absolute;
            width: 100%;
            
            height: 4px;
            background-color: #fff;
            transition: all .35s;
            
        }
        input#menu+label span:nth-child(1){top:0; transform: rotate(45deg);}
        input#menu+label span:nth-child(2){opacity: 0;}
        input#menu+label span:nth-child(3){bottom:0; transform: rotate(-45deg);}

        input#menu:checked + label span:nth-child(1){
            top:-2px; transform: translateY(50%) rotate(-45deg);
            
        }
        input#menu:checked + label span:nth-child(2){
            opacity: 0;
        }
        input#menu:checked + label span:nth-child(3){
            bottom:2px; transform: translateY(50%) rotate(45deg);
            
        }
        input#menu:checked+label {
            z-index: 2;
            left: 250px;
        }
        div.slidebar{
            width: 300px;
            height: 100%;
            background-color: black;
            position: fixed; top: 0;
            left:-250px;
            z-index: 1;
            transition: all .35s;
            box-shadow: rgb(13,23,36,0.7) 3px 3px 3px;
            padding: 100px;
        }
        input#menu:checked+label+div{
            left: 0;
        }
    </style>

    <div>
        <input type="checkbox" id="menu">
        <label for="menu">
            <span></span>
            <span></span>
            <span></span>
        </label>
        <div class="slidebar navbar">
            <ul class="navbar-nav me auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">관리 홈</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">회원관리</a>
                
            </li>
            <div class="dd" style="display: block;">
                    
                <a class="nav-link" href="allmember.do">전체회원조회</a>
                <a class="nav-link" href="#">블랙리스트 관리</a>
                <a class="nav-link" href="#">전문가 가입 승인</a>
                <a class="nav-link" href="#">탈퇴 요청 승인</a>

            
        </div>
                
                <li><a class="nav-link" href="#">방문자 통계</a></li>
                <li><a class="nav-link" href="#">밀키트 통계</a></li>
                <li><a class="nav-link" href="#">쿠폰 관리</a></li>
                <ul class="navbar-nav me auto">
                    <li><a class="nav-link" href="#">쿠폰 발행</a></li>
                    <li><a class="nav-link" href="#">쿠폰 관리</a></li>
                    

                </ul>
            </ul>

        </div>
    </div>