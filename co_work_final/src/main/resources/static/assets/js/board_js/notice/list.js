function go(page){
	const limit = $("#viewcount").val();  //boardList.jsp에 viewcount임.
	const data = `limit=${limit}&state=ajax&page=${page}`;  //object형식. limit, page는 변수라서 ""쓰지않음.
	ajax(data);  //ajax호출
}

//boardList.jsp 쿼리를 ajax로 변경함

//총 2페이지 페이징 처리된 경우
//이전 1 2 다음
//현재 페이지가 1페이지인 경우 아래와 같은 페이징 코드가 필요
//<li class="page-item"><a class="page-link gray">이전&nbsp;</a></li> 1번페이지인 경우 이전에 그레이 표시.
//<li class="page-item active"><a class="page-link">1</a></li> active는 파란색 표시로 1페이지라고 표시해주는거
//<li class="page-item"><a class="page-link" href="javascript:go(2)">2</a></li> 보드리스트로 가면안됌. 자바스크립트 코드로 가게 해야함. 
//<li class="page-item"><a class="page-link" href="javascript:go(2)">다음&nbsp;</a></li>  자바스크립트 함수 go를 실행해라
//											앵커태그에 함수를 호출하고 있으면 ready가 아니라 미리 만들어져 있어야함. 이름있는 함수는 스크립트 처리 전에 미리 싹 읽어들인다.
//											앵커태그에 있는 자바스크립트 함수 쓰려면 레디하기 전 미리 만들어져 있어야한다!!!

//현재 페이지가 2페이지인 경우 아래와 같은 페이징 코드가 필요
//<li class="page-item"><a class="page-link" href="javascript:go(1)">이전&nbsp;</a></li> 이전 누르면 1페이지 자스코드로
//<li class="page-item"><a class="page-link" href="javascript:go(1)">1</a></li>
//<li class="page-item active"><a class="page-link">2</a></li>  2번 액티브 표시. 
//<li class="page-item"><a class="page-link gray">다음&nbsp;</a></li> 다음페이지 없어서 gray

//위와 같은 쿼리(//<li class="page-item"><a class="page-link" href="javascript:go(1)">이전&nbsp;</a></li>)나오는 쿼리


//페이지 이동
function setPaging(href, digit){
	let active="";
	let gray="";
	if(href==""){ //href가 빈문자열인 경우
		if(isNaN(digit)){ //이전&nbsp; 또는 다음&nbsp;
			gray="gray";
		} else {
			active="active";
		}
	}
	let output = `<li class="page-item ${active}">`;
	//let anchor = "<a class='page-link " + gray + "'" + href + ">" + digit + "</a></li>";
	let anchor = `<a class='page-link ${gray}' ${href}>${digit}</a></li>`;
	output += anchor;
	return output;
}//페이지 이동end


function ajax(sdata) {
	console.log(sdata)
	
	$.ajax({
		type : "POST",
		data : sdata,
		url : "NoticeList.bon",
		dataType : "json",  //데이터타입=json이라는 것은 객체화 해서 불러옴.=오브젝트 형식= {}임.
		cache : false,  //브라우저에서 캐시쓰지 않겠다. 정적페이지(항상변함없는 html, css같은거). 브라우저 너 캐시쓰지말고 계쏙해서 업데이트해서 보여줘.
		success : function(data) {  //data=변수명은 내 맘대로
			$("#viewcount").val(data.limit);  //받아온 객체 스트링으로옴. 꺼내오려면 data로 접근. 객체화 한 이름 .data 이 데이터를 data로 접근. 페이지 유지. 
			$("table").find("font").text("등록 : " + data.listcount);
			
			if(data.listcount > 0){ //총 갯수가 0보다 큰 경우
				$("tbody").remove();
				let num = data.listcount - (data.page - 1) * data.limit;  //boardlist.jsp에 <c:set var="num" value="${listcount-(page-1)*limit}" /와 같음
				console.log(num)
				let output = "<tbody>";
				$(data.noticelist).each( //[]안 배열로 되어있는 데이터는 each로 꺼낸다.
					function(index, item){ //배열이다 보니 index있고 객체를 item으로 받아옴. 둘다 변수명이라 내 맘대로.
						output += '<tr><td>' + (num--) + '</td>'   //번호 쿼리
						const blank_count = item.notice_re_lev * 2 + 1;  //답글인 경우 레벨주기. 레벨이 0이면 1, 1이면 3
						let blank = '&nbsp;';
						for(let i = 0; i < blank_count; i++){
							blank += '&nbsp;&nbsp;';
						}
						
						let img="";
						if(item.notice_re_lev > 0){
							img="<img src='image/line.gif'>";
						}
						
						let subject=item.notice_subject;
						if(subject.length>=20){
							subject=subject.substr(0,20) + "..."; //0부터 20개 부분 문자열 추출
						}
						
						output += "<td><div>" + blank + img
						output += ' <a href="NoticeDetailAction.bon?num='+ item.notice_num + '">'
						output += subject.replace(/</g, '&lt;').replace(/>/g,'&gt;')
								+ '</a>[' + item.cnt + ']</div></td>'
						output += '<td><div>' + item.user_id+'</div></td>'
						output += '<td><div>' + item.notice_reg_date+'</div></td>'
						output += '<td><div>' + item.notice_readcount+'</div></td></tr>'
					})
					output += "</tbody>"
					$("table").append(output) 
					//table 완성
					
					//페이징 처리 영역 내용 제거. 만들어놓은 class이름 복붙
					$(".pagination").empty();
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
					
					$(".pagination").append(output)
					} //if(data.listcount) > 0 end
			}, //success end
			error : function(){
				console.log('에러')
			}
		}) //ajax end
} //function ajax end

$(function(){
	$("#write-button").click(function(){		//
		location.href="NoticeWrite.bon";
	})
	
	$("#viewcount").change(function(){
		go(1); //보여줄 페이지를 1페이지로 설정합니다.
	}) //change end
});