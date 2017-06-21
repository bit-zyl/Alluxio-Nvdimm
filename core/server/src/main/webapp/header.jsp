<%--

    The Alluxio Open Foundation licenses this work under the Apache License, version 2.0
    (the "License"). You may not use this work except in compliance with the License, which is
    available at www.apache.org/licenses/LICENSE-2.0

    This software is distributed on an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
    either express or implied, as more fully set forth in the License.

    See the NOTICE file distributed with this work for information regarding copyright ownership.

--%>
<%@ page language="java" pageEncoding="UTF-8"%>
<div class="navbar">
  <div class="navbar-inner">
    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </a>
    <a href="http://alluxio.org/" target="_blank" class="brand" ><img style="height:25px;margin-top:-5px;" src="img/logo.png" alt="Alluxio Logo"/></a>
    <div class="nav-collapse collapse">
      <ul class="nav nav-pills">
        <li id="home-li"><a href="./home">信息概述</a></li>
        <% if (request.getAttribute("useWorkerHeader") == null) { %>
          <li id="browse-li"><a href="./browse?path=/">浏览文件系统</a></li>
          <li id="configuration-li"><a href="./configuration">系统配置</a></li>
          <li id="workers-li"><a href="./workers">Workers</a></li>
          <li id="memory-li"><a href="./memory">内存文件</a></li>
        <% } else {%>
          <li id="blockInfo-li"><a href="./blockInfo">块信息</a></li>
        <% } %>
        <li id="browseLogs-li"><a href="./browseLogs">日志文件</a></li>
        <li id="metricsui-li"><a href="./metricsui">统计</a></li>
        <li id="autorefresh-li"><a href="javascript:toggleAutoRefresh();" id="autorefresh-link">打开自动刷新</a></li>
        <% if (request.getAttribute("useWorkerHeader") != null) { %>
          <li id="returnmaster-li"><a href="http://<%=request.getAttribute("masterHost") %>:<%= request.getAttribute("masterPort") %>">返回到Master</a></li>
        <% } %>
      </ul>
    </div>
  </div>
</div>
<script>
  var url = window.location.pathname;
  $("#"+url.substring(1)+"-li").addClass("active");
</script>
