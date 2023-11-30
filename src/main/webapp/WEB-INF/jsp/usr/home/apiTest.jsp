<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../common/head.jsp" %>

<script>
	async function getData() {
		const API_KEY = 'sd2%2Fw1FPMP7dCiLT1r8GNJatfwBCKhZfFVQAA3lNV55hr4o2tNP9B0NpNBn7iAGvAN8QwKTBfli73H%2Fdq7xZBw%3D%3D';
		const url = 'http://apis.data.go.kr/3740000/suwonEvChrstn/getdatalist?serviceKey=' + API_KEY + '&type=json';
		
		const response = await fetch(url);
		const data = await response.json();
		
		$('.test').empty().html(data.items[0].chrstnNm);
	}
	getData();
</script>

<div>APITEST</div>
<div class="test"></div>