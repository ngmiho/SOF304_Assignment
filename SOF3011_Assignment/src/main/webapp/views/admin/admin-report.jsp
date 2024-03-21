<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/tablib.jsp" %>
    <div class="container">
      <c:url var="url" value="/admin/report"/>
      <div class="row">
        <div class="col-lg-12">
          <div class="page-content">
          <!-- ***** Video List Start ***** -->
            <div class="gaming-library profile-library">
              <div class="row">
                <div class="heading-section">
                  <h4><em>Favorite Video</em> Stats</h4>
                  <div class="mb-3">
                    <table class="table table-dark table-striped table-hover">
                      <thead>
                        <tr>
                          <th scope="col">#</th>
                          <th scope="col">Title</th>
                          <th scope="col">Total Like</th>
                          <th scope="col">Oldest Date</th>
                          <th scope="col">Newest Date</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<c:forEach var="video" items="${likedVideos}">
                      		<tr class="align-middle">
	                          <th scope="row">${video.videoId}</th>
	                          <td><a href="<c:url value='/video?action=watch&id=${video.href}'/>">${video.title}</a></td>
	                          <td>${video.totalLike}</td>
	                          <td><fmt:formatDate value="${video.oldestDate}" pattern="dd-MM-yyyy"/></td>
	                          <td><fmt:formatDate value="${video.newestDate}" pattern="dd-MM-yyyy"/></td>
	                        </tr>
                      	</c:forEach>
                      </tbody>
                    </table>
                  </div>
                  <div class="justify-content-center d-flex">
                    <nav aria-label="Page navigation example">
                      <ul class="pagination">
                        <li class="btn btn-outline-dark rounded mx-1">
                          <a href="#">Previous</a>
                        </li>
                        <li class="btn btn-outline-dark rounded mx-1">
                          <a href="#">1</a>
                        </li>
                        <li class="btn btn-outline-dark rounded mx-1">
                          <a href="#">2</a>
                        </li>
                        <li class="btn btn-outline-dark rounded mx-1">
                          <a href="#">3</a>
                        </li>
                        <li class="btn btn-outline-dark rounded mx-1">
                          <a href="#">Next</a>
                        </li>
                      </ul>
                    </nav>
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** Video List End ***** -->
          
			<!-- ***** User List Start ***** -->
            <div class="gaming-library profile-library">
              <div class="row">
                <div class="heading-section">
                  <h4><em>Favorite User</em> Stats</h4>
                  <form class="mb-3" action="${url}" method="post">
						<div class="row">
							<div class="mb-3 col-10">
								<select class="form-select bg-dark text-white border-0" name="selectedVideoHref">
								  <option selected disabled>Select video</option>
								  <c:forEach var="item" items="${likedVideos}">
								  	<option value="${item.href}">${item.title}</option>
								  </c:forEach>
								</select>
							</div>
							
							<div class="col-2">
				              <button class="btn btn-outline-white text-white w-100" formaction="${url}/favorites">Search</button>
				            </div>
						</div>
						
			            <div class="mb-3">
			              <p>${selectedVideo.title}</p>
			            </div>
                  </form>
                  
                  <div class="mb-3">
                    <table class="table table-dark table-striped table-hover">
                      <thead>
                        <tr>
                          <th scope="col">Username</th>
                          <th scope="col">Email</th>
                          <th scope="col">Liked Date</th>
                        </tr>
                      </thead>
                      <tbody>
                      	 <c:forEach var="user" items="${users}">
                        	<tr>
	                        	<td>${user.username}</td>
	                        	<td>${user.email}</td>
	                        	<td><fmt:formatDate value="${user.likedDate}" pattern="dd-MM-yyyy"/></td>
	                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                  <div class="justify-content-center d-flex">
                    <nav aria-label="Page navigation example">
                      <ul class="pagination">
                        <li class="btn btn-outline-dark rounded mx-1">
                          <a href="#">Previous</a>
                        </li>
                        <li class="btn btn-outline-dark rounded mx-1">
                          <a href="#">1</a>
                        </li>
                        <li class="btn btn-outline-dark rounded mx-1">
                          <a href="#">2</a>
                        </li>
                        <li class="btn btn-outline-dark rounded mx-1">
                          <a href="#">3</a>
                        </li>
                        <li class="btn btn-outline-dark rounded mx-1">
                          <a href="#">Next</a>
                        </li>
                      </ul>
                    </nav>
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** User List End ***** -->
            
            <!-- ***** Video List Start ***** -->
            <div class="gaming-library profile-library">
              <div class="row">
                <div class="heading-section">
                  <h4><em>Share</em> List</h4>
                  <form class="mb-3" action="${url}" method="post">
						<div class="row">
							<div class="mb-3 col-10">
								<select class="form-select bg-dark text-white border-0" name="selectedSharedVideoHref">
								  <option selected disabled>Select video</option>
								  <c:forEach var="item" items="${sharedVideos}">
								  	<option value="${item.href}">${item.title}</option>
								  </c:forEach>
								</select>
							</div>
							
							<div class="col-2">
				              <button class="btn btn-outline-white text-white w-100" formaction="${url}/share">Search</button>
				            </div>
						</div>
						
			            <div class="mb-3">
			              <p>${selectedSharedVideo.title}</p>
			            </div>
                  </form>
                  <div class="mb-3">
                    <table class="table table-dark table-striped table-hover">
                      <thead>
                        <tr>
                          <th scope="col">Username</th>
                          <th scope="col">Sender Email</th>
                          <th scope="col">Receiver Email</th>
                          <th scope="col">Shared Date</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<c:forEach var="video" items="${sharedUserVideos}">
                      		<tr class="align-middle">
	                          <td>${video.username}</td>
	                          <td>${video.senderEmail}</td>
	                          <td>${video.reciverEmail}</td>
	                          <td><fmt:formatDate value="${video.sharedDate}" pattern="dd-MM-yyyy"/></td>
	                        </tr>
                      	</c:forEach>
                      </tbody>
                    </table>
                  </div>
                  <div class="justify-content-center d-flex">
                    <nav aria-label="Page navigation example">
                      <ul class="pagination">
                        <li class="btn btn-outline-dark rounded mx-1">
                          <a href="#">Previous</a>
                        </li>
                        <li class="btn btn-outline-dark rounded mx-1">
                          <a href="#">1</a>
                        </li>
                        <li class="btn btn-outline-dark rounded mx-1">
                          <a href="#">2</a>
                        </li>
                        <li class="btn btn-outline-dark rounded mx-1">
                          <a href="#">3</a>
                        </li>
                        <li class="btn btn-outline-dark rounded mx-1">
                          <a href="#">Next</a>
                        </li>
                      </ul>
                    </nav>
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** Video List End ***** -->
            
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
    
    
    
  