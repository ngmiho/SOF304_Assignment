<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/tablib.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />

    <title>Online Entertainment</title>

    <%@ include file="/common/head.jsp" %>
  </head>

  <body>
    <fmt:setLocale value="${sessionScope.lang}" scope="request"/>
    <fmt:setBundle basename="global" scope="request"/>
    
    <!-- ***** Preloader Start ***** -->
    <div id="js-preloader" class="js-preloader">
      <div class="preloader-inner">
        <span class="dot"></span>
        <div class="dots">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>
    </div>
    <!-- ***** Preloader End ***** -->

    <!-- ***** Header Area Start ***** -->
    <%@ include file="/common/header.jsp" %>
    <!-- ***** Header Area End ***** -->

    <!-- ***** Main Area Start ***** -->
    <jsp:include page="${view}"></jsp:include>
    <!-- ***** Main Area End ***** -->

    <%@ include file="/common/footer.jsp" %>
     <%@ include file="/common/java-script.jsp" %>
  </body>
</html>
    