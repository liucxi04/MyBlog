<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>BLOG</title>
    <%
        String context = request.getContextPath();
    %>
    <meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"
          name="viewport">
    <meta name="keywords" content="个人主页,HTML,CSS,JavaScript,jQuery,bootstrap,Tomcat,Servlet,MySQL" />
    <meta name="description" content="个人主页" />
    <link rel="shortcut icon" href="<%=context %>/img/takagi.jpg"/>
    <link rel="stylesheet" href="<%=context %>/css/blog.css"/>
    <link rel="stylesheet" href="<%=context %>/css/page.css">
    <link rel="stylesheet" href="<%=context %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=context %>/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=context %>/css/prism.css">
    <script src="<%=context %>/js/jquery.min.js"></script>
    <script src="<%=context %>/js/blog.js"></script>
    <script src="<%=context %>/js/bootstrap.min.js"></script>
    <script src="<%=context %>/js/prism.js"></script>
</head>
<body>
<div id="bar" class="scrollbar"></div>
<div id="gotop"></div>
<div id="switch">
    <div id="iconfixed">
        <div class="icon"></div>
    </div>
</div>
<div id="left-nav">
    <div class="author-nav">
        <img src="<%=context %>/img/takagi.jpg" alt="个人头像">
    </div>
    <div class="main-nav">
        <ul>
            <a href="<%=context %>/index.html">
                <li>返回主页</li>
            </a>
            <a href="#">
                <li>博客首页</li>
            </a>
            <c:forEach items="${mainCategory}" var="maincatetory">
                <c:if test="${maincatetory.name!='工程'}">
                    <a href="javascript:void(0)" class="havasub">
                        <li>${maincatetory.name }</li>
                    </a>
                    <ul class="submenu">
                        <c:forEach items="${maincatetory.sublist}" var="subcatetory">
                            <a href="<%=context %>/servlet/PostlistServlet?role=0&sub_id=${subcatetory.id}">
                                <li>
                                        ${subcatetory.name}
                                </li>
                            </a>
                        </c:forEach>
                    </ul>
                </c:if>
            </c:forEach>
            <a href="<%=context %>/servlet/PostlistServlet?role=4&main_id=1">
                <li>工程</li>
            </a>
            <a href="<%=context %>/about.html">
                <li>关于我</li>
            </a>
            </a>
            <a href="<%=context %>/servlet/PostlistServlet?role=1">
                <li>控制台</li>
            </a>
        </ul>
    </div>
</div>
<div id="wrap">
    <div id="main">
        <div class="container main-inner">
            <div class="row">
                <c:forEach items="${result.dataList }" var="article">
                    <div class="col-md-8 col-md-offset-2 col-xs-12">
                        <div class="single-title"><h2>${article.title }</h2></div>
                        <div class="single-info">
                            发表于${fn:substring(article.createdate,0,10)}&nbsp;|&nbsp;分类于${article.sname }</div>
                        <div class="single-content">${article.html_content }</div>
                        <br>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
<%--    <footer>--%>
<%--        <div id="block">--%>
<%--            <span id="beian">鲁ICP备18011092号 · </span>--%>
<%--            <span id="demo"></span>--%>
<%--        </div>--%>
<%--        Copyright © 2018 nichang.site <span>托管于阿里云</span>--%>
<%--    </footer>--%>
</div>
</body>
</html>