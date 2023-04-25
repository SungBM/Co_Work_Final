
function go(page){
   const limit = $('#viewcount').val();  //noticeList.jsp에 viewcount임.
//   const search_field = $('#search_field').val();
//   const search_word = $('#search_word').val();
   const data = `limit=${limit}&state=ajax&page=${page}`;  //object형식. limit, page는 변수라서 ""쓰지않음.
   ajax(data);  //ajax호출
}

function setPaging(href, digit){
	let active="";
	let gray="";
	if(href==""){ //href가 빈문자열인 경우
		if(isNaN(digit)){ //이전&nbsp; 또는 다음&nbsp;
		gray="gray";
	}else{
		active="active";
	}
}
let output = `<li class="page-item ${active}">`;
//let anchor = "<a class='page-link " + gray + "'" + href + ">" + digit + "</a></li>";
let anchor = `<a class='page-link ${gray}' ${href}>${digit}</a></li>`;
output += anchor;
return output;
}

//url주소 변경하고, item.뒤에 붙은 이름들 인터넷 주소창에 board/list_ajax 들어가서 이름 값 확인하고 변경해줘야함
//item이 boardlist임. board_list.jsp랑 비교해가면서 해석해보기
function ajax(data){
	console.log(data)
	let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");
	output="";
	
	$.ajax({
      type : "post",
      data : data,   //위에 ajax매개변수 타입과 같은 것
      url : "freeBoardList_ajax",
      dataType : "json",  //데이터타입=json이라는 것은 객체화 해서 불러옴.=오브젝트 형식= {}임.
      cache : false,  //브라우저에서 캐시쓰지 않겠다. 정적페이지(항상변함없는 html, css같은거). 브라우저 너 캐시쓰지말고 계쏙해서 업데이트해서 보여줘.
      beforeSend : function(xhr)
        {   //데이터를 전송하기 전에 헤더에 csrf값을 설정합니다. ajax도 토큰 요청한다.
           xhr.setRequestHeader(header, token);      
        },
      success : function(data){  //data=변수명은 내 맘대로
         $("viewcount").val(data.limit);  //받아온 객체 스트링으로옴. 꺼내오려면 data로 접근. 객체화 한 이름 .data 이 데이터를 data로 접근. 페이지 유지. 
         //$("table").find("font").text("글 개수 : " + data.listcount);
         $("thead").find("span").text("글 개수 : " + data.listcount);
         
         if(data.listcount > 0){ //총 갯수가 0보다 큰 경우
            $("tbody").remove();
            let num = data.listcount - (data.page - 1) * data.limit;  //noticelist.jsp에 <c:set var="num" value="${listcount-(page-1)*limit}" /와 같음
            console.log(num)
            let output = "<tbody>";
            $(data.freeboardlist).each( //[]안 배열로 되어있는 데이터는 each로 꺼낸다.
               function(index, item){ //배열이다 보니 index있고 객체를 item으로 받아옴. 둘다 변수명이라 내 맘대로.
                  output += '<tr><td>' + (num--) + '</td>'   //번호 쿼리
                  const blank_count = item.freeboard_RE_LEV * 2 + 1;  //답글인 경우 레벨주기. 레벨이 0이면 1, 1이면 3
                  let blank = '&nbsp;';
                  for(let i = 0; i < blank_count; i++){
                     blank += '&nbsp;&nbsp;';   //빈칸 두개
                  }
                  
                  let img="";
                  if(item.freeboard_RE_LEV > 0){
                  	img="<img src='/cowork/resources/assets/images/board/line.gif'>";
                  }
                  
                  let subject=item.freeboard_SUBJECT.replace(/</g, '&lt;')
                  subject=subject.replace(/>/g, '&gt;')
                  
                  output += "<td>" + blank + img
                  output += ' <a href="detail?num='+ item.freeboard_NUM + '">'
                  output += subject + '<span class="gray small">[' + item.cnt + ']</span></a></td>'  //브라우저에서 cnt넘어가는 값 꼭 확인! 대문자 말고 소문자로 넘어감.
                  output += '<td><div>' + "co-work" +'</div></td>'
                  output += '<td><div>' + item.freeboard_DATE+'</div></td>'
                  output += '<td><div>' + item.freeboard_READCOUNT+'</div></td></tr>'
               })
               output += "</tbody>"
               $('table').append(output) //table 완성
               
               $(".pagination").empty(); //페이징 처리 영역 내용 제거. 만들어놓은 class이름 복붙
               output = "";
               
               let digit = '이전&nbsp;'
					let href="";
					if(data.page > 1){
						href = 'href=javascript:go(' + (data.page -1) + ')';
					}	
					output += setPaging(href, digit);
					
					for(let i = data.startpage; i<=data.endpage; i++){  //forEach문
						digit = i;
						href="";
						if(i != data.page){
							href = 'href=javascript:go(' + i + ')';
						}
						output += setPaging(href, digit);
					}
					
					digit = '&nbsp;다음&nbsp;';
					href="";
					if(data.page < data.maxpage){
						href='href=javascript:go(' + (data.page + 1) + ')';
					}	
					output += setPaging(href, digit);
					
					$('.pagination').append(output)
					} //if(data.listcount) > 0 end
			}, //success end
			error : function(){
				console.log('에러')
			}
		}) //ajax end
} //function ajax end


$(function(){
	$("button").click(function(){
		location.href="freeWrite";
	})
	
	$("#viewcount").change(function(){
		go(1);
	});

})