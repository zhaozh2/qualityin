<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>首页</title>
<meta name="decorator" content="cms_default_${site.theme}" />
<meta name="description" content="JeeSite ${site.description}" />
<meta name="keywords" content="JeeSite ${site.keywords}" />
<script type="text/javascript" src="huaxin/common/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="huaxin/common/Marquee.js"></script>
<script
	src="http://webapi.amap.com/maps?v=1.3&key=ed8b0e2710318f9259d17868d73d5fb1"></script>

<style type="text/css">
/* #marquee3 */
.marqueebox {
	position: relative;
}

#marquee3 {
	height: 210px;
	overflow: hidden;
}

#marquee3 ul li {
	float: left;
}

#marquee3 ul li img {
	display: block;
}

#mar3Nav {
	position: absolute;
	right: 10px;
	bottom: 10px;
}

#mar3Nav li {
	float: left;
	margin: 0 3px;
	width: 16px;
	height: 16px;
	background: #333;
	border: 1px solid #FFF;
	cursor: pointer;
	line-height: 16px;
	font-family: Arial;
	font-size: 10px;
	color: #FFF;
	text-align: center;
}

#mar3Nav li.navOn {
	background: #FF6600;
}

.div1 {
	height: 3px;
}

div#roll {
	width: 259px;
	height: 129px;
	position: absolute;
	z-index:9999;
}
</style>

<script type="text/javascript">
	var map;
	var ggRoll;
	var interval;
	$(function() {
		//一次滚动一屏
		$('#marquee3').kxbdSuperMarquee({
			distance : 345,
			time : 4,
			navId : '#mar3Nav',
			direction : 'left'
		});
		/**map = new AMap.Map('mapdiv', {
			resizeEnable : true,
			zoom : 15,
			center : [ 120.727984, 30.74017 ]
		});
		addMarker();**/
		$('#link1').change(function(){ 
			var p1=$(this).children('option:selected').val();//这就是selected的值 
			window.open(p1,"link");//页面跳转并传参 
		}); 
		$('#link2').change(function(){ 
			var p1=$(this).children('option:selected').val();//这就是selected的值 
			window.open(p1,"link");//页面跳转并传参 
		}); 
		$('#link3').change(function(){ 
			var p1=$(this).children('option:selected').val();//这就是selected的值 
			window.open(p1,"link");//页面跳转并传参 
		}); 
		$('#link4').change(function(){ 
			var p1=$(this).children('option:selected').val();//这就是selected的值 
			window.open(p1,"link");//页面跳转并传参 
		}); 
		ggRoll = {
				roll : document.getElementById("roll"),
				speed : 20,
				statusX : 1,
				statusY : 1,
				x : 100,
				y : 300,
				winW : document.documentElement.clientWidth
						- document.getElementById("roll").offsetWidth,
				winH : document.documentElement.clientHeight
						- document.getElementById("roll").offsetHeight,
				Go : function() {
					console.info(1123);
					this.roll.style.left = this.x + 'px';
					this.roll.style.top = this.y + 'px';
					this.x = this.x + (this.statusX ? -1 : 1)
					if (this.x < 0) {
						this.statusX = 0
					}
					if (this.x > this.winW) {
						this.statusX = 1
					}
					this.y = this.y + (this.statusY ? -1 : 1)
					if (this.y < 0) {
						this.statusY = 0
					}
					if (this.y > this.winH) {
						this.statusY = 1
					}
				}
			}
			interval = setInterval("ggRoll.Go()", ggRoll.speed);
			ggRoll.roll.onmouseover = function() {
				clearInterval(interval)
			};
			ggRoll.roll.onmouseout = function() {
				interval = setInterval("ggRoll.Go()", ggRoll.speed)
			};
	});

	function addMarker() {
		marker = new AMap.Marker({
			icon : "http://webapi.amap.com/theme/v1.3/markers/n/mark_b.png",
			position : [ 120.727984, 30.74017 ]
		});
		marker.setMap(map);
	}
	
	function hidegg(){
		$('#roll').hide();
	}
