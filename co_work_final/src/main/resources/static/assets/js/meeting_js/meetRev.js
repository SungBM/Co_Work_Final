// 시작시간 변경시 종료 시간 변경
function startChange() {
    var start = $('#rev_start_time').val();
    var end = $('#rev_end_time').val();

        if (start.substring(3, 5) == '00'){
        	if(start.substring(0,2) < 10){
        		end = 0+String(parseInt(start.substring(0, 2))) + ':30';
        	}else
        		end = String(parseInt(start.substring(0, 2))) + ':30';
        } else if (start.substring(3, 5) == '30'){
        	if(start.substring(0,2) < 9){
        		end = 0+String(parseInt(start.substring(0, 2)) + 1) + ':00';
        	} else
        		end = String(parseInt(start.substring(0, 2)) + 1) + ':00';
        }    
    $('#rev_end_time').val(end);
}