	$(function() {
		$(".bx-trash").click(function(e) {
			if (!confirm("정말 삭제하시겠습니까?")) {
				e.preventDefault();
			}
		})
	})

	function movePage(uri, queryString) {
		console.log(uri);
		console.log(queryString);
		location.href = uri + queryString;
	}