<%--

    The Alluxio Open Foundation licenses this work under the Apache License, version 2.0
    (the "License"). You may not use this work except in compliance with the License, which is
    available at www.apache.org/licenses/LICENSE-2.0

    This software is distributed on an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
    either express or implied, as more fully set forth in the License.

    See the NOTICE file distributed with this work for information regarding copyright ownership.

--%>
<%@ page import="alluxio.web.*" %>
<%@ page language="java" pageEncoding="UTF-8"%>

<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <jsp:include page="header-links.jsp" />
</head>
<title>Workers</title>
<body>
<jsp:include page="header-scripts.jsp" />
<div class="container-fluid">
  <jsp:include page="/header" />
  <div class="row-fluid">
    <div class="accordion span14" id="accordion1">
      <div class="accordion-group">
        <div class="accordion-heading">
          <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#data1">
            <h4>正在运转的 Workers</h4>
          </a>
        </div>
        <div id="data1" class="accordion-body collapse in">
          <div class="accordion-inner">
            <table class="table table-hover table-condensed">
              <thead>
                <th>节点名称</th>
                <% if ((Boolean) request.getAttribute("debug")) { %>
                  <th>已经运行的时间</th>
                <% } %>
                <th>上次心跳</th>
                <th>状态</th>
                <th>Workers容量</th>
                <th>已经使用的容量</th>
                <th>使用百分比</th>
              </thead>
              <tbody>
                <% for (WebInterfaceWorkersServlet.NodeInfo nodeInfo : ((WebInterfaceWorkersServlet.NodeInfo[]) request.getAttribute("normalNodeInfos"))) { %>
                  <tr>
                    <th><a href="http://<%= nodeInfo.getHost() %>:<%= nodeInfo.getWebPort() %>"><%= nodeInfo.getHost() %></a></th>
                    <% if ((Boolean) request.getAttribute("debug")) { %>
                      <th><%= nodeInfo.getUptimeClockTime() %></th>
                    <% } %>
                    <th><%= nodeInfo.getLastHeartbeat() %></th>
                    <th><%= nodeInfo.getState() %></th>
                    <th><%= nodeInfo.getCapacity() %></th>
                    <th><%= nodeInfo.getUsedMemory() %></th>
                    <th>
                      <div class="progress custom-progress">
                          <div class="bar bar-success" style="width: <%= nodeInfo.getFreeSpacePercent() %>%;">
                            <% if (nodeInfo.getFreeSpacePercent() >= nodeInfo.getUsedSpacePercent()) { %>
                              <%= nodeInfo.getFreeSpacePercent() %>%Free
                            <% } %>
                          </div>
                          <div class="bar bar-danger" style="width: <%= nodeInfo.getUsedSpacePercent() %>%;">
                            <% if (nodeInfo.getFreeSpacePercent() < nodeInfo.getUsedSpacePercent()) { %>
                              <%= nodeInfo.getUsedSpacePercent() %>%Used
                            <% } %>
                          </div>
                      </div>
                    </th>
                  </tr>
                <% } %>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row-fluid">
    <div class="accordion span14" id="accordion2">
      <div class="accordion-group">
        <div class="accordion-heading">
          <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#data2">
            <h4>停止的 Workers</h4>
          </a>
        </div>
        <div id="data2" class="accordion-body collapse in">
          <div class="accordion-inner">
            <table class="table table-hover table-condensed">
              <thead>
                <th>节点名称</th>
                <% if ((Boolean) request.getAttribute("debug")) { %>
                  <th>已经运行的时间</th>
                <% } %>
                <th>上次心跳</th>
                <th>Workers的容量</th>
              </thead>
              <tbody>
                <% if (request.getAttribute("failedNodeInfos") != null) {
                  for (WebInterfaceWorkersServlet.NodeInfo nodeInfo : ((WebInterfaceWorkersServlet.NodeInfo[]) request.getAttribute("failedNodeInfos"))) { %>
                  <tr>
                    <th><a href="http://<%= nodeInfo.getHost() %>:<%= nodeInfo.getWebPort() %>"><%= nodeInfo.getHost() %></a></th>
                    <% if ((Boolean) request.getAttribute("debug")) { %>
                      <th><%= nodeInfo.getUptimeClockTime() %></th>
                    <% } %>
                    <th><%= nodeInfo.getLastHeartbeat() %></th>
                    <th><%= nodeInfo.getCapacity()%></th>
                  </tr>
                <% }} %>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <%@ include file="footer.jsp" %>
</div>
</body>
</html>
