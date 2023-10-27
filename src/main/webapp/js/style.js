$( document ).ready(function(){

$(function(){
        $("#open").show();
        $("#close").hide();
    
	$("#open").click(function(){
		
		$("#navi").slideToggle();
        $("#open").hide();
        $("#close").show();
	});
        
    
	$("#close").click(function(){
		
		$("#navi").slideToggle();
        $("#open").show();
        $("#close").hide();
	});
	
});

$(function () {
    var topBtn = $('#pagetop');
    topBtn.hide();
    
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            topBtn.fadeIn();
        } else {
            topBtn.fadeOut();
        }
    });
    
    topBtn.click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 500);
        return false;
    });
});

$(function(){
	
	$("a[href*=#]:not([href=#])").click(function(){
		
		var target = $($(this).attr("href")).offset().top;
		
		target -= 50;
		
		$("html, body").animate({scrollTop: target}, 500);
		return false;
	});
});

// Headerslider
$(function(){  
    $('.head').vegas({
      slides: [
       { src: '../img/main.jpg' },
       { src: '../img/main2.jpg' },
       { src: '../img/main3.jpg' }
      ],
       delay: 5000,
       timer: true,
       transitionDuration: 3000,
       transition: 'blur', 
    });
  });
 })