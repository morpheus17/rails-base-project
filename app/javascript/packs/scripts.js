$(window).on("load", function() {
    
    if ($(location).attr("pathname").toLowerCase()=="/"  ){
        console.log("onload landing")
        $('.sticky-navigation').removeClass('navbar-light').addClass('navbar-dark').removeClass('bg-white').addClass('bg-transparent');

    }
});

$(function () {

    // init feather icons
//    feather.replace();

    // init tooltip & popovers
//    $('[data-toggle="tooltip"]').tooltip();
//    $('[data-toggle="popover"]').popover();

    //page scroll
    $('a.page-scroll').bind('click', function (event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1000);
        event.preventDefault();
    });
    
    

    //toggle scroll menu
    $(window).scroll(function () {
        var scroll = $(window).scrollTop();
        
        //adjust menu background
        if ( $(location).attr('pathname').toLowerCase() == "/" || 
            $(location).attr('pathname').toLowerCase() == "/sign_in" || 
            $(location).attr('pathname').toLowerCase() == "/sign_up" ){
        if (scroll >= 100 ) {
            //$('.sticky-navigation').removeClass('navbar-dark').addClass('navbar-light').addClass('bg-white').addClass('shadow-bottom');
            $('.sticky-navigation').removeClass('navbar-dark').addClass('navbar-light').addClass('bg-white').removeClass('bg-transparent');
            //$('.btn-navbar').removeClass('btn-outline-secondary').addClass('btn-primary');
        } else {
            //$('.sticky-navigation').removeClass('navbar-light').removeClass('bg-white').addClass('navbar-dark').removeClass('shadow-bottom');
            $('.sticky-navigation').removeClass('navbar-light').addClass('navbar-dark').removeClass('bg-white').addClass('bg-transparent');
            //$('.btn-navbar').removeClass('btn-primary').addClass('btn-outline-secondary');
        }

        // adjust scroll to top
        if (scroll >= 600) {
            $('.scroll-top').addClass('active');
        } else {
            $('.scroll-top').removeClass('active');
        }
        }
        return false;
    });

    // slick slider
//    $('.slick-reviews').slick({
//        slidesToShow: 1,
//        slidesToScroll: 1,
//        autoplay: true,
//        autoplaySpeed: 4000,
//        dots: true,
//        arrows: false
//    });
    
    // scroll top top
    $('.scroll-top').click(function () {
        $('html, body').stop().animate({
            scrollTop: 0
        }, 1000);
    });

    
});
