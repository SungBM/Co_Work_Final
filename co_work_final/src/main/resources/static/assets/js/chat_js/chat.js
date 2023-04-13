$(function(){
	myname = $("li.myinfo").find("#my_name").val() 
    let yourid = "";
    let roomNumber = 0;
    const token= $("meta[name='_csrf']").attr("content");
    const header= $("meta[name='_csrf_header']").attr("content");
    $('body > div.main-content > div > div > div.d-lg-flex > div.chat-leftsidebar.me-lg-4 > div > div.py-4.border-bottom > div > div.flex-grow-1 > h5').text(myname);
    let sessionId = '';
    let message = '';
      
    $('.chat-list li').on('dblclick', function(){
      console.log("dblclick");
      yourid = $(this).find("#user_id").val()  //yourid 변수에 현재 클릭한 li 요소 내부에서 id가 "user_id_인 요소의 값(value)을 할당
      yourname = $(this).find("#user_name").val()
      
      $("body > div.main-content > div > div > div.d-lg-flex > div.w-100.user-chat > div > div.p-4.border-bottom > div > div.col-md-4.col-9 > h5").text(yourname);
      
      
      getRoom(yourid); //getRoom() 함수를 호출하여 yourid변수를 인자로 전달

      //ws = new WebSocket("ws://" + location.host + "/cowork/chating/" + roomNumber);
      //====================================위에 지우면 안됨
      //myname
      

	}) //('.chat-list li').on('dblclick', function()
      
//검색
$(document).ready(function(){
	$('#search_word').on('input', function(){
		var value = $(this).val().toLowerCase();
		$(".chat-list li").filter(function(){
	 		$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			
		})
	})
})


//채팅방 있는지 확인하기 

	function getRoom(yourid){
      console.log(yourid);
      $.ajax({
        url: '../chat/getRoom',
        type: 'get',
        data: {yourid : yourid}, //요청 시 함께 보낼 데이터 지정. yourid변수 값을 yourid라는 키로 전달
        success: function(result){ // 0이면 채팅방 없음, 1이면 채팅방 있음
          if(result == 0){
            createRoom(yourid); //createRoom()함수를 호출하여 yourid변수를 인자로 전달
          }else{
            roomNumber = result;  //roomNumber변수에 서버에서 반환된 result 값을 할당
            wsOpen(); //wsOpen()함수를 호출하여 WebSocket을 열고 채팅 기능 초기화
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
        success: function(result){ //서버에서 반환된 응답 데이터가 result 매개변수로 전달됨
          if(result == 0){ // 0이면 연결 실패
             alert("채팅방 생성에 실패했습니다.")
          }else if(result == 1){
             wsOpen(); //wsOpen()함수를 호출하여 웹소켓을 열고 채팅 기능을 초기화한다
          }
        }, error: function(error) {
            console.log("error");
        }
     });//$.ajax
     
			
	} //createRoom()
   
   
	var ws; //웹소켓 객체를 저장할 전역 변수
	
	
	function wsOpen(){
   	  //웹소켓을 열고 서버에 연결한다.
      //웹소켓 전송시 현재 방의 번호를 URL에 포함해서 보낸다.
	ws = new WebSocket("ws://" + location.host + "/cowork/chating/"+roomNumber);
	
	
    function getList(roomNumber){
    	$.ajax({
    	url: '../chat/getList',
    	type: 'post',
    	data: {roomNumber : roomNumber},
    	beforeSend: function (jqXHR, settings) 
        { // 데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
              jqXHR.setRequestHeader(header, token);
        },
        success: function(result){
         $(result).each(function(index, item){
         	if(item.chat_SENDER == myname){
         		let myOutput = '';
		        myOutput += '<li class="right">'
		        myOutput += ' <div class="conversation-list">'
		        myOutput +=       '<div class="ctext-wrap">'
		        myOutput += '<div class="conversation-name">' + item.chat_SENDER +'</div>'
		        myOutput += '<p>'
		        myOutput += item.chat_CONTENT
		        myOutput += '</p>'
		        myOutput += '<p class="chat-time mb-0"><i class="bx bx-time-five align-middle me-1"></i>' +item.chat_DATE+ '</p>'
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
			    yourOutput += item.chat_CONTENT
			    yourOutput += '</p>'
			    yourOutput += '<p class="chat-time mb-0"><i class="bx bx-time-five align-middle me-1"></i>' +item.chat_DATE + '</p>'
			    yourOutput += ' </div>'
			    yourOutput += ' </div>'
			    yourOutput += '</li>'
				console.log("onmessage = " + yourOutput);
     			$("#fix > div.simplebar-wrapper > div.simplebar-mask > div > div > div").append(yourOutput);
      			$(".chat-input").val('');
				}
         })//foreach	
        }, error: function(error) {
            console.log("error");
        }
    	}); //$.ajax
    	
    }  
    getList(roomNumber);

	ws.onmessage = function(data) {
	//웹소켓으로 메시지를 받았을 때 실행될 콜백 함수 정의
	  var msg = data.data;  //서버에서 전달된 메시지 데이터를 가져온다.
	    if(msg != null && msg.trim() != ''){
		  var d = JSON.parse(msg); //메시지 데이터를 JSON 형식으로 파싱
		    if(d.type == "getId"){ //메시지 타입이 getId인 경우(세션 ID를 전달하는 메시지인 경우)
			  var si = d.sessionId != null ? d.sessionId : ""; //전달된 세션 ID값을 가져온다. 값이 없으면 빈 문자열로 처리한다.
				if(si != ''){
					sessionId = si; //전달된 세션 ID값을 sessionid변수에 저장한다.
				}
			}else if(d.type == "message"){ //메시지의 타입이 "message"인 경우(채팅 메시지인 경우)
		       if(d.sessionId == sessionId){ //메시지의 세션ID가 현재 사용자의 세션 ID와 일치하는 경우
		       const content = $(".chat-input").val().trim(); //채팅 입력창의 값을 가져와서 content 변수에 저장
		       
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
				
				console.log("onmessage");
      
			}//else if
			
			    

      
			}//if msg != null
			
			//스크롤바 하단에 고정하기
			var chatContainer = $("#fix > div.simplebar-wrapper > div.simplebar-mask > div > div");
			chatContainer.scrollTop(chatContainer.prop("scrollHeight"));
			
//			function scrollToBottom() {
//  				chatContainer.scrollTop(chatContainer.prop("scrollHeight"));
//			}
			
			// 메시지를 전송하는 로직. 스크롤바를 항상 하단에 고정
//			function sendMessage(message) {
//  				scrollToBottom();
//			}

			
			
	}//onmessage = function(data)
      
	wsEvt(); 
	console.log("wsOpen");
	
	
    }//function wsOpen()
   		 
   		 
   		
    	$("#btnImage").click(function(){
    	let mm ="상대방이 대화방을 나갔습니다. 대화를 종료합니다.";
    	send(mm)
    	
		setTimeout(function(){
			ws.close();
		alert(yourname + "과의 접속을 끊었습니다.");
		$("#fix > div.simplebar-wrapper > div.simplebar-mask > div > div > div").empty();
		}, 2000);
		
	})
	
      
   function wsEvt() {  //wsEvt() 함수 호출(=웹소켓 연결이 열릴때(ws.onOpen이벤트)동작하는 함수 정의
      ws.onopen = function(data){
         //웹소켓이 열릴 때 동작하는 함수 정의
      console.log("onopen");
      }
   }
   
	document.addEventListener("keydown", function(e) {
   let content22 = $(".chat-input").val();
      if (e.key === "Enter") { // enter key
         send(content22);
      const content = $(".chat-input").val().trim(); //$(".chat-input")요소의 값에서 앞뒤 공백을 제거한 후 변수에 저장
      if(!content){
         alert('내용을 입력하세요')
         return false;
      }
      
      
	}//document.addEventListener("keydown", function(e)     
	
	btnSend.onclick = function(){
	   let content = $(".chat-input").val();
	
		send(content);
	}
	
   })//$("#btnSend").on("click", function(){
   
   
   	

      
      
	function send(message) {
      $.ajax({ 
     	url : "../chat/chatSave",  //컨트롤러 주소
     	type : "post",
      	data : {roomNumber: roomNumber, chat_sender: myname, chat_content: message},
      	beforeSend: function (jqXHR, settings) 
        { // 데이터를 전송하기 전에 헤더에 csrf값을 설정합니다.
              jqXHR.setRequestHeader(header, token);
        },
      	async: false,   //끝나고나서 일 처리해라
		success : function(result){
			if(result == 1){
			  console.log("성공");
			}
		}, error: function(error) {
          console.log("저장실패error :" + error);
	  }
	})
      var option ={
 //     	if(msg.value.trim() != ''){
         type: "message", //웹소켓 메시지 타입
         roomNumber: roomNumber.toString(), //현재 방 번호를 문자열로 변환하여 설정
         sessionId :sessionId,
         myname : myname,
         msg : message //입력된 채팅 내용을 가져와서 설정
      }
      if(option.msg != ''){
      ws.send(JSON.stringify(option)) //위에서 설정한 옵션 객체를 JSON 문자열로 변환하여 웹소켓으로 전송
      }
      console.log("roomNumber =" + roomNumber);
      console.log("sessionId =" + sessionId);
      console.log("myname =" + myname);
      console.log(".chat-input =" + message);
     
     
	}//function send()
     
     
  

   
}) //ready


       
