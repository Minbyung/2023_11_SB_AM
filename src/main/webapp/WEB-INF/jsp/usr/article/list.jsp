<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:set var="pageTitle" value="${board.name } 게시판" />
	
	<%@ include file="../common/head.jsp" %>
	
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
		
			<div class="mb-2 text-base">
				<div><span>총 : ${articlesCnt }개</span></div>
			</div>
		
			<div class="table-box-type">
				<table class="table table-lg">
					<thead class="text-lg">
						<tr>
							<th>번호</th>
							<th>작성일</th>
							<th>제목</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="article" items="${articles }">
							<tr class="hover">
								<td>${article.id }</td>
								<td>${article.regDate.substring(2, 16) }</td>
								<td class="hover:underline"><a href="detail?id=${article.id }">${article.title }</a></td>
								<td>${article.writerName }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<c:if test="${rq.getLoginedMemberId() != 0 }">
				<div class="mt-2 flex justify-end">
					<a class="btn-text-color btn btn-outline btn-sm" href="write">글쓰기</a>
				</div>
			</c:if>
			
			<div class="mt-2 flex justify-center">
				<div class="join">
					<c:set var="pageMenuLen" value="5" />
					<c:set var="startPage" value="${page - pageMenuLen >= 1 ? page - pageMenuLen : 1 }" />
					<c:set var="endPage" value="${page + pageMenuLen <= pagesCnt ? page + pageMenuLen : pagesCnt }" />
					
					<c:if test="${page == 1 }">
						<a class="join-item btn btn-sm btn-disabled">«</a>
					</c:if>
					<c:if test="${page > 1 }">
						<a class="join-item btn btn-sm" href="?boardId=${board.id }&page=1">«</a>
					</c:if>
					<c:forEach begin="${startPage }" end="${endPage }" var="i">
						<a class="join-item btn btn-sm ${page == i ? 'btn-active' : '' }" href="?boardId=${board.id }&page=${i } ">${i }</a>
					</c:forEach>
					<c:if test="${page < pagesCnt }">
						<a class="join-item btn btn-sm" href="?boardId=${board.id }&page=${pagesCnt }">»</a>
					</c:if>
					<c:if test="${page == pagesCnt }">
						<a class="join-item btn btn-sm btn-disabled">»</a>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="../common/foot.jsp" %>