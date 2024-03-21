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
                    <h4>Change Password</h4>
                  </div>
                  <div class="text-center">
                    <div class="custom-form">
                      <div class="mb-3">
                        <input
                          type="password"
                          id="password"
                          name="password"
                          placeholder="Password"
                        />
                      </div>
                      
                      <div class="mb-3">
                        <input
                          type="password"
                          id="newPassword"
                          name="newPassword"
                          placeholder="New Password"
                        />
                      </div>

                       <div class="mb-3">
                        <span class="text-primary" id="message"></span>
                      </div>

                      <div>
                        <button
                          id="changeBtn"
                          class="btn rounded-pill me-1 px-4"
                          style="background-color: #e75e8d; color: #fff"
                        >
                          Change
                        </button>
                        <button
                          id="cancelBtn"
                          class="btn btn-outline-info rounded-pill"
                        >
                          Cancel
                        </button>
                      </div>
                    </div>
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
    
    
    <script>
    	$('#changeBtn').click(function() {
    		$('#message').text('');
    		
    		var password = $('#password').val();
    		var newPassword = $('#newPassword').val();
    		
    		var formData = {
   				'password': password,
   				'newPassword': newPassword
 			};
    		
    		$.ajax({
    			url: 'change-password',
    			type: 'POST',
    			data: formData
    		}).then(function(data) {
    			$('#message').text('Your password is changed successfully');
    		}).fail(function(error) {
    			$('#message').text('Your password is not correct, please try again');
    		});
    	});
    	
    	$('#cancelBtn').click(function() {
    		$('#message').text('');
    		$('#password').val('');
    		$('#newPassword').val('');
    	});
    
    