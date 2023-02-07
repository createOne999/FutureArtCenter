$(function() {
	$("#one_start").timepicker({
		timeFormat: 'h:mm p',
		interval: 60,
		minTime: '10',
		maxTime: '6:00pm',
		defaultTime: '10',
		startTime: '10:00',
		dynamic: false,
		dropdown: true,
		scrollbar: true
	});
});

$(function() {
	$("#one_end").timepicker({
		timeFormat: 'h:mm p',
		interval: 60,
		minTime: '10',
		maxTime: '6:00pm',
		defaultTime: '10',
		startTime: '10:00',
		dynamic: false,
		dropdown: true,
		scrollbar: true
	});
});

$(function() {
	$("#two_start").timepicker({
		timeFormat: 'h:mm p',
		interval: 60,
		minTime: '10',
		maxTime: '6:00pm',
		defaultTime: '00',
		startTime: '10:00',
		dynamic: false,
		dropdown: true,
		scrollbar: true
	});
});

$(function() {
	$("#two_end").timepicker({
		timeFormat: 'h:mm p',
		interval: 60,
		minTime: '10',
		maxTime: '6:00pm',
		defaultTime: '00',
		startTime: '10:00',
		dynamic: false,
		dropdown: true,
		scrollbar: true
	});
});

function setDisplay() {
	if ($('input:radio[id=round1]').is(':checked')) {
		$('#show_choice2').hide();

	} else {
		$('#show_choice2').show();
	}
}

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

//등록버튼 클릭시 검사
function check() {
	var nameCheck = $("#show_name").val();
	if (!nameCheck) {
		alert("모든 항목이 올바르게 입력되어야 합니다.");
		$("#show_name").focus();
		return false;
	}

	var userCheck = $("#talk_user").val();
	if (!userCheck) {
		alert("모든 항목이 올바르게 입력되어야 합니다.");
		$("#talk_user").focus();
		return false;
	}

	var subCheck = $("#talk_subject").val();
	if (!subCheck) {
		alert("모든 항목이 올바르게 입력되어야 합니다.");
		$("#talk_subject").focus();
		return false;
	}

	var fileCheck = $("#show_poster").val();
	if (!fileCheck) {
		alert("모든 항목이 올바르게 입력되어야 합니다.");
		$("#show_poster").focus();
		return false;
	}

	var content1Check = $("#show_content1").val();
	if (!content1Check) {
		alert("모든 항목이 올바르게 입력되어야 합니다.");
		$("#show_content1").focus();
		return false;
	}

	var content2Check = $("#show_content2").val();
	if (!content2Check) {
		alert("모든 항목이 올바르게 입력되어야 합니다.");
		$("#show_content2").open();
		return false;
	}

	form.submit();
	alert("등록이 완료되었습니다.");
}



