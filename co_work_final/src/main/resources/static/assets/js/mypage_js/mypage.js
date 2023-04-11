    $(function () {

        // 정보 변경 시 버튼 활성화
        $("input[name=user_phone], input[name=user_fax], input[type=file]").on('keyup change', function () {
            const phone = $("input[name=user_phone]").val();
            const fax = $("input[name=user_fax]").val();
            const id = $("input[name=user_id]").val();
            const img = $("input[type=file]").val();

            $.ajax({
                url: "../member/updateCheck",
                // type: "post",
                data: ({
                    "user_phone": phone,
                    "user_fax": fax,
                    "user_id": id
                }),
                success: function (resp) {
                    console.log("ajax = " + phone, fax, img);
                    if (resp == 'success' || img) {
                        $("button[type=submit]").attr("disabled", false);
                    } else if (resp == 'fail' || !img) {
                        $("button[type=submit]").attr("disabled", true);
                    }
                }
            })
        }) // 연락처, 팩스번호 바뀌면 정보변경 버튼 활성화 end


    })