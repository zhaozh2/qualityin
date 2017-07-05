<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>站点地图</title>
<meta name="decorator" content="cms_default_${site.theme}" />
<meta name="description" content="${site.description}" />
<meta name="keywords" content="${site.keywords}" />
<style type="text/css">
dl.map {
	border-top: 0;
}

dl.map dt {
	border-top: 1px solid #efefef;
	padding: 10px 15px;
}

dl.map dd {
	margin: 10px 30px 20px;
}

dl.map span {
	padding: 8px 25px;
}

dl.map span:hover {
	border: 1px solid #efefef;
}

dl.map span a:hover {
	text-decoration: none;
	color: #333;
}

</style>
</head>
<body>
	<dl class="map">
		<div class="span2"><h1 style="margin-bottom: 15px;">网站地图</h1></div>
		<div class="span9">
			<ul class="breadcrumb">
				<li><strong>当前位置：</strong><a href="/f/index-1.html">首页</a></li>
				<li><span class="divider">/</span> <a href="/f/map-1.html">网站导航</a></li>
			</ul>
		</div>
		<table style="border: 1px solid #bbb; width: 100%;" border="0"
			cellspacing="0" cellpadding="0">
			<c:forEach items="${fnc:getMainNavList(site.id)}" var="tpl">
				<tr>
					<td style="text-align: center; padding: 10px; width: 10%;border-bottom: 1px solid #bbb;"><c:choose>
							<c:when test="${not empty tpl.href}">
								<c:choose>
									<c:when test="${fn:indexOf(tpl.href, '://') eq -1}">
										<c:set var="url" value="${ctx}${tpl.href}" />
									</c:when>
									<c:otherwise>
										<c:set var="url" value="${tpl.href}" />
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:set var="url" value="${ctx}/list-${tpl.id}${urlSuffix}" />
							</c:otherwise>
						</c:choose> <a href="${url}" target="_blank"
						style="color: #2fa4e7; font-size: 12px; font-weight: bolder;">${tpl.name}</a></td>
					<td style="width: 90%;border-bottom: 1px solid #bbb;"><c:forEach
							items="${fnc:getCategoryList(site.id, tpl.id, -1, '')}"
							var="category">
							<c:choose>
								<c:when test="${not empty tpl.href}">
									<c:choose>
										<c:when test="${fn:indexOf(tpl.href, '://') eq -1}">
											<c:set var="url" value="${ctx}${tpl.href}" />
										</c:when>
										<c:otherwise>
											<c:set var="url" value="${tpl.href}" />
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<c:set var="url" value="${ctx}/list-${category.id}${urlSuffix}" />
								</c:otherwise>
							</c:choose>
							<span><a href="${url}" target="_blank">${category.name}</a></span>
						</c:forEach></td>
				</tr>
			</c:forEach>

		</table>
	</dl>
</body>
</html>