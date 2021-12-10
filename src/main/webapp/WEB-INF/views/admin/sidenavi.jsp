<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <style>
    	.quickmenu{
    	display: none;
    	}

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
            background-color: #6D5874;
            position: fixed; top: 0;
            left:-250px;
            z-index: 1;
            transition: all .35s;
            box-shadow: rgb(13,23,36,0.7) 3px 3px 3px;
            padding: 100px;
            text-align: center;
            margin : 0 auto;
            
        }
        div.slidebar a{
        
       	
        padding-left: 15px;
        margin-left: 15px auto;
        margin-right: 15px auto;
        width: 120px;
        color : #fff;
        text-align: center;
        border-radius: 5px; 
        
        }
        input#menu:checked+label+div{
            left: 0;
        }
       div.slidebar:hover{
       left:-230px;
       }
       .slidebar .showDrop{
       color: black;
       background-color: #E0D8EF;
       box-shadow: rgb(13,23,36,0.7) 3px 3px 3px;
       
       }
       .slidebar a:hover{
       color: #C4BFE3;
       }
      .slidebar .showDrop:hover{
      	color:#6D5874;
      }
       
.showDetail{
display: none;
background-color: #E0D8EF;
}

.pagenation{
display: flex;
}
.pagenation ul{
align-self: center;
margin : 0 auto;



}
.pagenation a{
color: #9F90CF;
background-color :#fff; }
.pagenation a:hover{
color: #9F90CF;
}
.page-item.active .page-link{
   color: #fff;
   background: #9F90CF;
   border-color : #9F90CF;
    
}

button ,input[type=submit],input[type=reset]{
color: #fff;
background-color: #9F90CF;

}
    </style>

    <div id="leftnav">
        <input type="checkbox" id="menu">
        <label for="menu">
            <span></span>
            <span></span>
            <span></span>
        </label>
        <div class="slidebar navbar">
            
                
                    <a class="nav-link showDrop"  href="/admin.do">관리 홈</a>
                
                
                    <a class="nav-link showDrop1 showDrop" href="#">회원관리</a>
                
            
            <div class="drop1 navbar" style="display: none;">
                    
                <a class="nav-link" href="allmember.do?reqPage=1">전체회원조회</a>
                <a class="nav-link" href="blackList.do?reqPage=1">블랙리스트 관리</a>
                <a class="nav-link" href="permissionJoin.do?reqPage=1">전문가 가입 승인</a>
                <a class="nav-link" href="permissionDelete.do?reqPage=1">탈퇴 요청 승인</a>

            	
       		</div>
       		
                <a class="nav-link showDrop2 showDrop" href="#">통계</a>
                <div class="drop2 navbar" style="display: none;">
                    
               <a class="nav-link" href="stat.do">일간 현황</a>
                <a class="nav-link" href="#">순위</a>

            	
       		</div>
                
                
                <a class="nav-link showDrop3 showDrop" href="#">쿠폰 관리</a>
                
                <div class="drop3 navbar" style="display: none;">
                    
               <a class="nav-link" href="coupon.do">쿠폰 발행</a>
                    <a class="nav-link" href="couponList.do?reqPage=1">쿠폰 관리</a>

            	
       		</div>
                    
                    

                
            

        </div>
    </div>
    <script>
    
    
	$(".slidebar").click(function(){
		$("#menu").click();
    	
    	
    });
	$(".showDrop1").click(function(){
		
		$(".drop1").slideToggle();
		$("#menu").click();
	});
	$(".showDrop2").click(function(){
		$(".drop2").slideToggle();
		$("#menu").click();
	});
	$(".showDrop3").click(function(){
		$(".drop3").slideToggle();
		$("#menu").click();
	});
    </script>