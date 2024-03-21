<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <!-- ***** Logo Start ***** -->
                    <a href="<c:url value='/index'/>" class="logo">
                        <h3 style="color: #ec6090; text-align: left;">Online<br> Entertainment</h3>
                    </a>
                    <!-- ***** Logo End ***** -->
                    
                    <!-- ***** Menu Start ***** -->
                    <ul class="nav">
                    	<li><a style="padding: 13px 0" href="<c:url value='?lang=vi'/>"><img style="width: 22px" width="22" height="22" src="https://img.icons8.com/color/22/vietnam.png" alt="vietnam"/></a></li>
                        <li><a style="padding: 13px 0" href="<c:url value='?lang=en'/>"><img style="width: 22px" width="22" height="22" src="https://img.icons8.com/color/22/usa.png" alt="usa"/></a></li>
                    	<c:choose>
                    		<c:when test="${not empty sessionScope.currentUser}">
                    			<c:choose>
                    				<c:when test="${sessionScope.currentUser.isAdmin()}">
                    					<li><a href="<c:url value='/admin/video'/>"><fmt:message key="menu.video"/></a></li>
		                        		<li><a href="<c:url value='/admin/user'/>"><fmt:message key="menu.user"/></a></li>
		                        		<li><a href="<c:url value='/admin/report'/>"><fmt:message key="menu.report"/></a></li>
                    				</c:when>
                    				<c:otherwise>
                    					<li><a href="<c:url value='/favorite'/>"><fmt:message key="menu.favorite"/></a></li>
		                        		<li><a href="<c:url value='/history'/>"><fmt:message key="menu.history"/></a></li>
                    				</c:otherwise>
                    			</c:choose>
                    			
		                        <li><a href="<c:url value='/logout'/>"><fmt:message key="menu.logout"/></a></li>
		                        <li><a href="<c:url value='/profile'/>"><fmt:message key="menu.welcome"/>, ${sessionScope.currentUser.username} <i class="fa-regular fa-user fs-6 p-1"></i></a></li>
                    		</c:when>
                    		<c:otherwise>
                    			<li><a href="<c:url value='/register'/>"><fmt:message key="menu.register"/></a></li>
		                        <li><a href="<c:url value='/forgot-password'/>"><fmt:message key="menu.forgot"/></a></li>
		                        <li><a href="<c:url value='/login'/>"><fmt:message key="menu.login"/> <i class="fa-regular fa-user fs-6 p-1"></i></a></li>
                    		</c:otherwise>
                    	</c:choose>
                    </ul>   
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                    <!-- ***** Menu End ***** -->
                </nav>
            </div>
        </div>
    </div>
  </header>
  <!-- ***** Header Area End ***** -->