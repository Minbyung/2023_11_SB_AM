<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:set var="pageTitle" value="ARTICLE LIST" />
	
	<%@ include file="../common/head.jsp" %>

	<section class="mt-8 text-xl">
    <div class="container mx-auto px-3">
        <div class="overflow-auto">
            <table class="min-w-full bg-white shadow-md border rounded-md overflow-hidden">
                <thead class="bg-blue-100 text-black border-b border-gray-300">
                    <tr>
                        <th class="py-2 px-4">번호</th>
                        <th class="py-2 px-4">작성일</th>
                        <th class="py-2 px-4">제목</th>
                        <th class="py-2 px-4">작성자</th>
                    </tr>
                </thead>
                <tbody class="text-black">
                    <c:forEach var="article" items="${articles}">
                        <tr class="hover:bg-gray-300 border-b border-gray-300">
                            <td class="py-2 px-4 text-center">${article.id}</td>
                            <td class="py-2 px-4 text-center">${article.regDate.substring(2, 16)}</td>
                            <td class="py-2 px-4 hover:underline">
                                <a href="detail?id=${article.id}" class="text-daisy-500">${article.title}</a>
                            </td>
                            <td class="py-2 px-4 text-center">${article.writerName}</td>
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
    </div>
</section>
	
	<%@ include file="../common/foot.jsp" %>