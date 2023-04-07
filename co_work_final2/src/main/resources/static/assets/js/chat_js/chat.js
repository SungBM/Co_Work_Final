$(function(){
      
      myname = $("li .myinfo").find("#user_name").val() 
      let roomNumber = 0;
      let yourid = "";
      const token= $("meta[name='_csrf']").attr("content");
      const header= $("meta[name='_csrf_header']").attr("content");
      $('#total > div.chat-leftsidebar.me-lg-4 > div > div.py-4.border-bottom > div > div.flex-grow-1 > h5').text(myname);
      
      
//채팅방 있는지 확인하기 

   function getRoom(yourid){
      console.log($("#yourid").val());
      $.ajax({
         url: '../chat/getRoom',
         type: 'get',
         data: {yourid : yourid},
         success: function(result){ // 0이면 채팅방 없음, 1이면 채팅방 있음
            if(result == 0){
               createRoom(yourid);
            }else{
               roomNumber = result;
                wsOpen();
            }
         }, error: function(error) {
            console.log("error");
  }
      });//$.ajax
   } //getRoom()

   
   //createRoom()
   function createRoom(yourid){
      $.ajax({
         url: '../chat/createRoom',
         type: 'post',
         data: {yourid : yourid},
         beforeSend: function (jqXHR, settings) 
         { // 데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
                 jqXHR.setRequestHeader(header, token);
         },
         success: function(result){
            if(result == 0){ // 0이면 연결 실패
               alert("채팅방 생성에 실패했습니다.")
            }else if(result == 1){
               wsOpen();
            }
         }, error: function(error) {
            console.log("error");
            }
      });//$.ajax
      
   } //createRoom()
   
   
   
   var ws;
	console.log("ws="+ws);
	
   function wsOpen(){
      //웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
      ws = new WebSocket("ws://" + location.host + "/cowork/chating/"+roomNumber);
      wsEvt();
      console.log("wsOpen");
   }
      
   function wsEvt() {
      ws.onopen = function(data){
         //소켓이 열리면 동작
      console.log("onopen");
      }
   }
   
   
   
   $('.chat-list li').on('dblclick', function(){
      console.log("dblclick");
      yourid = $(this).find("#user_id").val()
      yourname = $(this).find("#user_name").val()
      
      
      console.log("yourid="+yourid);
      getRoom(yourid);
      ws = new WebSocket("ws://" + location.host + "/cowork/chating/" + roomNumber);
      //====================================위에 지우면 안됨
      //myname
      
      console.log(myname+yourid+yourname);
      
      
   }) //$("#total").on('click', '#userList', function() {    
      
      
/*    document.addEventListener("keydown", function(e){
         if(e.keyCode == 13){ //enter press
            send();
         }
      });
 */  
   
   $("#btnSend").on("click", function(){
       console.log("click");
      const content = $(".chat-input").val().trim();
      if(!content){
         alert('내용을 입력하세요')
         return false;
      }
      
      //현재 시간
      const currentTime = new Date().toLocaleTimeString();
      
      //내 메시지 전송
      let myOutput = '';
      myOutput += '<li class="right">'
      myOutput += ' <div class="conversation-list">'
      myOutput +=       '<div class="ctext-wrap">'
      myOutput += '<div class="conversation-name">' + myname +'</div>'
      myOutput += '<p>'
      myOutput += content 
      myOutput += '</p>'
      myOutput += '<p class="chat-time mb-0"><i class="bx bx-time-five align-middle me-1"></i>' +currentTime+ '</p>'
      myOutput += ' </div>'
      myOutput += ' </div>'
      myOutput += '</li>'
      console.log(myOutput);
      $(".simplebar-content").append(myOutput);
      $(".chat-input").val('');

      
      let yourOutput = '';
      youroutput += ' <div class="conversation-list">'
      youroutput +=       '<div class="ctext-wrap">'
      youroutput += '<div class="conversation-name">' + yourname +'</div>'
      youroutput += '<p>'
      youroutput += content 
      youroutput += '</p>'
      youroutput += '<p class="chat-time mb-0"><i class="bx bx-time-five align-middle me-1"></i>' + currentTime + '</p>'
      youroutput += ' </div>'
      youroutput += ' </div>'
      youroutput += '</li>'
      console.log(yourOutput);
      $(".simplebar-content").append(yourOutput);
      $(".chat-input").val('');
      
      
      
   })  //$("#btnSend").on("click", function(){
      
      
      
      
      function send() {
      var option ={
         type: "message",
         roomNumber: $("#roomNumber").val(),
         sessionId : $("#sessionId").val(),
         myname : $("#myname").val(),
         msg : $(".chat-input").val()
      }
      ws.send(JSON.stringify(option))
   }
      
   
   
}) //ready


       
