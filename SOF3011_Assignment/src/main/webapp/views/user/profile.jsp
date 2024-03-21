<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/tablib.jsp" %>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="page-content">
			<!-- ***** Profile Start ***** -->
            <div class="main-profile">
                  <div class="row">
                    <div class="col-lg-6 align-self-top">
                      <div class="main-info header-text">
                        <div class="text-start">
                          <form class="custom-form" action="#" method="post">
                            <div class="mb-3">
                              <input
                              	class="w-100"
                                type="text"
                                name="username"
                                placeholder="Username"
                                value="${user.username}"
                              />
                            </div>

                            <div class="mb-3">
                              <input
                              	class="w-100"
                                type="email"
                                name="email"
                                placeholder="Email"
                                value="${user.email}"
                              />
                            </div>

                            <div class="row">
                              <div class="col-6 mb-3">
                              	<button
	                                type="submit"
	                                class="btn rounded-pill w-100"
	                                style="background-color: #e75e8d; color: #fff"
	                              >
	                                Update
	                              </button>
                              </div>
                              
                              <div class="col-6 mb-3">
                              	<button
	                                type="reset"
	                                class="btn btn-outline-info rounded-pill w-100"
	                              >
	                                Cancel
	                              </button>
                              </div>
                              
                              
                              <div class="col-12 mb-3">
                              	<a
	                              	href="change-password"
	                                class="btn rounded-pill me-1 px-4 col-12"
	                                style="background-color: #e75e8d; color: #fff"
	                              >
	                                Change Password
	                              </a>
                              </div>
                            </div>
                          </form>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6 align-self-top">
                      <ul>
                        <li>Watched <span>25</span></li>
                        <li>Like <span>16</span></li>
                        <li>Share <span>5</span></li>
                      </ul>
                    </div>
                  </div>
                </div>
            <!-- ***** Profile Start ***** -->

            <!-- ***** Favorite Start ***** -->
            <div class="video-category most-popular">
              <div class="col-lg-12">
                <div class="featured-games header-text">
                  <div class="heading-section">
                    <h4><em>Your Favorite</em> Videos</h4>
                  </div>
                  <div class="owl-features owl-carousel">
                    <c:forEach var="item" items="${favoriteVideos}">
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
            <!-- ***** Favorite End ***** -->
            
            <!-- ***** History Start ***** -->
            <div class="most-popular">
              <div class="row">
                <div class="col-lg-12">
                  <div class="heading-section">
                    <h4><em>Your History</em> Videos</h4>
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
            <!-- ***** History End ***** -->
          </div>
        </div>
      </div>
    </div>
    
    