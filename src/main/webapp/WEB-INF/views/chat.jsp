<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
/*        #myform{
            margin-top:10px;
        }*/
        .main{
            margin-top:20px;
            display:flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .chatbox{
            padding-left: 10px;
            padding-right: 10px;
            display:flex;
            border:1px solid black;
            background-color:moccasin;
            margin:20px;
            height:600px;
            width:600px;
            overflow:scroll;
        }
        .mymessagebox{
            display:flex;
            justify-content:flex-end;
        }
        .mymessage{
            border-radius:10px;
            width: 200px;
            margin: 10px;
            padding: 2px;
        }
        .messagebox{
            display:flex;
            justify-content: flex-start;
        }
        .message{
            border-radius:10px;
            width: 200px;
            margin: 10px;
            padding: 2px;
        }
        .input{
            
        }
        
    </style>
    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- AngularJS -->
     <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.8/angular.min.js"></script>
</head>
<body ng-app="myChat" ng-controller="MainCtrl" ng-cloak>
<!--    <form id="myform" class="container">
            <label for="name">Type in your nickname and start chatting</label>
            <input type="text" id="name" ng-model="nickname" placeholder="Choose a nickname">
            <button id="namebutton">Start Chatting</button>
    </form>-->
    <div class="container main">
        <div class="row chatbox">
            <div class="container">
                <div ng-repeat="message in messages">
                    <div ng-if='message.me === 1'>
                        <div class='mymessagebox container'>
                            <div class="row card text-white bg-dark mb-3 mymessage">
                                <div class="card-header"><strong>You:</strong></div>
                                <div class="card-body">
                                    <p class="card-text">{{message.content}}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                            
                    <div ng-if='message.me === 0'>
                        <div class='messagebox container'>
                            <div class="row card bg-light mb-3 message">
                                <div class="card-header"><strong>{{message.name}}</strong> says:</div>
                                <div class="card-body">
                                    <p class="card-text">{{message.content}}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row input">
                <form:form action="/BioEShop/chat/addMessage" method="POST" modelAttribute="message" id="myform2">
                        <form:input type="text" value="${name}" path="name" hidden ="true"/>
                        <form:input type="text" path="content" class="form-control" id="send" placeholder="Say something"/>
                        <form:button class="btn btn-info">Send</form:button>
                </form:form>
            </div>
        </div>     
     <script>
         const myChat = angular.module("myChat",[]);
//                 .config(['$qProvider', function($qProvider){
//                    $qProvider.errorOnUnhandledRejections(false);
//                }]);
            
          //Configue to http provider.
            myChat.config(['$httpProvider', function ( $httpProvider ) {
                $httpProvider.defaults.useXDomain = true;
                delete $httpProvider.defaults.headers.common['X-Requested-With'];
            }]);
        
            // Added all header request and response.
//            myChat.all('/*', function (request, response, next) {
//                response.header("Access-Control-Allow-Origin", "*");
//                response.header("Access-Control-Allow-Headers", "X-Requested-With");
//                response.header("Access-Control-Allow-Methods", "GET, POST", "PUT", "DELETE");
//                next();
//            });
         
         myChat.controller("MainCtrl",['$scope','$interval', '$http', MainCtrl]);

         function MainCtrl($scope,$interval,$http) {
            const URLget="http://localhost:8084/BioEShop/chat/api/getMessages";
            const URLpost = "http://localhost:8084/BioEShop/chat/api/addMessage";
             const name = document.querySelector("#name");
             const namebutton = document.querySelector("#namebutton");
             const chatbox = document.querySelector("#chatbox");
             const myform = document.querySelector("#myform");
             const myform2 = document.querySelector("#myform2");
             const send = document.querySelector("#send");
             let message;
             
             $interval(reloadMessages,1000);

//             window.addEventListener("load",handleWindowLoad);
//             function handleWindowLoad(){
//                 chatbox.style.display = "none";
//             }

//              myform2.addEventListener("submit",handleSend);
//              function handleSend(e){
//                  e.preventDefault();
//                  if (send.value !== ""){
//                      message = {
//                          name:$scope.nickname,
//                          content:send.value
//                      };
//                      $http({
//                        url: URLpost,
//                        method: "POST",
//                        data: message,
//                        headers: {
//                            'Content-Type': 'application/json; charset=utf-8'
//                        }
//                    });
//                  }
//              }

//             namebutton.addEventListener("click",handleNameInput);
//             function handleNameInput(e){
//                 e.preventDefault();
//                 console.log(name.value);
//                 if (name.value === ""){
//                     alert("Nickname can't be empty");
//                 }else{
//                     console.log("Inside");
//                     $scope.nickname = name.value;
//                     chatbox.style.display = "block";
//                     myform.style.display = "none";
//                     $interval(reloadMessages,1000);
//                 }
//             }
             // message = {name:"Thanos",content:"Hello",loaded:"0,1"}
             // o rest controller na epistrefei mono osa exoun loaded = 0
             // ta prosthetw sti lista me ta messages kai hopefully
             // tha emfanizontai mesa sto chatbox
             
//             $scope.isMine = function isMine(message){
//                 if (message.name ==="${name}"){
//                     return 1;
//                 }else{
//                     return 0;
//                 }
//             };
            

             function reloadMessages(){
                 $http.get(URLget).then(handleJSON);
                 function handleJSON(response){
                     console.log(response.data.messages);
                     if(response.data !== null){
                        $scope.messages=response.data.messages;
                        $scope.messages.forEach((message)=>{
                            if (message.name==="${name}"){
                                message.me=1;
                            }else{
                                message.me=0;
                            }
                            });
                     } 
                 }
             }
         }
     </script>
</body>
</html>