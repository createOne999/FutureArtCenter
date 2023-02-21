<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
 table {
            width: 100%;
            border: 1px solid #444444;
            border-collapse: collapse;
        }
        table th {
            border: 1px solid #444444;
            text-align: center;
            height: 30px;
            background-color: #5C350E;
            color: cornsilk;
        }
        table td {
            border: 1px solid rgba(0, 0, 0, .1);
            text-align: center;
        }   
        
        .reg {
        	color: #ccb6a3;
        	font-weight: bold;
    		font-size: 17px;
        }    
    </style>
  
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>FutureArtCenter</title>
	<link rel="stylesheet" type="text/css" href="/css/faq/adminFaqList.css">
</head>
<body>
<div class="content">
	<div class="well">
		<div class="title">
		    <p class="sub-header">faq 리스트</p>
		</div>
		<div class="reg">
	    	<a href="/admin/faq/register"><button type="button" id="notice_reg">새글 등록</button></a>
	    </div>
    </div>
    <table border="1">

        <tr>
        <th align="center" width="50">번호</th>
		<th align="center" width="320">제목</th>
		<th align="center" width="320">내용</th>
        </tr>
        <c:forEach items="${list}" var="AdminFaqVO">
            <tr>
            <td>${AdminFaqVO.faq_no}</td>
                <td class="txt_ct"><a href="${path}/admin/faq/adminFaqRead?faq_no=${AdminFaqVO.faq_no}">${AdminFaqVO.faq_title}</a></td>
            <td>${AdminFaqVO.faq_content}</td>
            </tr>
        </c:forEach>
    </table>


</div>
</body>
</html>