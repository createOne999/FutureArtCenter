function regPopUp() {
	window.open("/admin/reg/adminReg", "공연등록", "width=600, height=500, top=50, left=200");
};		
			/*진행중*/
function change_concert(c, number) {
	var result = '#show_c' + number;
	var show_number = '#status_concert' + number;
	var status_ing = $(show_number).val();
	$.ajax({
		type: "get",					//전송방식
		url: "/admin/concert/status", 	//전송페이지
		dataType: "json",
		data: { 'show_status': status_ing, show_status1: c, show_no: number },
		success: function(update) { //전송 성공시 실행될 코드 update=리턴값 받는부분
			alert("통신성공");
			if (update == 1) {
				$(result).text("진행중");

			}
		},
		error: function(XMLHttpRequest, request, error) {
			alert("통신실패" + +request.responseText);
		}
	});
}

function change_media(m, number) {
	var result = '#show_m' + number;
	var show_number = '#status_media' + number;
	var status_ing = $(show_number).val();
	$.ajax({
		type: "get",					//전송방식
		url: "/admin/media/status", 	//전송페이지
		dataType: "json",
		data: { 'show_status': status_ing, show_status1: m, show_no: number },
		success: function(update) { //전송 성공시 실행될 코드
			alert("통신성공");
			if (update == 1) {
				$(result).text("진행중");
			}
		},
		error: function(XMLHttpRequest) {
			alert("통신실패")
		}
	});
}

function change_talk(t, number) {
	var result = '#show_t' + number;
	var show_number = '#status_talk' + number;
	var status_ing = $(show_number).val();
	$.ajax({
		type: "get",				//전송방식
		url: "/admin/talk/status", 	//전송페이지
		dataType: "json",
		data: { 'show_status': status_ing, show_status1: t, show_no: number },
		success: function(update) { //전송 성공시 실행될 코드
			alert("통신성공");
			if (update == 1) {
				$(result).text("진행중");
			}
		},
		error: function(XMLHttpRequest) {
			alert("통신실패");
		}
	});
}
			/*진행중 end*/
			
			/*종료*/ 
function change_concert_End(c, number) {
	var result = '#show_c' + number;
	var show_number = '#status_concert2' + number;
	var status_ing = $(show_number).val();
	$.ajax({
		type: "get",						//전송방식
		url: "/admin/concert/statusEnd", 	//전송페이지
		dataType: "json",
		data: { 'show_status': status_ing, show_status2: c, show_no: number },
		success: function(update) { //전송 성공시 실행될 코드 update=리턴값 받는부분
			alert("통신성공");
			if (update == 1) {
				$(result).text("종료");
			}
		},
		error: function(XMLHttpRequest, request, error) {
			alert("통신실패" + +request.responseText);
		}
	});
}

function change_media_End(m, number) {
	var result = '#show_m' + number;
	var show_number = '#status_media' + number;
	var status_ing = $(show_number).val();
	$.ajax({
		type: "get",					//전송방식
		url: "/admin/media/statusEnd", 	//전송페이지
		dataType: "json",
		data: { 'show_status': status_ing, show_status2: m, show_no: number },
		success: function(update) { //전송 성공시 실행될 코드
			alert("통신성공");
			if (update == 1) {
				$(result).text("종료");
			}
		},
		error: function(XMLHttpRequest) {
			alert("통신실패");
		}
	});
}

function change_talk_End(t, number) {
	var result = '#show_t' + number;
	var show_number = '#status_talk' + number;
	var status_ing = $(show_number).val();
	$.ajax({
		type: "get",					//전송방식
		url: "/admin/talk/statusEnd", 	//전송페이지
		dataType: "json",
		data: { 'show_status': status_ing, show_status2: t, show_no: number },
		success: function(update) { //전송 성공시 실행될 코드
			alert("통신성공");
			if (update == 1) {
				$(result).text("종료");
			}
		},
		error: function(XMLHttpRequest) {
			alert("통신실패");
		}
	});
}
			/*종료 end*/
$(function() {
	var chkObj = document.getElementsByName("checkShow");
	var rowCnt = chkObj.length;

	$("input[name='allCheck']").click(function() {
		var chk_listArr = $("input[name='checkShow']");
		for (var i = 0; i < chk_listArr.length; i++) {
			chk_listArr[i].checked = this.checked;
		}
	});

	$("input[name='checkShow']").click(function() {
		if ($("input[name='checkShow']:checked").length == rowCnt) {
			$("input[name='allCheck']")[0].checked = true;
		}
		else {
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});

function deleteBtn() {
	var url = "delete";
	var valueArr = new Array();
	var list = $("input[name='checkShow']");
	for (var i = 0; i < list.length; i++) {
		if (list[i].checked) {
			valueArr.push(list[i].value);
		}
	}
	if (valueArr.length == 0) {
		alert("선택된 공연이 없습니다.");
	}
	else {
		var chk = confirm("정말 삭제하시겠습니까?");
		$.ajax({
			url: "/admin/media/delete",
			type: 'POST',
			traditional: true,
			async: false,
			data: {
				valueArr: valueArr
			},
			success: function(remove) {
				if (remove = 1) {
					location.replace("/admin/main")

					$.ajax({
						url: "/admin/talk/delete",
						type: 'POST',
						traditional: true,
						async: false,
						data: {
							valueArr: valueArr
						},
						success: function(remove) {
							if (remove = 1) {
								location.replace("/admin/main")

								$.ajax({
									url: "/admin/concert/delete",
									type: 'POST',
									traditional: true,
									async: false,
									data: {
										valueArr: valueArr
									},
									success: function(remove) {
										if (remove = 1) {
											location.replace("/admin/main")
										}
									}
								});
							}
						}
					});
				}
			}
		});
	}
}