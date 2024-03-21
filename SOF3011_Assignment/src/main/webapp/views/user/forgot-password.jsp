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
                    <h4>Forgot Password</h4>
                  </div>
                  <div class="text-center">
                    <div class="custom-form">
                      <div class="mb-3">
                        <input type="email" id="email" name="email" placeholder="Email" />
                      </div>
                      
                      <div class="mb-3">
                        <span class="text-primary" id="message"></span>
                      </div>

                      <div>
                        <button
                          class="btn rounded-pill me-1"
                          style="background-color: #e75e8d; color: #fff"
                          id="resetPasswordBtn"
                        >
                          Reset Password
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
    	$('#resetPasswordBtn').click(function() {
    		$('#message').text('');
    		
    		var email = $('#email').val();
    		
    		var formData = {'email': email};
    		
    		$.ajax({
    			url: 'forgot-password',
    			type: 'POST',
    			data: formData
    		}).then(function(data) {
    			$('#message').text('Your password is reset, please check your email');
    			setTimeout(function() {
    				window.location.href = 'http://localhost:8080/SOF3011_ASM/index';
    			}, 5000);
    		}).fail(function(error) {
    			$('#message').text('Email is not correct, please try again');
    		});
    	});
    	
    	$('#cancelBtn').click(function() {
    		$('#message').text('');
    		$('#email').val('');
    	});
    </script>
  
    