	function deptAllCheck() {
		if ($("input[name=deptallcheck]").is(':checked')) {
			$("input[name=dept_no]").prop("checked", true);
		} else {
			$("input[name=dept_no]").prop("checked", false);
		}
	} // deptAllCheck() end

	function jobAllCheck() {
		if ($("input[name=joballcheck]").is(':checked')) {
			$("input[name=job_no]").prop("checked", true);
		} else {
			$("input[name=job_no]").prop("checked", false);
		}
	} // jobAllCheck() end

	$(document).ready(function() {
		// $(function () {
		//     var ordered_items;
		//     onDragClass: "drag",
		//     $('#depttable').tableDnD({
		//         onDrop: function (table, row) {
		//             ordered_items = $.tableDnD.serialize('id');
		//         }
		//     });
		// })

		$("input[type=checkbox]").click(function() {
			var dd = $("[name='dept_no']:checked").length;
			var jj = $("[name='job_no']:checked").length;

			if (dd > 0 && jj == 0) {
				$("#deptdel").prop("disabled", false);
				$("#jobdel").prop("disabled", true);
			} else if (dd > 0 && jj > 0) {
				$("#deptdel").prop("disabled", false);
				$("#jobdel").prop("disabled", false);
			} else if (dd == 0 && jj > 0) {
				$("#deptdel").prop("disabled", true);
				$("#jobdel").prop("disabled", false);
			} else if (dd == 0 && jj == 0) {
				$("#deptdel").prop("disabled", true);
				$("#jobdel").prop("disabled", true);
			}
		}) // checkbox에 따른 삭제버튼 활성화

		$(document).on("click", "input[name=dept_no]", function(e) {
			var chks = document.dept.dept_no;
			var chksChecked = 0;
			for (var i = 0; i < chks.length; i++) {
				var cbox = chks[i];

				if (cbox.checked) {
					chksChecked++;
				}
			}
			if (chks.length == chksChecked) {
				$("input[name=deptallcheck]").prop("checked", true);
			} else {
				$("input[name=deptallcheck]").prop("checked", false);
			}
		})

		$(document).on("click", "input[name=job_no]", function(e) {
			var chks = document.job.job_no;
			var chksChecked = 0;
			for (var i = 0; i < chks.length; i++) {
				var cbox = chks[i];
				if (cbox.checked) {
					chksChecked++;
				}
			}
			if (chks.length == chksChecked) {
				$("input[name=joballcheck]").prop("checked", true);
			} else {
				$("input[name=joballcheck]").prop("checked", false);
			}
		})
		
		$("input[name=dept_name], input[name=job_name]").on('keyup change', function () {
            const dept_name = $("input[name=dept_name]").val();
            const job_name = $("input[name=job_name]").val();
			
            console.log(dept_name + job_name);

            
            $.ajax({
                url: "../admin/comCheck",
                // type: "post",
                data: ({
                	"dept_name" : dept_name,
                	"job_name" : job_name
                }),
                success: function (resp) {
                    console.log("ajax = ");
                    if (resp == 'omg') {
                        $("button[type=submit]").attr("disabled", false);
                    } else if (resp == 'fail' || !img) {
                        $("button[type=submit]").attr("disabled", true);
                    }
                }
            })  // ajax end
        })
		
		
	})