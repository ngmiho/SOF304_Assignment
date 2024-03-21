<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/tablib.jsp" %>
<fmt:setBundle basename="index" scope="request"/>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="page-content">
            <!-- ***** Banner Start ***** -->
            <div class="main-banner">
              <div class="row">
                <div class="col-lg-7">
                  <div class="header-text">
                    <h6><fmt:message key="index.welcome"/> Online Entertainment</h6>
                    <h4><em><fmt:message key="index.browse"/></em> <fmt:message key="index.slogan"/></h4>
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** Banner End ***** -->

            <!-- ***** Most Popular Start ***** -->
            <div class="most-popular">
              <div class="row">
                <div class="col-lg-12">
                  <div class="heading-section">
                    <h4><fmt:message key="index.popularVideo"/></h4>
                  </div>
                  <div class="row mb-3">
                  	<c:forEach var="video" items="${videos}">
	                    <div class="col-lg-4 col-md-6 mb-3">
	                      <div class="item h-100">
	                        <a href="<c:url value='/video?action=watch&id=${video.href}'/>">
	                          <img src="<c:url value='${video.poster}'/>" alt="" />
	                        </a>
	
	                        <div>
	                          <h4>
	                            <a href="<c:url value='/video?action=watch&id=${video.href}'/>"
	                              >${video.title}</a
	                            ><br /><span>Category</span>
	                          </h4>
	                        </div>
	                        <div>
	                          <span
	                            class="d-inline-block me-1"
	                            style="font-size: 12px"
	                            ><i class="fa-regular fa-eye"></i> ${video.views}</span
	                          >
	                          <span class="d-inline-block" style="font-size: 12px"
	                            ><i class="fa-solid fa-share"></i> ${video.shares}</span
	                          >
	                        </div>
	                        
	                      </div>
	                    </div>
					</c:forEach>
                  </div>
                  
                  <div class="justify-content-center d-flex">
                    <nav aria-label="Page navigation example">
                      <ul class="pagination">
                        <c:if test="${currentPage == 1}">
                       		<li class="btn btn-outline-dark rounded mx-1 disabled">
	                          <a href="#">Previous</a>
	                        </li>
                        </c:if>
                        <c:if test="${currentPage > 1}">
                       		<li class="btn btn-outline-dark rounded mx-1">
	                          <a href="index?page=${currentPage - 1}"><fmt:message key="index.previous"/></a>
	                        </li>
                        </c:if>
                        
                        
                        
                        <c:forEach varStatus="i" begin="1" end="${maxPage}">
                        	<li class="btn btn-outline-dark rounded mx-1 ${currentPage == i.index ? 'active' : ''}">
	                          <a href="index?page=${i.index}">${i.index}</a>
	                        </li>
                        </c:forEach>
                        
                        <c:if test="${currentPage == maxPage}">
                       		<li class="btn btn-outline-dark rounded mx-1 disabled">
	                          <a href="#">Next</a>
	                        </li>
                        </c:if>
                        <c:if test="${currentPage < maxPage}">
                       		<li class="btn btn-outline-dark rounded mx-1">
	                          <a href="index?page=${currentPage + 1}"><fmt:message key="index.next"/></a>
	                        </li>
                        </c:if>
                      </ul>
                    </nav>
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** Most Popular End ***** -->

            <!-- ***** Video Category Start ***** -->
            <div class="video-category most-popular">
              <div class="col-lg-12">
                <div class="featured-games header-text">
                  <div class="heading-section">
                    <h4><fmt:message key="index.popularCategory"/></h4>
                  </div>
                  <div class="owl-features owl-carousel">
                  	<c:forEach var="category" items="${categories}">
                  		<div class="item">
	                      <div class="text-center">
	                        <h3><a href="#">${category}</a></h3>
	                      </div>
                    	</div>
                  	</c:forEach>
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** Video Category End ***** -->
          </div>
        </div>
      </div>
    </div>
    
    