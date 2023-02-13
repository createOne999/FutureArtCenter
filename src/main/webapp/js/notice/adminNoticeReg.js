function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('posterIMG').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
	} else {
		document.getElementById('posterIMG').src = "";
	}
}

function check() {
var fileCheck = $("#notice_poster").val();
	if (!fileCheck) {
		alert("모든 항목이 올바르게 입력되어야 합니다.");
		$("#notice_poster").focus();
		return false;
	}
	
	form.submit();
	alert("등록이 완료되었습니다.");
}