$(function() {
	
	$(document).ready(function() {
		$('#home-link').addClass('active');
	});
		
		$('#my-parties-link').click(function() {
			$.post('./party/showList.gsp', function(resultadoHTML) {
				$('#contenedor_principal_ajax').html(resultadoHTML);
			});
		});
		
		$('#my-drinks-link').click(function() {
			$.post('./drink/showList.gsp', function(resultadoHTML) {
				$('#contenedor_principal_ajax').html(resultadoHTML);
			});
		});
		
		$('#my_drink').onclick(function() {
			document.getElementById("my_drink").style.width = "500px";
		});

	});