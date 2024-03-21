<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/tablib.jsp" %>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="page-content">
            <!-- ***** User Edit Start ***** -->
            <div class="row">
              <div class="col-lg-12">
                <div class="main-profile">
                  <div class="row">
                    <div class="col-lg-6 align-self-start">
                      <div class="main-info header-text">
                        <div class="text-start">
                          <c:url var="url" value="/admin/user"/>
                          <form class="custom-form" action="${url}" method="post">
                            <div class="mb-3">
                              <input
                                class="w-100"
                                type="text"
                                name="username"
                                placeholder="Username"
                                value="${user.username}"
                                ${edit?'readonly':''}
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

                            <div class="mb-3">
                              <input
                                class="w-100"
                                type="password"
                                name="password"
                                placeholder="Password"
                                value="${user.password}"
                              />
                            </div>
                            
                            <div class="row mb-4">
                            	<div class="col-6 form-check">
	                              <input
	                                type="checkbox"
	                                class="form-check-input me-2 ms-2"
	                                id="isActive"
	                                name="isActive"
	                                ${user.isActive() ? 'checked' : ''}
	                                style="padding: 5px 10px; height: 20px"
	                              />
	                              <label
	                                class="form-check-label"
	                                for="isActive"
	                                style="color: #666"
	                                >Active</label
	                              >
	                            </div>
	                            
	                            <div class="col-6 form-check">
	                              <input
	                                type="checkbox"
	                                class="form-check-input me-2"
	                                id="isAdmin"
	                                name="isAdmin"
	                                ${user.isAdmin() ? 'checked' : ''}
	                                style="padding: 5px 10px; height: 20px"
	                              />
	                              <label
	                                class="form-check-label"
	                                for="isAdmin"
	                                style="color: #666"
	                                >Admin</label
	                              >
	                            </div>
                            </div>
                            
                            <p class="text-white mb-3">${message}</p>

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
                    
                    <div class="col-lg-6">
                      <div class="col-lg-12">
                        <ul>
                          <li>Watched <span>0</span></li>
                          <li>Like <span>0</span></li>
                          <li>Share <span>0</span></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** User Edit End ***** -->
            
            <!-- ***** User List Start ***** -->
            <div class="gaming-library profile-library">
              <div class="row">
                <div class="heading-section">
                  <h4><em>User</em> List</h4>
                  <div class="mb-3">
                    <table class="table table-dark table-striped table-hover">
                      <thead>
                        <tr>
                          <th scope="col">#</th>
                          <th scope="col">Username</th>
                          <th scope="col">Email</th>
                          <th scope="col">Role</th>
                          <th scope="col">Active</th>
                          <th scope="col">Edit</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<c:forEach var="user" items="${users}">
                      		<tr class="align-middle">
	                          <th scope="row">${user.id}</th>
	                          <td>${user.username}</td>
	                          <td>${user.email}</td>
	                          <td>${user.isAdmin() == true ? 'Admin' : 'User'}</td>
	                          <td>${user.isActive() == true ? 'Active' : 'InActive'}</td>
	                          <td>
	                            <a class="btn btn-outline-dark" href="${url}/edit/${user.id}">
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
            <!-- ***** User List End ***** -->
          </div>
        </div>
      </div>
    </div>
    
    