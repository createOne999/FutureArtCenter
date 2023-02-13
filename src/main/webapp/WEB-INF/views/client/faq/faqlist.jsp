<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<body>
	<h3 class="mb-3">FAQ</h3>
</body>



<style>
.accordion {
	background-color: #ffffff;
	cursor: pointer;
	padding: 16px;
	width: 100%;
	outline: none;
	border: none;
	text-align: left;
	font-size: 16px;
	transition: 0.4s;
}

.active, .accordion:hover {
	background-color: #f5f5f5;
	font-weight: bold;
}

.accordion:after {
	content: '\002B';
	font-weight: bold;
	float: right;
	margin-left: 5px;
}

.active:after {
	content: "\2212";
}

.panel {
	padding: 0 16px;
	background-color: #ffffff;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
	border-bottom: 1px solid #eeeeee;
}
</style>


<div style="margin-top: 100;">
<c:forEach items="${list}" var="FAQVO">

<button class="accordion"><th>${FAQVO.faq_title}</th></button>
<div class="panel">
	<p style="text-align: left;">${FAQVO.faq_content}</p>
</div>


</div>

</c:forEach>
</div>

<script>
	var acc = document.getElementsByClassName("accordion");
	var i;

	for (i = 0; i < acc.length; i++) {
		acc[i].addEventListener("click", function() {
			this.classList.toggle("active");
			var panel = this.nextElementSibling;
			if (panel.style.maxHeight) {
				panel.style.maxHeight = null;
			} else {
				panel.style.maxHeight = panel.scrollHeight + "px";
			}
		});
	}
</script>