</script>
</head>
<body>
	<div id="roll">
		<div style="float: right; width: 20px; height: 20px; background-color:#fff;position: relative;top: 20px;text-align: center;cursor: pointer;"onclick="hidegg();">X</div>
		<c:forEach items="${fnc:getFlyLink()}" var="flylink">
		<a href="${flylink.href}" style="width:258px;height:129px;cursor: pointer;" ><img border="0" src="${flylink.image}" /></a>
		</c:forEach>
	</div>
	<table width="940" align="center" cellpadding="0">
		<tr>
			<td valign="top"><table width="245" align="right">
					<tr>
						<td><table width="245" align="right">
								<tr>
									<td> 
									<c:forEach items="${categoryList}" var="tpl">
										<c:if test="${tpl.name eq '通知公告' || tpl.name eq '统计分析'}">
								    		<div class="span5" style="width: 245px; margin: 5px 5px 5px -3px; border: solid 1px #ddd; ">
												<h4 style="background: url(huaxin/img/zwgk.png); height: 33px; width: 245px;font-size: 15px;">
													<div style="padding: 10px 15px;">${tpl.name}</div>
												</h4>
												<c:if test="${tpl.module eq 'article'}">
													<ul style="margin: 5px;">
														<c:forEach
															items="${fnc:getArticleList(site.id, tpl.id, 10, '')}"
															var="article">
															<li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a
																href="${ctx}/view-${article.category.id}-${article.id}${urlSuffix}"
																style="color:${article.color}">${fns:abbr(article.title,23)}</a></li>
														</c:forEach>
													</ul>
												</c:if>
												<c:if test="${tpl.module eq 'link'}">
													<ul style="margin: 5px;">
														<c:forEach items="${fnc:getLinkList(site.id, tpl.id, 10, '')}"
															var="link">
															<li><a
																target="_blank" href="${link.href}"
																style="color:${link.color}">${fns:abbr(link.title,23)}</a></li>
														</c:forEach>
													</ul>
												</c:if>
											</div>
									</c:if>
									</c:forEach></td>
								</tr>
								<tr>
									<td><a href="/f/map-1.html"><img src="huaxin/img/zndh.png"  style="position: relative;width: 250px; height: 51px;margin-left: -4px;" /></a></td>
								</tr>
							</table></td>
					</tr>
					<tr>
						<td><table width="245" align="right" cellpadding="0">
								<tr>
									<td><div class="span5" style="width: 245px; margin: 5px 5px 5px -3px; border: solid 1px #ddd;">
												<h4 style="background: url(huaxin/img/zwgk.png); height: 33px; width: 245px;font-size: 15px;">
													<div style="padding: 10px 15px;">站内互动</div>
												</h4>
											<c:forEach items="${categoryList}" var="tpl">
												<c:if test="${tpl.name eq '站内互动'}">
															<div style="width: 100%; float: right;">
																<c:if test="${tpl.module eq 'article'}">
																	<c:forEach
																			items="${fnc:getArticle(tpl.id)}"
																			var="article">
																		<div style="padding: 10px;word-wrap: break-word;">${article.content}</div>
																	</c:forEach>
																</c:if>
															</div>
												</c:if>
											</c:forEach> 
										</div>
									</td>
								</tr>
							</table></td>
					</tr>
				</table></td>
			<td width="690" valign="top"><c:forEach
					items="${categoryList}" var="tpl">
					<c:if
						test="${tpl.inList eq '1' && tpl.module ne '' && tpl.name eq '新闻动态'}">
						<div class="row" style="margin-left: -8px;">
							<div class="span10"
								style="width: 690px; margin: 7px 0 0 6px; border: solid 1px #ddd;">
								<h4
									style="background: url(huaxin/img/picnews.png); height: 33px; width: 100%; color: #fff;">
									<small><a href="${ctx}/list-${tpl.id}${urlSuffix}"
										class="pull-right" style="padding: 9px;">更多</a></small>
									<div style="padding: 4px 20px;">${tpl.name}</div>
								</h4>
								<div style="width: 50%; float: left;">
									<div class="marqueebox">
										<div id="marquee3">
											<ul style="margin: 0px;">
											<c:forEach items="${fnc:getArticleList(site.id, tpl.id, 5, 'image:1')}" var="article">
													<li><a target="_blank" href="${ctx}/view-${article.category.id}-${article.id}${urlSuffix}" title=""><img style="width: 345px; height: 210px;" src="${article.image}" /></a></li>
											</c:forEach>
											</ul>
										</div>
										<div id="mar3Nav"></div>
									</div>
								</div>
								<div style="width: 50%; float: right;">
									<c:if test="${tpl.module eq 'article'}">
										<ul style="margin: 5px;">
											<c:forEach
												items="${fnc:getArticleList(site.id, tpl.id, 10, '')}"
												var="article">
												<li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a
													href="${ctx}/view-${article.category.id}-${article.id}${urlSuffix}"
													style="color:${article.color}">${fns:abbr(article.title,36)}</a></li>
											</c:forEach>
										</ul>
									</c:if>
									<c:if test="${tpl.module eq 'link'}">
										<ul style="margin: 5px;">
											<c:forEach
												items="${fnc:getLinkList(site.id, tpl.id, 10, '')}"
												var="link">
												<li><a
													target="_blank" href="${link.href}"
													style="color:${link.color}">${fns:abbr(link.title,36)}</a></li>
											</c:forEach>
										</ul>
									</c:if>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach> <c:set var="index" value="1" /> <c:forEach items="${categoryList}"
					var="tpl">
					<c:if
						test="${tpl.inList eq '1' && tpl.module ne '' && tpl.name ne '测试栏目' && tpl.name ne '新闻动态'}">
						<c:set var="index" value="${index+1}" />
					${index % 2 eq 0 ? '<div class="row" style="margin-left:-8px;">':''}
			    	<div class="span5"
							style="width: 340px; margin: 8px 0 0 6px; border: solid 1px #ddd; height: 200px;">
							<h4
								style="background: url(huaxin/img/dh.png); height: 33px; width: 340px; color: #fff;">
								<small><a href="${ctx}/list-${tpl.id}${urlSuffix}"
									class="pull-right" style="padding: 9px;">更多</a></small>
								<div style="padding: 4px 20px;">${tpl.name}</div>
							</h4>
							<c:if test="${tpl.module eq 'article'}">
								<ul style="margin: 5px;">
									<c:forEach
										items="${fnc:getArticleList(site.id, tpl.id, 8, '')}"
										var="article">
										<li><span class="pull-right"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></span><a
											href="${ctx}/view-${article.category.id}-${article.id}${urlSuffix}"
											style="color:${article.color}">${fns:abbr(article.title,36)}</a></li>
									</c:forEach>
								</ul>
							</c:if>
							<c:if test="${tpl.module eq 'link'}">
								<ul style="margin: 5px;">
									<c:forEach items="${fnc:getLinkList(site.id, tpl.id, 8, '')}"
										var="link">
										<li><a
											target="_blank" href="${link.href}"
											style="color:${link.color}">${fns:abbr(link.title,36)}</a></li>
									</c:forEach>
								</ul>
							</c:if>
						</div>
			    	${index % 2 ne 0 ? '</div>':''}
				</c:if>
				</c:forEach></td>
		</tr>
	</table>
	<div style="margin-top: 10px; background: #efefef;">
			<div style="height: 22px;padding: 5px">友情链接：</div>
			<table width="940" border="0" align="center" cellspacing="0">
				<tbody>
					<tr>
						<td height="32"><select id="link1">
								<c:forEach items="${fnc:getGoodLinkList(10,1)}" var="category"
									varStatus="status">
									<option value="${category.url}">${category.name}</option>
								</c:forEach>
						</select></td>
						<td><div align="center">
								<select id="link2">
									<c:forEach items="${fnc:getGoodLinkList(10,2)}"
										var="category" varStatus="status">
										<option value="${category.url}">${category.name}</option>
									</c:forEach>
								</select>
							</div></td>
						<td><div align="center">
								<select id="link3">
									<c:forEach items="${fnc:getGoodLinkList(10,3)}"
										var="category" varStatus="status">
										<option value="${category.url}">${category.name}</option>
									</c:forEach>
								</select>
							</div></td>
						<td><div align="center">
								<select id="link4">
									<c:forEach items="${fnc:getGoodLinkList(10,4)}"
										var="category" varStatus="status">
										<option value="${category.url}">${category.name}</option>
									</c:forEach>
								</select>
							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
</body>
</html>