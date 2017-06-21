<%--

    The Alluxio Open Foundation licenses this work under the Apache License, version 2.0
    (the "License"). You may not use this work except in compliance with the License, which is
    available at www.apache.org/licenses/LICENSE-2.0

    This software is distributed on an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
    either express or implied, as more fully set forth in the License.

    See the NOTICE file distributed with this work for information regarding copyright ownership.

--%>
<%@ page import="java.util.*" %>
<%@ page import="alluxio.web.*" %>
<%@ page language="java" pageEncoding="UTF-8"%>

<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <jsp:include page="header-links.jsp" />
</head>
<title>Alluxio</title>
<body>
<jsp:include page="header-scripts.jsp" />
<div class="container-fluid">
  <jsp:include page="/header" />

  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12 well">
          <h1 class="text-error">
            <%= request.getAttribute("fatalError") %>
          </h1>
          <table class="table table-hover">
          <thead>
            <th>文件路径</th>
            <th>文件大小</th>
            <th>块容量</th>
            <% if ((Boolean)request.getAttribute("showPermissions")) { %>
              <th>权限</th>
              <th>所有者</th>
              <th>所有者所在组</th>
            <% } %>
            <th>Pin</th>
            <th>创建时间</th>
            <th>修改时间</th>
          </thead>
          <tbody>
            <% if (request.getAttribute("fileInfos") != null) { %>
              <% for (UIFileInfo fileInfo : ((List<UIFileInfo>) request.getAttribute("fileInfos"))) { %>
                <tr>
                  <th><%= fileInfo.getAbsolutePath() %></th>
                  <th><%= fileInfo.getSize() %></th>
                  <th><%= fileInfo.getBlockSizeBytes() %></th>
                  <% if ((Boolean)request.getAttribute("showPermissions")) { %>
                    <th><%= fileInfo.getMode() %></th>
                    <th><%= fileInfo.getOwner() %></th>
                    <th><%= fileInfo.getGroup() %></th>
                  <% } %>
                  <th><%= (fileInfo.isPinned() ? "YES" : "NO") %></th>
                  <th><%= fileInfo.getCreationTime() %></th>
                  <th><%= fileInfo.getModificationTime() %></th>
                </tr>
              <% } %>
            <% } %>
          </tbody>
        </table>

        <%@ include file="pagination-component.jsp" %>

      </div>
    </div>
  </div>

  <%@ include file="footer.jsp" %>
</div>

<!-- where the magic behind dynamic pagination happens -->
<%@ include file="memory-pagination-header.jsp" %>
<%@ include file="pagination-control.jsp" %>

</body>
</html>
