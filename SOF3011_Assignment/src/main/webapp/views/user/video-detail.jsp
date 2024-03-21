<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/tablib.jsp" %>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="page-content">
            <!-- ***** Video Start ***** -->
            <div class="most-popular mt-0">
              <div class="row">
                <div class="col-lg-12">
                  <div class="heading-section">
                    <h4>
                      ${video.title}
                    </h4>
                  </div>
                  <div class="row mb-3">
                    <div class="col-lg-12">
                      <iframe
                        class="rounded"
                        width="100%"
                        height="480px"
                        src="https://www.youtube.com/embed/${video.href }"
                        title='${video.title}'
                        frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                        allowfullscreen
                      ></iframe>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-12">
                      <div class="item">
                        <div class="mb-1">
                          <span
                            class="d-inline-block me-1"
                            style="font-size: 12px"
                            ><i class="fa-regular fa-eye"></i> ${video.views}</span
                          >
                          
                          <span class="d-inline-block" style="font-size: 12px"
                            ><i class="fa-solid fa-share"></i> ${video.shares}</span
                          >
                        </div>

                        <c:if test="${not empty sessionScope.currentUser}">
	                        	<div class="mb-1">
		                          <button
		                            class="btn rounded-pill me-1 px-4"
		                            style="background-color: #e75e8d; color: #fff"
		                            id="likeOrUnlikeBtn"
		                          >
		                            <c:choose>
		                            	<c:when test="${flagLiked == true}">Unlike</c:when>
		                            	<c:otherwise>Like</c:otherwise>
		                            </c:choose>
		                          </button>
		                          <button class="btn btn-outline-info rounded-pill" data-bs-toggle="modal" data-bs-target="#shareModal">
		                            Share
		                          </button>
		                        </div>
	                        </c:if>

                        <div class="mb-1">
                          <h4>
                            Description
                            <br />
                            <span>Category</span>
                            <span
                              >${video.description}</span
                            >
                          </h4>
                        </div>
                        
                        <input type="hidden" id="videoIdHidden" value="${video.href}">
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** Video End ***** -->
            
            <!-- Modal -->
			<div class="modal fade" id="shareModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h3 class="modal-title fs-5 text-dark" id="exampleModalLabel">Share Video To Your Friends</h3>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="closeBtn"></button>
			      </div>
			      <div class="modal-body">
			         <div class="mb-3">
					    <label for="email" class="form-label">Email</label>
					    <input type="text" class="form-control" id="email" name="email">
					  </div>
					   <div class="mb-3">
                        <span class="text-primary" id="message"></span>
                      </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-primary" id="shareBtn">Share</button>
			      </div>
			    </div>
			  </div>
			</div>

            <!-- ***** Related Video Start ***** -->
            <div class="video-category most-popular">
              <div class="col-lg-12">
                <div class="featured-games header-text">
                  <div class="heading-section">
                    <h4><em>Related</em> Videos</h4>
                  </div>
                  <div class="owl-features owl-carousel">
                    <c:forEach var="item" items="${videos}">
	                    <div class="item">
	                        <a href="<c:url value='/video?action=watch&id=${item.href}'/>">
	                          <img src="<c:url value='${item.poster}'/>" alt="" />
	                        </a>
	
	                        <div>
	                          <h4>
	                            <a href="<c:url value='/video?action=watch&id=${item.href}'/>"
	                              >${item.title}</a
	                            ><br /><span>Category</span>
	                          </h4>
	                        </div>
	                        <div>
	                          <span
	                            class="d-inline-block me-1"
	                            style="font-size: 12px"
	                            ><i class="fa-regular fa-eye"></i> ${item.views}</span
	                          >
	                          <span class="d-inline-block" style="font-size: 12px"
	                            ><i class="fa-solid fa-share"></i> ${item.shares}</span
	                          >
	                        </div>
	                      </div>
					</c:forEach>
                </div>
              </div>
            </div>
          </div>
          <!-- ***** Related Video End ***** -->
        </div>
      </div>
    </div>
  </div>
    
    
    

    
  
    