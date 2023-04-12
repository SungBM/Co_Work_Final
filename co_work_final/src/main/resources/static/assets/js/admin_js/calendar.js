
        function startChange() {
            var start = $('#start').val();
            var start1 = $('#start1').val();
            var end = $('#end').val();
            var end1 = $('#end1').val();

            var sDate = $('#datepicker1').val()
            var sDate1 = $('#datepicker3').val()
            var eDate = $('#datepicker2').val()
            var eDate1 = $('#datepicker4').val()

            if (parseInt(start.substring(0, 2)) < 23) {
                if (start.substring(3, 5) == '00')
                    end = start.substring(0, 2) + ':30';
                else if (start.substring(3, 5) == '15')
                    end = start.substring(0, 2) + ':45';
                else if (start.substring(3, 5) == '30')
                    end = 0 + String(parseInt(start.substring(0, 2)) + 1) + ':00';
                else if (start.substring(3, 5) == '45')
                    end = 0 + String(parseInt(start.substring(0, 2)) + 1) + ':15';
            } else if (parseInt(start.substring(0, 2)) == 23) {
                if (start.substring(3, 5) == '00')
                    end = start.substring(0, 2) + ':30';
                else if (start.substring(3, 5) == '15')
                    end = start.substring(0, 2) + ':45';
                else if (start.substring(3, 5) == '30')
                    end = start;
                else if (start.substring(3, 5) == '45')
                    end = start;
            }

            if (parseInt(start1.substring(0, 2)) < 23) {
                if (start1.substring(3, 5) == '00')
                    end1 = start1.substring(0, 2) + ':30';
                else if (start1.substring(3, 5) == '15')
                    end1 = start1.substring(0, 2) + ':45';
                else if (start1.substring(3, 5) == '30')
                    end1 = 0 + String(parseInt(start1.substring(0, 2)) + 1) + ':00';
                else if (start1.substring(3, 5) == '45')
                    end1 = 0 + String(parseInt(start1.substring(0, 2)) + 1) + ':15';
            } else if (parseInt(start1.substring(0, 2)) == 23) {
                if (start1.substring(3, 5) == '00')
                    end1 = start1.substring(0, 2) + ':30';
                else if (start1.substring(3, 5) == '15')
                    end1 = start1.substring(0, 2) + ':45';
                else if (start1.substring(3, 5) == '30')
                    end1 = start1;
                else if (start1.substring(3, 5) == '45')
                    end1 = start1;
            }

            $("#datepicker2").datepicker('setDate', sDate);
            $('#end').val(end);
            $("#datepicker4").datepicker('setDate', sDate1);
            $('#end1').val(end1);
        }

        document.addEventListener('DOMContentLoaded', function () {        		



            // 종일 버튼 클릭시 시간 활성화/비활성화
            $("#allday").click(function () {
                var allday = $(this).prop("checked");
                if (!allday) {
                    $("#start, #end").attr("readonly", false)
                } else {
                    $("#start, #end").attr("readonly", true);
                }
            })  // #allday end
            


            $(document).ready(function () {
                //시작일자 변경 시 종료일자 +30분 설정, 시작날짜 변경 시 종료날짜 변경
                $("#start, #datepicker1").change(function () {
                    startChange();
                })

                // datepicker 시작
                $("#datepicker1, #datepicker2, #datepicker3, #datepicker4").datepicker({
                    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
                    showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                    templates: {
                        leftArrow: '&laquo;',
                        rightArrow: '&raquo;'
                    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
                    showWeekDays: true,// 위에 요일 보여주는 옵션 기본값 : true
                    weekStart: 0,//달력 시작 요일 선택하는 것 기본값은 0인 일요일
                    language: "ko", //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
                    autoclose: true
                });//datepicker end

                // 일정 체크박스에 따른 데이터 표현
                 $("input[type=checkbox][name=cal_type]").change(function () {
                     var cal_type = [];
                     $("input[type=checkbox][name=cal_type]:checked").each(function (i) {
                         cal_type.push($(this).val());
                     })
                     console.log(cal_type)
                
                     $.ajax({
                         url: '../member/calSelect',
                         data: {
                             "cal_type": cal_type
                         },
                         traditional: true,
                         success: function (resp) {
                             calendar.render(resp);
                         }
                     }) // ajax end
                 }) // change end
                 
                 // form null check
                 $("form[name=addForm]").submit(function(e){
                	 var subject = $("#cal_title").val();
                	 var content = $("#cal_content").val();
                	 console.log(subject + " " + content)
                	 if(subject == null || subject == ""){
                		 alert("제목을 입력하세요.");
                		 return false;
                	 } else if(content == null || content == ""){
                		 alert("내용을 입력하세요.");
                		 return false;
                	 }
                	 
                 })
                 
            }) // document end
        }) // addEventListener end