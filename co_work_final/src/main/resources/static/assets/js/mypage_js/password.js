   $(function () {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            if (token && header) {
                xhr.setRequestHeader(header, token);
            }
        });

        $("#horizontal-password-input, #horizontal-password-input1, #horizontal-password-input2").keyup(function () {
            var user_password = $("#horizontal-password-input").val();
            var user_password1 = $("#horizontal-password-input1").val();
            var user_password2 = $("#horizontal-password-input2").val();

            $.ajax({
                url: "../member/modiPassProcess",
                type: "post",
                data: {
                    "user_password": user_password,
                    "user_password1": user_password1,
                    "user_password2": user_password2
                },
                success: function (resp) {
                    if (resp.check == 'success') {
                        $("#password").html("<span class='text-success'>현재 비밀번호가 같습니다.</span>")
                        if (resp.newCheck == 'success') {
                            $("#password2").html("<span class='text-success'>새 비밀번호와 같습니다.</span>")
                        } else if (resp.newCheck == 'fail') {
                            $("#password2").html("<span class='text-danger'>새 비밀번호와 다릅니다.</span>")
                        }
                    } else if (resp.check == 'fail') {
                        $("#password").html("<span class='text-danger'>현재 비밀번호가 다릅니다.</span>")
                    }
                    if (resp.check == 'success' && resp.newCheck == 'success')
                        $("button[type=submit]").removeAttr("disabled")
                    else
                        $("button[type=submit]").attr("disabled", "disabled")
                }
            })
        })

        // $("#horizontal-password-input1, #horizontal-password-input2").keyup(function () {
        //     var user_password1 = $("#horizontal-password-input1").val();
        //     var user_password2 = $("#horizontal-password-input2").val();
        //
        //     console.log(user_password1 + " " + user_password2)
        //
        //     $.ajax({
        //         url: "../member/passCheck",
        //         type: "post",
        //         data: {
        //             "user_password1": user_password1,
        //             "user_password2": user_password2
        //         },
        //         success: function (resp) {
        //             if (resp == 'success') {
        //                 $("#password2").html("<span>새 비밀번호와 같습니다.</span>")
        //             } else {
        //                 $("#password2").html("<span>새 비밀번호와 다릅니다. 다시 입력해주세요.</span>")
        //             }
        //         }
        //     })
        // })
    })