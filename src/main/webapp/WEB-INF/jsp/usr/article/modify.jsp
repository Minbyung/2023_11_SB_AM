<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:set var="pageTitle" value="ARTICLE MODIFY" />
	
	<%@ include file="../common/head.jsp" %>
	
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doModify" method="post">
				<input name="id" type="hidden" value="${article.id }"/>
				<div class="table-box-type">
					<table>
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
							<th>작성자</th>
							<td>${article.writerName }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input class="w-96 input input-bordered w-full max-w-xs" name="title" type="text" value="${article.title }" placeholder="제목을 입력해주세요" /></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea class="w-96 input input-bordered w-full max-w-xs" name="body" placeholder="내용을 입력해주세요">${article.body }</textarea></td>
						</tr>
						<tr>
							<td colspan="2"><button class="btn btn-active btn-ghost">수정</button></td>
						</tr>
					</table>
				</div>
			</form>
			
			<div class="btns">
				<button class="btn-text-color btn btn-outline mt-3" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
	
	<%@ include file="../common/foot.jsp" %>