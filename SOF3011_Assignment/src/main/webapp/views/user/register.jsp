<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/tablib.jsp" %>
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="page-content">
            <!-- ***** Login Start ***** -->
            <div class="most-popular mt-0 mb-5">
              <div class="row">
                <div class="col-lg-12">
                  <div class="heading-section text-center">
                    <h4>Register</h4>
                  </div>
                  <div class="text-center">
                    <form class="custom-form" action="register" method="post">
                      <div class="mb-3">
                        <input
                          type="text"
                          name="username"
                          placeholder="Username"
                        />
                      </div>

                      <div class="mb-3">
                        <input type="email" name="email" placeholder="Email" />
                      </div>

                      <div class="mb-3">
                        <input
                          type="password"
                          name="password"
                          placeholder="Password"
                        />
                      </div>

                      <div class="mb-3">
                        <input
                          type="password"
                          name="confirmPassword"
                          placeholder="Confirm Password"
                        />
                      </div>

                      <div>
                        <button
                          type="submit"
                          class="btn rounded-pill me-1 px-4"
                          style="background-color: #e75e8d; color: #fff"
                        >
                          Register
                        </button>
                        <button
                          type="reset"
                          class="btn btn-outline-info rounded-pill"
                        >
                          Cancel
                        </button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
            <!-- ***** Login End ***** -->

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
    
    