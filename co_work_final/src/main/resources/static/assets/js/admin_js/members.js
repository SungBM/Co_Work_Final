var user_id = "";
var user_name = "";
var user_dept = "";
var user_job = "";
var user_phone = "";
var user_fax = "";
var user_email = "";

$(document).ready(function () {

    $('#info').on('show.bs.modal', function (event) {
        user_id = $(event.relatedTarget).data('user_id');
        user_name = $(event.relatedTarget).data('user_name');
        user_dept = $(event.relatedTarget).data('user_dept');
        user_job = $(event.relatedTarget).data('user_job');
        user_phone = $(event.relatedTarget).data('user_phone');
        user_fax = $(event.relatedTarget).data('user_fax');
        user_email = $(event.relatedTarget).data('user_email');

        $("#user_name").val(user_name)
        $("#user_id").val(user_id)
        $("#user_dept").val(user_dept)
        $("#user_job").val(user_job)
        $("#user_phone").val(user_phone)
        $("#user_fax").val(user_fax)
        $("#user_email").val(user_email)


        $("#info").on('keyup change', function () {
            user_name = $("#user_name").val()
            user_dept = $("#user_dept :selected").val()
            user_job = $("#user_job :selected").val()
            user_phone = $("#user_phone").val()
            user_fax = $("#user_fax").val()
            user_email = $("#user_email").val()

            $("#modalSubmit").attr("disabled", false);

            // $.ajax({
            //     url: "../admin/updateCheck",
            //     type: "post",
            //     data: ({
            //         "user_name" : user_name,
            //         "user_dept" : user_dept,
            //         "user_job" : user_job,
            //         "user_phone" : user_phone,
            //         "user_fax" : user_fax,
            //         "user_email" : user_email
            //     }),
            //     success: function (resp) {
            //         if (resp == 'success' || img) {
            //             $("button[type=submit]").attr("disabled", false);
            //         } else if (resp == 'fail' || !img) {
            //             $("button[type=submit]").attr("disabled", true);
            //         }
            //     }
            // }) // ajax end
        })

    });

    $(document).on("click", "#stateChange", function () {
        var clickData = $(this).text();
        var fullUser_id = $(this).parents().eq(1).children().eq(1).children().eq(1).text();
        var user_id = fullUser_id.substring(1, fullUser_id.length - 1);
        var user_auth = "";
        var user_state = "";

        if (clickData.trim() == '중지') {
            user_auth = "ROLE_WAIT";
            user_state = "ST";
        } else if (clickData.trim() == '승인') {
            user_auth = "ROLE_MEMBER";
            user_state = "CP";
        } else if (clickData.trim() == '복구') {
            user_auth = "ROLE_MEMBER";
            user_state = "CP";
        }
        if (confirm("정말 중지하시겠습니까?")) {

            $.ajax({
                url: '../admin/stateUpdate',
                data: {
                    "user_id": user_id,
                    "user_auth": user_auth,
                    "user_state": user_state
                },
                complete: function (resp) {
                    location.reload();
                }
            })
        }
    })

});

$(document).on("change", "#user_auth", function (e) {
    var user_auth = $(this).val();
    var user_id = $(this).find('option:selected').attr("value2");

    if (confirm("정말 변경하시겠습니까?")) {
        $.ajax({
            url: '../admin/authUpdate',
            data: {
                "user_id": user_id,
                "user_auth": user_auth
            },
            complete: function (resp) {
                location.reload();
            }
        })
    } else {
        $('#user_auth').attr('selected', true);
        console.log("취소각");
    }
});
