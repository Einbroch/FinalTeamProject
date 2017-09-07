<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>

<!-- Bootstrap Core CSS -->
<link href="/project/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/project/resources/css/bookbbs.css" rel="stylesheet">

<script type="text/javascript" src="/project/resources/js/jquery.min.js"></script>
<script type="text/javascript"
   src="/project/resources/js/jquery-3.2.1.min.js"></script>

<script type="text/javascript" src="/project/resources/js/jquery.min.js"></script>
<script type="text/javascript"
   src="/project/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
   src="/project/resources/js/modernizr.2.5.3.min.js"></script>
   
   <script type="text/javascript"
src="/project/resources/js/turn.js"></script>

<script type="text/javascript"
   src="/project/resources/js/bootstrap.min.js"></script>
<link href="/project/resources/css/bootstrap.min.css" rel="stylesheet">




<style type="text/css">
body {
   font-family: "나눔 고딕";
}

#wrapper {
   width: 100%;
   height: 100%;
   margin: 0 auto;
}

.book {
   width: 200px;
   height: 280px;
}

header { /* 헤더 */
   width: 100%;
   height: 100px;
   /* background-image: url("/project/img/testimg/bookcase.jpg"); */
   background-repeat: no-repeat;
   background-position: center;
   background-size: cover;
}

.header-img {
   background-color: rgba(0, 0, 0, 0);
   background-image: url("/project/resources/img/title-white.png");
   background-position: center;
   background-repeat: no-repeat;
   background-size: 100px;
   padding-top: 5%;
   padding-bottom: 1%;
}

.header-text {
   font-size: 32px;
   color: white;
   text-align: center;
   line-height: 120px;
}

.content { /* 본문 */
   float: left;
   width: 100%;
   height: auto;
   padding: 1.5625%;
   background-color: rgba(0, 0, 0, 0);
}

.minicontent {
   align: right;
   width: 7%;
   height: 35px;
}

footer { /* 푸터 */
   clear: both;
   width: 100%;
   height: 120px;
   padding-top: 2%;
   text-align: center;
   background-color: rgba(0, 0, 0, 0);
   background-image: url("/project/resources/img/testimg/banner-bg.jpg");
   background-position: center;
   background-repeat: no-repeat;
   background-size: cover;
}

/* .footer-img{
   background-color: rgba(0, 0, 0, 0);
   background-image: url("/BBSProject/img/logo.png");
   background-position: center;
   background-repeat: no-repeat;
   background-size: 50px;
} */
.btn-glyphicon {
   padding: 8px;
   background: #ffffff;
   margin-right: 4px;
}

.icon-btn {
   padding: 1px 15px 3px 2px;
   border-radius: 50px;
}

.w3-input {
   padding: 8px;
   display: inline-block;
   border: none;
   border-bottom: 1px solid #ccc;
   width: 100%
}

.col {
   float: left;
   margin-right: 50px;
}

/* ul li {
   display: inline;
} */
.pageingButton {
   display: inline-block;
}

.banner {
   padding: 30px 0;
   color: #f8f8f8;
   background: url("/project/resources/img/testimg/banner-bg.jpg")
      no-repeat center center;
   background-color: rgba(0, 0, 0, 0);
   background-size: cover;
   width: 100%;
   height: 500px;
}

.bbssize {
   margin-bottom: 50px;
   padding-top: 30px;
   padding-bottom: 30px;
}

.bbsstyle{
   background-color: rgba(0, 0, 0, 0);
   width: 100%;
   height: 650px;
   padding: 0 8% 0 8%;
}

@media all and (max-device-width:300px) {
   .bbsstyle {
      padding: 0 auto 0 auto;
   }
   /* .bbsbanner0 {
      height: 500px;
   }
   .bbsbanner1 {
      height: 400px;
   }
   .bbsbanner2 {
      height: 400px;
   } */
}

.slotbuttonrotate:hover {
   transform: rotate(20deg);
   transition-duration: 3s;
}

