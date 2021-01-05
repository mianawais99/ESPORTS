$(document).ready(function () {
	$(window).scroll(function () {
		var scroll = $(window).scrollTop();
		if (scroll > 60) {
			$(".ascroll").css("background", "#0a3041");
			$(".navbar .nav-item .nav-link").css("color", "#ffffff");
			$(".navbar .nav-item:hover .nav-link").css("display", "block");
			$(".navbar").css("border", "#DCAE34 3px solid");
			$(".navbar .nav-item:hover .nav-link").css("background", "#DCAE34");
			$(".navbar-brand").css("color", "#ffffff");
			$(".fixed-bottom").css("border", "#DCAE34 3px solid");
			
		}

		else {
			$(".sticky-top").css("background", "#ffffff");
			$(".navbar .nav-item .nav-link").css("color", "#000000");
			$(".navbar").css("border-top", "0px");
			$(".navbar-brand").css("color", "#000000");
			$(".fixed-bottom").css("border", "0px");
		}
	})
})