/*+++++++++++++++++++++
=====================================
 Company Name : Aashdit Technologies LLP
 Author Name : Kishore Kumar Jena
 Version : 1.1
===============================
+++++++++++++++++++*/

jQuery(function($){

'use strict';

$('.datepicker_con>input').datepick({onShow: $.datepick.monthOnly, dateFormat: 'dd/mm/yyyy',yearRange: 'c-100:c+5', showOnFocus: true, 
    showTrigger: '<button type="button" class="trigger">' + 
    '<i class="fa fa-calendar"></i></button>'});


    /***************Top Nav Focus***************/
      $('#accessibilityNav').find('li').each(function(index, element) {
            $(this).children('a').focus(function(e) {
                $(this).parent('li').addClass('menuActive');
            });
        });

        $('#accessibilityNav>li>a').focusin(function(e) {
            $('#accessibilityNav').find('li').each(function(index, element) {
                $(this).removeClass('menuActive');
            });
            $(this).addClass('menuActive');

        });

        $("#accessibilityNav>li:last-child ul li:last-child").focusout(function(e) {
            $("#accessibilityNav>li:last-child").removeClass("menuActive")
        });

        $('#accessibilityNav>li>a').click(function(e) {
            $(this).addClass('menuActive');
            $(this).next('ul').addClass('visible');
        });
    /***************Top Nav Focus***************/


    $(window).scroll(function() {
            if ($(this).scrollTop() > 100) {
                $('.scroll-up').fadeIn();
            } else {
                $('.scroll-up').fadeOut();
            }
    });

    $('.scroll-up a').click(function(){
        $('html, body').animate({scrollTop : 0},800);
        return false;
    });
	
    $('#btn_SkipToContent a[href*="#"]:not([href="#"])').click(function() {
        if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
          var target = $(this.hash);
          target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
          if (target.length) {
            $('html, body').animate({
              scrollTop: target.offset().top
            }, 1000);
            return false;
          }
        }
      });


    $('[data-toggle="tooltip"]').tooltip(); 
    $('[data-toggle="popover"]').popover(); 

    $('#bodyBlack').click(function(){
        $('html').toggleClass('bodyBlackTheme');
    });
    $('#bodyDefault').click(function(){
        $('html').removeClass('bodyBlackTheme');
    });

    $('.documents_tab .nav-tabs>li>a').focus(function (e) {
        e.preventDefault()
        $(this).tab('show')
    });

});

/******************NAV MENU************************/

function getSize(){
var w=window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
if(w>767)
    {
         $(".dropdown").hover(            
                function() {
                    $('.dropdown-menu', this).stop( true, true ).fadeIn("fast");
                    $(this).toggleClass('open');
                    $('b', this).toggleClass("caret caret-up");                
                },
                function() {
                    $('.dropdown-menu', this).stop( true, true ).fadeOut("fast");
                    $(this).toggleClass('open');
                    $('b', this).toggleClass("caret caret-up");                
                });
    }
}