h2 {
   color: black;
}

.button1-info {
   background-color: rgba(0, 0, 0, 0);
   color: white;
   border: 2px solid #e7e7e7; /* Gray */
   width: 250px;
   height: 40px;
   transition-duration: 0.4s;
   cursor: pointer;
}

.button1-info:hover {
   background-color: #b0e0e6;
   color: #20b2aa;
}

.button1-case {
   background-color: rgba(0, 0, 0, 0);
   color: white;
   border: 2px solid #e7e7e7; /* Gray */
   width: 250px;
   height: 40px;
   transition-duration: 0.4s;
   cursor: pointer;
}

.button1-case:hover {
   background-color: #e0ffff;
   color: #87cefa;
}

.button1-logout {
   background-color: rgba(0, 0, 0, 0);
   color: white;
   border: 2px solid #e7e7e7; /* Gray */
   width: 250px;
   height: 40px;
   transition-duration: 0.4s;
   cursor: pointer;
}

.button1-logout:hover {
   background-color: #db7093;
   color: white;
}

.button2 {
   background-color: white;
   color: gray;
   border: 2px solid #e7e7e7; /* Gray */
   width: 40px;
   height: 40px;
   transition-duration: 0.4s;
   cursor: pointer;
}

.button2:hover {
   background-color: #4169e1;
   color: white;
}

.imgclass {
   width: 200px;
   height: 150px;
   size: auto;
}

.libg {
   background-color: rgba(0, 255, 255, 0.3);
}

.bbsimg {
   background-color: rgba(0, 0, 0, 0);
   background-image: url("/project/resources/img/testimg/sb.jpg");
   background-position: center;
   background-repeat: no-repeat;
   background-size: cover;
}

.bbsbanner0 {
   width: 75%;
   height: 80%;
   margin: auto;
   background-color: white;
   vertical-align: middle;
   margin-top: 3%;
}

@media screen and (max-width:500px) {
   .bbsbanner0 {
      height: 550px;
   }
}

.bbsbanner1 {
   width: 48%;
   height: 600px;
   display: inline-block;
   position: relative;
   margin-left: 1.3%;
   margin-top: 3%;
   margin-right: 1%;
   color: black;
   background-color: rgba(0, 0, 0, 0);
   float: left;
}

.page {
   background-color: rgba(0, 0, 0, 0);
   border: 0px;
   position: fixed;
}

.bbsbanner2 {
   width: 48%;
   height: 600px;
   display: inline-block;
   position: relative;
   margin-top: 3%;
   color: black;
   background-color: rgba(0, 0, 0, 0);
   float: left;
}

.pagecenter {
   width: 100%;
   height: 80px;
}

.pagenumber {
   width: 10px;
   height: 10px;
}

.button3 {
   width: 120px;
   height: 30px;
   background-color: white;
   border: 2px solid #e7e7e7;
}

.book-container-review-map {
   width: 98%;
   height: 370px;
   background-color: white;
   /* border: 1px solid navy; */
   margin: 6px;
}

.book-container-review-btn {
   width: 98%;
   height: auto;
   background-color: white;
   /* border: 1px solid navy; */
   margin: 6px;
}

.book-container-review-list {
   width: 98%;
   height: 250px;
   background-color: white;
   /* border: 1px solid navy; */
   margin: 6px;
}

.review-input-1-time {
   padding: 8px;
   display: inline-block;
   border: none;
   border-bottom: 1px solid #ccc;
   border-right: 1px solid #ccc;
   width: 20%;
   height: 20px;
   text-align: center;
}

.review-input-1-plan {
   padding: 8px;
   display: inline-block;
   border: none;
   border-bottom: 1px solid #ccc;
   width: 80%;
   height: 20px;
}

.review-input-2-plan {
   padding: 8px;
   display: inline-block;
   border: none;
   border-bottom: 1px solid #ccc;
   width: 100%;
   height: 20px;
}

