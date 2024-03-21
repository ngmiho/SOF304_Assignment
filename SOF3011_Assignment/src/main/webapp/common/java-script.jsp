<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$('#selectVideo').change(function() {
		var videoHref = $(this).val();

		$.ajax({
			url : 'favorites?href=' + videoHref,
			type : 'GET',
			contentType : 'application/json'
		}).done(function(data) {
			$('#tableFavoriteUser').dataTable({
				destroy : true,
				"paging" : false,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : false,
				"info" : false,
				"aaData" : data,
				"columns" : [ {
					"data" : "username"
				}, {
					"data" : "email"
				} ]
			});
		}).fail(function(error) {
			$('#tableFavoriteUser').dataTable().fnClearTable();
		});
	});
</script>

<script>
	$('#likeOrUnlikeBtn').click(function() {
		var videoId = $('#videoIdHidden').val();

		$.ajax({
			url : 'video?action=like&id=' + videoId
		}).then(function(data) {
			var text = $('#likeOrUnlikeBtn').text();

			if (text.indexOf('Like') != -1) {
				$('#likeOrUnlikeBtn').text('Unlike');
			} else {
				$('#likeOrUnlikeBtn').text('Like');
			}
		}).fail(function(error) {
			alert('Opps');
		});
	});

	$('#shareBtn').click(function() {
		var videoId = $('#videoIdHidden').val();
		var email = $('#email').val();

		var formData = {
			'email' : email
		};

		$.ajax({
			url : 'video?action=share&id=' + videoId,
			type : 'GET',
			data : formData
		}).then(function(data) {
			$('#message').text('Share successfully');
		}).fail(function(error) {
			$('#message').text('Share failed');
		});
	});

	$('#closeBtn').click(function() {
		$('#message').text('');
		$('#email').val('');
	});
</script>

<script>
	$('#href').change(
			function() {
				var href = $('#href').val();
				var poster = "https://img.youtube.com/vi/" + href
						+ "/maxresdefault.jpg";
				$('#poster').val(poster);
				$('#posterPreview').attr("src", poster);
			});
</script>