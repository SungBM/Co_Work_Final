$(function(){
      
      myname = $("li .myinfo").find("#user_name").val() 
      let yourid = "";
      let roomNumber = 0;
      const token= $("meta[name='_csrf']").attr("content");
      const header= $("meta[name='_csrf_header']").attr("content");
      $('#total > div.chat-leftsidebar.me-lg-4 > div > div.py-4.border-bottom > div > div.flex-grow-1 > h5').text(myname);
      let sessionId = '';
      
      
    $('.chat-list li').on('dblclick', function(){
      console.log("dblclick");
      yourid = $(this).find("#user_id").val()
      yourname = $(this).find("#user_name").val()
      $("#total > div.w-100.user-chat > div > div.w-100.user-chat > div > div.p-4.border-bottom > div > div.col-md-4.col-9 > h5").text(yourname);
      
      
      getRoom(yourid);
      //ws = new WebSocket("ws://" + location.host + "/cowork/chating/" + roomNumber);
      //====================================위에 지우면 안됨
      //myname
      
      
      
      
      	
      
   }) //('.chat-list li').on('dblclick', function(){
      
//채팅방 있는지 확인하기 

   function getRoom(yourid){
      console.log(yourid);
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
	
   function wsOpen(){
      //웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
      ws = new WebSocket("ws://" + location.host + "/cowork/chating/"+roomNumber);
      
      
     ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						sessionId = si;
					}
				}else if(d.type == "message"){
					
					
      if(d.sessionId == sessionId){
      const content = $(".chat-input").val().trim();
       let currentTime = new Date().toLocaleTimeString();
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
      $("#fix > div.simplebar-wrapper > div.simplebar-mask > div > div > div").append(myOutput);
      $(".chat-input").val('');
						//$("#chating").append("<p class='me'>나 :" + d.msg + "</p>");	
					}else{
						let yourOutput = '';
				let currentTime = new Date().toLocaleTimeString();
	 yourOutput += '<li>'
      yourOutput += ' <div class="conversation-list">'
      yourOutput +=       '<div class="ctext-wrap">'
      yourOutput += '<div class="conversation-name">' + yourname +'</div>'
      yourOutput += '<p>'
      yourOutput += d.msg
      yourOutput += '</p>'
      yourOutput += '<p class="chat-time mb-0"><i class="bx bx-time-five align-middle me-1"></i>' + currentTime + '</p>'
      yourOutput += ' </div>'
      yourOutput += ' </div>'
      yourOutput += '</li>'
						console.log("onmessage = " + yourOutput);
     					 $("#fix > div.simplebar-wrapper > div.simplebar-mask > div > div > div").append(yourOutput);
      					$(".chat-input").val('');
					}
      
				}//else if
			}//if msg != null
			
			console.log($(".chat-conversation.p-3 ul").height());
			$(".chat-conversation.p-3").animate({ scrollTop: $(".chat-conversation.p-3 ul").height() }, "fast");
			
		}//onmessage = function(data)
      
      
      
      wsEvt();
      console.log("wsOpen");
   }
      
   function wsEvt() {
      ws.onopen = function(data){
         //소켓이 열리면 동작
      console.log("onopen");
      }
   }
   
   
   document.addEventListener("keydown", function(e) {
    if (e.key === "Enter") { // enter key
       send();
      const content = $(".chat-input").val().trim();
      if(!content){
         alert('내용을 입력하세요')
         return false;
      }
      
      
      
	}     
      
   })  //$("#btnSend").on("click", function(){
      
      
      
      
      
      function send() {
      var option ={
         type: "message",
         roomNumber: roomNumber.toString(),
         sessionId :sessionId,
         myname : myname,
         msg : $(".chat-input").val()
      }
      ws.send(JSON.stringify(option))
      console.log("roomNumber =" + roomNumber);
      console.log("sessionId =" + $("#sessionId").val());
      console.log("myname =" + myname);
      console.log(".chat-input =" + $(".chat-input").val());
      
   }
      
   
   
}) //ready


       
