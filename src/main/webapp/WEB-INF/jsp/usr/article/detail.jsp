<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:set var="pageTitle" value="ARTICLE DETAIL" />
	
	<%@ include file="../common/head.jsp" %>
	
	<script>
		const articleDetail_increaseHitCount = function(){
			$.ajax({
				url: "doIncreaseHitCount",
				method: "get",
				data: {"id": parseInt('${param.id }')},
				dataType: "json",
				success: function(data) {
					$("#increaseHitCount").html(data.data);
				},
				error: function(xhr, status, error) {
					console.error("ERROR : " + status + " - " + error);
				}
			})
		}
		
		$(function(){
			articleDetail_increaseHitCount();
			
// 			setTimeout(articleDetail_increaseHitCount, 3000);
		})
	</script>
	
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<div class="table-box-type">
				<table class="table table-lg">
					<tr>
						<th>번호</th>
						<td>${article.id }</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${article.regDate.substring(2, 16) }</td>
					</tr>
					<tr>
						<th>수정일</th>
						<td>${article.updateDate.substring(2, 16) }</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td><span id="increaseHitCount">${article.hitCount }</span></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${article.writerName }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${article.title }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${article.body }</td>
					</tr>
				</table>
			</div>
			
			<div class="btns mt-2">
				<button class="btn-text-color btn btn-outline btn-sm" onclick="history.back();">뒤로가기</button>
				
				<c:if test="${loginedMemberId != null && loginedMemberId == article.memberId }">
					<a class="btn-text-color btn btn-outline btn-sm" href="modify?id=${article.id }">수정</a>
					<a class="btn-text-color btn btn-outline btn-sm" href="doDelete?id=${article.id }" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;">삭제</a>
				</c:if>
			</div>
		</div>
	</section>
	
	<%@ include file="../common/foot.jsp" %>