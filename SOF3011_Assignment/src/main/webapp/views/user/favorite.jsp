<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/tablib.jsp" %>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="page-content">
            <!-- ***** Your Favorite Start ***** -->
            <div class="most-popular mt-0 mb-5">
              <div class="row">
                <div class="col-lg-12">
                  <div class="heading-section">
                    <h4><em>Your Favorite</em> Videos</h4>
                  </div>
                  <div class="row">
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
                    <div class="col-lg-12">
                      <div class="main-button">
                        <a href="#">Discover More</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** Your Favorite End ***** -->
            
            <!-- ***** Banner Start ***** -->
            <div class="main-banner">
              <div class="row">
                <div class="col-lg-7">
                  <div class="header-text">
                    <h6>Welcome To Online Entertainment</h6>
                    <h4><em>Browse</em> Our Popular Videos Here</h4>
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** Banner End ***** -->
          </div>
        </div>
      </div>
    </div>
    
    