.review-input-2-btn-main {
   background-color: rgba(0, 0, 0, 0);
   color: black;
   border: 2px solid #e7e7e7; /* Gray */
   transition-duration: 0.4s;
   width: 100%;
   height: 18px;
   font-size: 10px;
   text-align: center;
}

.review-input-2-btn-main:hover {
   background-color: #d4f4fa;
   color: #747474;
}

.modal-dialog.modal-90size {
   width: 65%;
   height: auto;
   margin: auto;
   padding: auto;
}

.modal-content.modal-90size {
   height: auto;
   min-height: 65%;
}

.position {
   margin-top: 3vh;
}

.modal-dialog.modal-size {
   width: 1500px;
   height: 800px;
}

.modal-content.modal-size {
   width: 1500px;
   height: 800px;
}

.sidemenubar {
   width: 450px;
   height: 700px;
   background-color: orange;
   /* margin-right: 100%; */
   float: left;
   overflow: scroll;
}

input[type=date]::-webkit-clear-button, input[type=date]::-webkit-outer-spin-button,
   input[type=date]::-webkit-inner-spin-button {
   display: none;
}

input[type=date]:required:invalid::-webkit-datetime-edit {
   color: transparent;
}

input[type=date]:focus::-webkit-datetime-edit {
   color: black !important;
}
</style>
</head>
<body style="background-color: white; font-family: '나눔 고딕';">




   <div id="wrapper">
      <!--   <header>
      </header> -->

      <aside class="banner">
         <div class="header-img" align="center"></div>
         <br> <br> <br> <br> <br>
         <div class="container" align="center">
            <div class="col-sm-4">
               <div class="jumbotron-title">
                  <button class="button1-info" data-toggle="modal"
                     data-target="#infomodal" data-backdrop="static" id="modal_info">Info</button>
                  <div class="modal fade" id="infomodal" role="dialog">
                     <div class="modal-dialog" role="document">
                        <div class="modal-content">
                           <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                              <h3 class="modal-title" align="center">
                                 <font color="black"> <span
                                    class="glyphicon glyphicon-user"></span>
                                 </font>
                              </h3>
                           </div>
                           <div class="modal-body" align="center">
                              <form class="w3-container" action="" method="post"
                                 id="modal_info_form"></form>
                              <br>

                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>

            <div class="col-sm-4">
               <div class="jumbotron-title">
                  <button class="button1-case" data-toggle="modal"
                     data-target="#casemodal" data-backdrop="static" id="modal_case">Book
                     Case</button>
                  <div class="modal fade" id="casemodal" role="dialog">
                     <div class="modal-dialog" role="document">
                        <div class="modal-content">
                           <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                              <h3 class="modal-title" align="center">
                                 <font color="black"> <span
                                    class="glyphicon glyphicon-book"></span>
                                 </font>
                              </h3>
                           </div>
                           <div class="modal-body" align="center">
                              <form class="w3-container" action="" method="post"
                                 id="modal_login_form"></form>
                              <br>
                              <button type="button" id="user_book" class="btn btn-primary">OK</button>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>

            <div class="col-sm-4">
               <div class="jumbotron-title">
                  <button class="button1-logout">Logout</button>
               </div>
            </div>
         </div>

      </aside>


      <section class="content">

         <div class="container" align="center">
            <div class="col-sm-4">

               <div class="jumbotron">
                  <h3>여행을 계획하고</h3>
                  <!--    <button type="button" id="page_test" data-toggle="modal"
                     data-target="#page_test_modal">버튼</button> -->
                  <p>~~~~~~</p>
               </div>
            </div>

            <div class="col-sm-4">
               <div class="jumbotron">
                  <h3>여행 후기를 쓰고</h3>
                  <p>~~~~~~</p>
               </div>
            </div>

            <div class="col-sm-4">
               <div class="jumbotron">
                  <h3>함께 공유</h3>
                  <p>~~~~~~</p>
               </div>
            </div>
         </div>

         <div align="center" style="margin-bottom: 88px; margin-top: 72px;">
            <h2>Best Trip</h2>
            <br> <span style="">세계는 한 권의 책이다. 여행하지 않는 사람들은 그 책의 한
               페이지만 읽는것과 같다. - 아우구스투스 -</span>
            <div
               style="border: 4px; width: 700px; height: 1px; border-color: black;"></div>
         </div>
         <div align="center" style="margin-top: 15px; margin-bottom: 50px;">
            <input type="search" class="w3-input" style="width: 10%;"
               placeholder="Search"> &nbsp;&nbsp;
            <button class="button3">Search</button>
         </div>

         <!-- 게시판 -->
         <div class="bbsstyle" align="center" id="bbstrip"></div>
         <!-- <div align="center">
            <nav aria-label="Page navigation example">
               <ul class="pagination">
                  <li class="page-item"><a class="page-link" href="#"
                     aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                  </a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">4</a></li>
                  <li class="page-item"><a class="page-link" href="#">5</a></li>
                  <li class="page-item"><a class="page-link" href="#">6</a></li>
                  <li class="page-item"><a class="page-link" href="#">7</a></li>
                  <li class="page-item"><a class="page-link" href="#">8</a></li>
                  <li class="page-item"><a class="page-link" href="#">9</a></li>
                  <li class="page-item"><a class="page-link" href="#">10</a></li>
                  <li class="page-item"><a class="page-link" href="#"
                     aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
                        class="sr-only">Next</span>
                  </a></li>
               </ul>
            </nav>
         </div> -->

         <!--    <div class = "pagecenter" align="center">
            <div class="btn-group pageingButton" data-toggle="buttons" align="center" style="text-align:center;">
               <ul class="pagination" id="page"></ul>
            </div>
         </div>
 -->
         <div class="pagecenter" align="center">
            <div class="btn-group pageingButton" data-toggle="buttons"
               align="center" style="text-align: center;">
               <ul class="pagination" id="page"></ul>
            </div>
         </div>


      </section>

      <footer>
         <div>
            <img src="/project/resources/img/logo.png" style="width: 50px;">
         </div>
         <div>
            <font color="white" size="2px">Copyright&copy; 2017. Qqu all
               rights reserved.</font>
         </div>
      </footer>
   </div>

   <!-- 
   <div id="page" class="btn-group" data-toggle="buttons"></div> -->




   <!-- 여기서부터  상세페이지 -->
   <button type="button" data-toggle="modal"
      data-target="#page_test_modal" data-backdrop="static" id="page_test">Page
      Test</button>

   <input type="date" placeholder="Date" required>

   <div class="modal fade position" id="page_test_modal" role="dialog">
      <div class="modal-dialog modal-size" role="document">
         <div class="modal-content modal-size" style="overflow: hidden;">
            <!-- 헤더 -->
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h3 class="modal-title" align="center">
                  <font color="black"> <span class="glyphicon glyphicon-list"></span>
                  </font>
               </h3>
            </div>
            <!-- 바디 -->
            <div class="modal-body" align="center">
               <div class="flipbook-viewport">
                  <!-- 사이드바 -->
                  <div id="sidebar" class="sidemenubar">
                     <h1>Side Bar</h1>
                     <div>
                        <ul class="nav nav-list">
                           <li><label class="tree-toggle nav-header">Bootstrap</label>
                              <ul class="nav nav-list tree">
                                 <li><a href="#" onclick='javascript:turnPage(1)'>01</a></li>
                                 <li><a href="#" onclick='javascript:turnPage(2)'>2017-06-08
                                       15:30 스킨스쿠버<br>-쇠소깍에서-
                                 </a></li>
                                 <li><a href="#" onclick='javascript:turnPage(3)'>03</a></li>
                                 <li><a href="#" onclick='javascript:turnPage(4)'>04</a></li>
                                 <li><a href="#" onclick='javascript:turnPage(5)'>05</a></li>
                                 <li><a href="#" onclick='javascript:turnPage(6)'>06</a></li>
                                 <li><a href="#" onclick='javascript:turnPage(7)'>07</a></li>
                                 <li><a href="#" onclick='javascript:turnPage(8)'>08</a></li>

                              </ul></li>
                        </ul>
                     </div>
                  </div>
                  <!-- 플립북 -->
                  <div class="container">
                     <div class="flipbook">
                        <!-- 첫 페이지 고정 -->
                        <div style="border: 1px solid #000000;">
                           <div style="margin-top: 100px;">
                              <h1>제목</h1>
                              <br>
                              <p>글쓴이</p>
                           </div>
                           <div style="margin-top: 120px;">
                              <img src="/project/resources/img/1502872447230.jpg"
                                 style="width: 100%; height: 100%;">
                           </div>
                        </div>
                        <!-- 두번째 페이지 고정 -->
                        <div style="border: 1px solid #000000;">
                           <div
                              style="float: left; width: 50%; height: 100%; background-color: orange;"></div>
                           <div
                              style="float: left; width: 50%; height: 100%; background-color: white;"></div>
                        </div>
                        <!-- 세번째 페이지 고정 -->
                        <div
                           style="border: 1px solid #000000; background-color: #9ED685; opacity: 1;"></div>
                        <!-- 네번째 페이지 고정 -->
                        <div
                           style="border: 1px solid #000000; background-color: #9ED685; opacity: 1;"></div>
                        <!-- 다섯번째 페이지 고정 -->
                        <div style="background-image: url(/Project/img/first_title.png)"></div>
                        <!-- 여섯번째 페이지 사용자 내용 -->
                        <div style="">
                           <div>
                              <h2>제목</h2>
                              <p>- 위치 정보 -</p>
                           </div>
                           <div>
                              <img src="/project/resources/img/1502872447230.jpg"
                                 style="width: 96%; height: 100%;">
                           </div>
                           <div style="float: right; margin-right: 9px;">
                              <img src="/project/resources/img/1502872447230.jpg"> <a
                                 href="#" class="mapballoon">위치 보기
                                 <div>
                                    <img src="/project/resources/img/1502872447230.jpg"
                                       style="width: 50%;">
                                 </div>
                              </a>
                           </div>
                           <div>
                              <textarea rows="11" cols="60" style="resize: none;" readonly></textarea>
                           </div>
                        </div>

                        <!-- 일곱번째 페이지 사용자 내용 -->
                        <!-- 0901 contents_plan 제목 / contents_name : 위치정보 / contents_imamge : 사진  / contents_desc :내용 -->

                        <div style="" align="center">
                           <div>
                              <h2>제목</h2>
                              <p>- 위치 정보 -</p>
                           </div>
                           <div style="width: 440px; height: 300px;">
                              <!-- 이미지넣는곳 -->
                              <img src="/project/resources/img/logo.png"
                                 style="background-size: contain;">
                           </div>
                           <div style="float: right; margin-right: 9px;">
                              <> <a href="#" class="mapballoon1">위치 보기
                                 <div>
                                    <img src="" style="width: 50%; height: 100%">
                                 </div>
                              </a>
                           </div>
                           <div>
                              <textarea rows="7" cols="60" style="resize: none;" readonly>글자넣는곳</textarea>
                           </div>
                        </div>

                        <div
                           style="background-image: url(/project/resources/img/1502872447230.jpg)"></div>
                        <div
                           style="background-image: url(/project/resources/img/1502872447230.jpg)"></div>
                        <div
                           style="background-image: url(/project/resources/img/1502872447230.jpg)"></div>
                        <div style="background-image: url(/BBSProject/img/page/8.jpg)"></div>
                        <div style="background-image: url(/BBSProject/img/page/9.jpg)"></div>
                        <div style="background-image: url(/BBSProject/img/page/8.jpg)"></div>
                        <div style="background-image: url(/BBSProject/img/page/9.jpg)"></div>
                        <div style="background-image: url(/BBSProject/img/page/8.jpg)"></div>
                        <div style="background-image: url(/BBSProject/img/page/9.jpg)"></div>
                        <div style="background-image: url(/BBSProject/img/page/10.jpg)"></div>
                        <div style="background-image: url(/BBSProject/img/page/10.jpg)"></div>
                        <div
                           style="background-image: url(/BBSProject/img/page/dummy1.png)"></div>
                     </div>
                  </div>
               </div>
            </div>
            <!-- <div class="modal-footer"></div> -->
            <br>
         </div>
      </div>
   </div>
   <!-- 여기까지 상세페이지 -->




   <script type="text/javascript">
      var call = null;
      $(function() {
   
         //에이젝스
         call = function callAjax(block) {
            var u = "/project/bbs/data/" + block;
            $.ajax({
               url : u,
               type : "post",
               dataType : "json",
               success : function(data) {
                  eachFunc(data, block);
                  datavalue(data);
                  console.log(data);
               },
               complete : function() {
                  var a,
                     b;
                  a = 0;
                  b = 2;
                  pageFunc(a, b);
               }
            });
         }
         call(0);
   
   
   
         /*    
                  function callPage(getgoPageData) {
                     var u = "/project/page/read" 
                     console.log("로그다 쓰빌"+getgoPageData);
                  }
                     $.ajax({
                        url : u,
                        type : "post",
                        contentType : "application/json;charset=UTF-8",
                        dataType : "json",
                        success : function(data) {},
            
                        error : function() {
                           alret("안된다고 쒸벌~");
                        }
                     });
                   */
   
   
   
         //리스트 정보뿌리기
         function datavalue(data) {
            $("#bbstrip").empty();
            console.log("datavalue 밑");
            console.log(data);
            var value = "";
            var count = 0;
            value += '<div class="bbs-container" align="center" id="bbsList' + count + '">';
   
            $.each(data, function(i, d) {
   
               if (i != 0 && i % 5 == 0) {
                  count++;
                  value += '</div><div class="bbs-container" align="center" id="bbsList' + count + '">'
               }
               /* <button type="button"  id="page_test" data-toggle="modal" data-target="#page_test_modal">버튼</button */
   
               /* \'' + d["sp_title"] + '\',\'' + d["sp_author"] + '\' */
               value += '<div id="con' + i + '" class="bbs-container-content" onClick="goPage(\'' + d["sp_id"] + '\' )">'; /* onclick=""20170831 */
               /* value += '<div class="bbs-container-content" id='con"+i+"'>'; */
               value += '<div class="bbs-container-bbs"><br>';
               value += '<div><h4>' + d["sp_title"] + '</h4></a><p>' + d["sp_author"] + '</p></div>';
               value += '<div class="bbs-container-bbs-img"><img style="width:100%; height:100%;" src="/upload/' + d["sp_image"] + '"></div>';
               value += '</div>';
               value += '</div>';
   
   
            });
            value += '</div>';
            $("#bbstrip").append(value);
         }
   
   
         //리스트 몇개보여줄까
         function pageFunc(s, e) {
            var v;
            //$(".bbs-container-content").hide();
            $(".bbs-container").hide();
            for (var i = s; i < e; i++) {
               var v = "#bbsList" + i;
   
               $(v).show();
            }
   
         }
   
   
         //페이징
         function eachFunc(data, block) {
            console.log("eachFunc 바로 밑");
            console.log(data);
            block = Number(block);
            var num = 0;
            console.log("block이다 씨벌" + block);
            /* $("#contents").empty(); */
            $("#page").empty();
            {
               var label = "";
               label += '<button class="button2" type="button" name="leftblock" id="leftblock" style="margin-right:1px;" ';
               label += ' moveblock="' + (block - 1) + '" ';
               if (block == 0) {
                  label += 'class="btn disabled"><</button>';
               } else {
                  label += 'class="btn"><</button>';
               }
               $("#page").append(label);
            }
            $.each(data, function(i, d) {
               num = i;
   
               if ((i % 10) == 0) {
                  var label = "";
                  if (i == 0) {
                     label += '<label class="btn page-item" style="margin-bottom:4px; margin-left:1px; margin-right:1px;">';
                  } else {
                     label += '<label class="btn page-item" style="margin-bottom:4px; margin-left:1px; margin-right:1px;">';
                  }
                  label += '<li>';
                  label += '<div class = "pagenumber">';
                  label += '<input type="button" name="options" class="page"';
                  label += 'startrow="' + ((i / 10) * 2) + '" endrow="' + (((i / 10) * 2) + 1) + '" ';
                  label += 'id="page' + ((i / 10) + 1) + '">';
                  label += ((i / 10) + 1 + (block * 10)) + '</label>';
                  label += '</div>'
                  label += '</li>';
                  $("#page").append(label);
   
               }
            });
   
            {
               var label = "";
               label += '<button class="button2" type="button" name="rightblock" style="margin-left:1px;" '
               label += 'id="rightblock" ';
               label += ' moveblock="' + (block + 1) + '" ';
               if (num != 99) {
                  label += 'class="btn" disabled id="rightblock"> > </button>';
               } else {
                  label += 'class="btn"> > </button>';
               }
               $("#page").append(label);
            }
         }
   
   
   
         $("#modal_info").click(function() {
            $("#modal_info_form").empty();
            $("#modal_info_form").append(
               '<button type="button" id="user_info" class="btn btn-primary" onClick="user_modify()">수정하기</button>'
            );
         });
   
         function user_modify() {
            $("#modal_info_form").empty();
            $("#modal_info_form").append(
               '<p>' +
               '<input class="w3-input" type="text" id="modify_password" name="modify_password" placeholder="Password">' +
               '</p>' +
               '<p>' +
               '<input class="w3-input" type="text" id="modify_name" name="modify_name" placeholder="Name">' +
               '</p>' +
               '<p>' +
               '<input class="w3-input" type="text" id="modify_phone" name="modify_phone" placeholder="010-****-****">' +
               '</p>' +
               '<p>' +
               '<input class="w3-input" type="email" id="modify_email" name="modify_email" placeholder="E-Mail">' +
               '</p>' +
               '<button type="button" id="user_info" class="btn btn-primary" onClick="user_complete()">수정완료</button>'
            );
   
         }
   
   
   
   
      });
   
      //상세페이지
   
      function goPage(id) {
         console.log("데이터다 쒸버ㅏㅓㄹ" + id);
         var getgoPageData = {
            slot_id : id
         };
         /* alert(title+","+author); */
         $("#page_test_modal").modal("show");
         var u = "/project/page/read"
         console.log("로그다 쓰빌" + getgoPageData);
   
   
         /*       function ajaxGoPage(getgoPageData) {
                  var u = "/project/page/read" 
                  console.log("로그다 쓰빌"+getgoPageData);
               } */
         $.ajax({
            url : u,
            type : "POST",
            contentType : "application/json;charset=UTF-8",
            data : JSON.stringify(getgoPageData),
            dataType : "json",
            success : function(data) {
               leftListPage(data);
               rightListPage(data);
               alert("불러오기 성공");
            },
   
            error : function(data) {
               alert("안된다고 쒸벌~");
            }
         });
   
      }
   
   
   
   
   
      //리스트 몇개보여줄까
      function pageFunc(s, e) {
         var v;
         //$(".bbs-container-content").hide();
         $(".bbs-container").hide();
         for (var i = s; i <= e; i++) {
            var v = "#bbsList" + i;
            $(v).show();
         }
   
      }
   
      $(document).on("change", ".page", function() {
         var start = $(this).attr("startrow");
         var end = $(this).attr("endrow");
         console.log(start + ":" + end);
         pageFunc(start, end);
      });
   
      $(document).on("click", "#leftblock, #rightblock", function() {
         var block = $(this).attr("moveblock");
         console.log("새로운 블럭이다" + block);
         call(block);
      });
   
   
   
      /* 페이지 이동 */
   
      function turnPage(num) {
         console.log("넘이다 쒸벌~~" + num);
   
         $('.flipbook').turn("page", num);
         console.log("넘이다 " + num);
      }
   
      function loadApp() {
   
         // Create the flipbook
   
         $('.flipbook').turn({
            // Width
   
            width : 922,
   
            // Height
   
            height : 600,
   
            // Elevation
   
            elevation : 50,
   
            // Enable gradients
   
            gradients : true,
   
            // Auto center this flipbook
   
            autoCenter : true
         });
      }
      // Load the HTML4 version if there's not CSS transform
   
      yepnope({
         test : Modernizr.csstransforms,
         yep : [ '/project/resources/js/turn.js' ],
         nope : [ '/project/resources/js/turn.html4.min.js' ],
         both : [ '/project/resources/css/basic.css' ],
         complete : loadApp
      });
      // 왼쪽 상세페이지
      function leftListPage(data) {
         $("#sidebar").empty();
         console.log("sidebar 밑");
         console.log(data);
         var value = "";
   
         /* 사이드바 */
   
         value += '<h1>' + "Contents" + '</h1>';
   
         value += '<ul class="nav nav-list">';
         value += '<li><label class="tree-toggle nav-header">' + "list" + '</label>'
         value += '<ul class="nav nav-list tree">';
   
   
   
   
         $.each(data, function(i, d) {
            var string = '"+"';
            var string = '' + '';
   
            value += '<li>';
            value += '<a href="#" onclick="javascript:turnPage(' + (i + 6) + ')">' + d["contents_plan"] + '</a>' + '</li>';
   
         });
         $("#sidebar").append(value);
      }
   
   
      function rightListPage(data) {
         /* $(".container").empty(); */
         $(".flipbook").empty();
         console.log("rightpage 밑");
         console.log(data);
   
         var value = "";
   
         value += '<div class="container">';
         value += '<div class="flipbook">';
         <!-- 첫 페이지 고정 -->
         value += '<div style="border: 1px solid #000000;">';
         value += '<div style="margin-top: 100px;">';
         value += '<h1>제목</h1>';
         value += '<br>';
         value += '<p>글쓴이</p>';
         value += '</div>';
         value += ' <div style="margin-top: 120px;">';
         value += '<img src="/project/resources/img/1502872447230.jpg"';
         value += 'style="width: 100%; height: 100%;">';
         value += '</div>';
         value += '</div>';
         <!-- 두번째 페이지 고정 -->
         value += '<div style="border: 1px solid #000000;">';
         value += '<div style="float: left; width: 50%; height: 100%; background-color: orange;"></div>';
         value += '<div style="float: left; width: 50%; height: 100%; background-color: white;"></div>';
         value += '</div>';
         <!-- 세번째 페이지 고정 -->
         value += '<div style="border: 1px solid #000000; background-color: #9ED685; opacity: 1;"></div>';
         <!-- 네번째 페이지 고정 -->
         value += '<div style="border: 1px solid #000000; background-color: #9ED685; opacity: 1;"></div>';
         <!-- 다섯번째 페이지 고정 -->
         value += '<div style="background-image: url(/Project/img/first_title.png)"></div>';
   
         /* 여기부터시작 */
         $.each(data, function(i, d) {});
   
         /*    $(".container").append(value); */
         $(".flipbook").append(value);
      }
   </script>

   <!-- 
   <script src="/project/resources/js/list-bbs.js"></script>
   
   <script src="/project/resources/js/bbs-ajax.js"></script> 
   -->

</body>
</html>