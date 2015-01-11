$(function() {
	
	$(document).ready(function() {
		$('#home-link').addClass('active');
	});
		
		$('#my-parites-link').click(function() {
			$.post('./party/showList.gsp', function(resultadoHTML) {
				$('#contenedor_principal_ajax').html(resultadoHTML);
			});
		});
		
	});