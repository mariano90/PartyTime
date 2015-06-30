$(function() {
	
	$(document).ready(function() {
		$('#home-link').addClass('active');
	});
		
		$('#home-link').click(function() {
			$.post('http://localhost:8080/main/home/principalPage.gsp', function(resultadoHTML) {
				$('#contenedor_principal_ajax').html(resultadoHTML);
			});
		});
		
		$('#new-party-link').click(function() {
			$.post('http://localhost:8080/main/party/organize.gsp', function(resultadoHTML) {
				$('#contenedor_principal_ajax').html(resultadoHTML);
			});
		});
		
		$('#my-parties-link').click(function() {
			$.post('http://localhost:8080/main/party/mine.gsp', function(resultadoHTML) {
				$('#contenedor_principal_ajax').html(resultadoHTML);
			});
		});
		
		$('#my-invitations-link').click(function() {
			$.post('http://localhost:8080/main/party/invited.gsp', function(resultadoHTML) {
				$('#contenedor_principal_ajax').html(resultadoHTML);
			});
		});
		
		$('#my-drinks-link').click(function() {
			$.post('http://localhost:8080/main/drink/mine.gsp', function(resultadoHTML) {
				$('#contenedor_principal_ajax').html(resultadoHTML);
			});
		});
		
		$('#bar-search-link').click(function() {
			$.post('http://localhost:8080/main/bar/byName.gsp', function(resultadoHTML) {
				$('#contenedor_principal_ajax').html(resultadoHTML);
			});
		});
		
		$('#news-link').click(function() {
			$.post('http://localhost:8080/main/news/all.gsp', function(resultadoHTML) {
				$('#contenedor_principal_ajax').html(resultadoHTML);
			});
		});
		
		$('#settings-link').click(function() {
			$.post('http://localhost:8080/main/user/settings.gsp', function(resultadoHTML) {
				$('#contenedor_principal_ajax').html(resultadoHTML);
			});
		});
		
		$('#create_party_button').click(function() {
			$.post('http://localhost:8080/main/user/settings.gsp', function(resultadoHTML) {
				$('#contenedor_principal_ajax').html(resultadoHTML);
			});
		});
			
	});