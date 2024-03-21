<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/tablib.jsp" %>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="page-content">
            <!-- ***** Video Edit Start ***** -->
            <div class="row">
              <div class="col-lg-12">
                <div class="main-profile">
                  <div class="row">
                    <div class="col-lg-6">
                      <img
                        src="<c:url value='${video.poster}'/>"
                        class="rounded-4 mb-3"
                        id="posterPreview"
                      />
                      <div class="col-lg-12">
                        <ul>
                          <li>View <span>0</span></li>
                          <li>Like <span>0</span></li>
                          <li>Share <span>0</span></li>
                        </ul>
                      </div>
                    </div>
                    <div class="col-lg-6 align-self-start">
                      <div class="main-info header-text">
                        <div class="text-start">
                          <c:url var="url" value="/admin/video"/>
                          <form class="custom-form" action="" method="post">
                            <div class="mb-3">
                              <input
                                class="w-100"
                                type="text"
                                name="title"
                                placeholder="Title"
                                value="${video.title}"
                              />
                            </div>

                            <div class="mb-3">
                              <input
                                class="w-100"
                                type="text"
                                name="href"
                                placeholder="Href"
                                value="${video.href}"
                                ${edit?'readonly':''}
                                id="href"
                              />
                            </div>

                            <div class="mb-3">
                              <input
                                class="w-100"
                                type="text"
                                name="poster"
                                placeholder="Poster"
                                value="${video.poster}"
                                readonly
                                id="poster"
                              />
                            </div>

                            <div class="mb-3">
                              <textarea
                                class="py-3 ps-5 pe-2 rounded-4 border-0 w-100"
                                type="text"
                                rows="4"
                                name="description"
                                placeholder="Description"
                                style="background-color: #27292a; color: #666; font-size: 14px;"
                              >${video.description}</textarea>
                            </div>

                            <div class="mb-4 form-check">
                              <input
                                type="checkbox"
                                class="form-check-input me-2"
                                id="isActive"
                                name="isActive"
                                style="padding: 5px 10px; height: 20px"
                                ${video.isActive ? 'checked' : ''}
                              />
                              <label
                                class="form-check-label"
                                for="isActive"
                                style="color: #666"
                                >Active</label
                              >
                            </div>
                            
                             <p class="text-white mb-3">${message}</p>
                             <input type="hidden" value="${message}" id="message">

                            <div class="row">
                              <div class="col-lg-6 mb-3">
                                <button
                                  type="submit"
                                  class="w-100 btn rounded-pill ${edit?'disabled':''}"
                                  style="background-color: #e75e8d; color: #fff"
                                  formaction="${url}/create"
                                >
                                  Create
                                </button>
                              </div>
                              <div class="col-lg-6 mb-3">
                                <button
                                  class="w-100 btn rounded-pill ${edit?'':'disabled'}"
                                  style="background-color: #e75e8d; color: #fff"
                                  formaction="${url}/update"
                                >
                                  Update
                                </button>
                              </div>
                              <div class="col-lg-6 mb-3">
                                <button
                                  class="w-100 btn rounded-pill ${edit?'':'disabled'}"
                                  style="background-color: #e75e8d; color: #fff"
                                  formaction="${url}/delete"
                                >
                                  Delete
                                </button>
                              </div>
                              <div class="col-lg-6 mb-3">
                                <a
                                  class="w-100 btn btn-outline-info rounded-pill"
                                  href="${url}"
                                >
                                  Cancel
                                </a>
                              </div>
                            </div>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** Video Edit End ***** -->
            
            <!-- ***** Video List Start ***** -->
            <div class="gaming-library profile-library">
              <div class="row">
                <div class="heading-section">
                  <h4><em>Video</em> List</h4>
                  <div class="mb-3">
                    <table class="table table-dark table-striped table-hover">
                      <thead>
                        <tr>
                          <th scope="col">#</th>
                          <th scope="col">Title</th>
                          <th scope="col">Href</th>
                          <th scope="col">Views</th>
                          <th scope="col">Shares</th>
                          <th scope="col">Active</th>
                          <th scope="col">Edit</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<c:forEach var="video" items="${videos}">
                      		<tr class="align-middle">
	                          <th scope="row">${video.id}</th>
	                          <td>${video.title}</td>
	                          <td>${video.href}</td>
	                          <td>${video.views}</td>
	                          <td>${video.shares}</td>
	                          <td>${video.isActive == true ? 'Active' : 'InActive'}</td>
	                          <td>
	                            <a class="btn btn-outline-dark" href="${url}/edit/${video.id}">
	                              <i
	                                class="fa-solid fa-pen-to-square text-light"
	                              ></i>
	                            </a>
	                          </td>
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
          </div>
        </div>
      </div>
    </div>
   
    
  
    