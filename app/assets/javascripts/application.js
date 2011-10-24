// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.iphone-switch
//= require jquery.easing
//= require cufon-yui
//= require_tree .

Cufon.replace('nav ul li a',
{
    fontFamily: 'Eurostile',
    fontWeight: 400,
    fontStyle: 'normal',
    hover: true,
    hoverables: {
        a: true
    }
});

Cufon.replace('nav ul li span',
{
    fontFamily: 'Eurostile',
    fontWeight: 400,
    fontStyle: 'normal',
    hover: true,
    hoverables: {
        a: true
    }
});

Cufon.replace('.text-container h4',
{
    fontFamily: 'Eurostile',
    fontWeight: 700,
    fontStyle: 'normal'
});

Cufon.replace('label, input, textarea',
{
    fontFamily: 'Eurostile',
    fontWeight: 400,
    fontStyle: 'normal'
});

Cufon.replace('.text-container p',
{
    fontFamily: 'Eurostile',
    fontWeight: 400,
    fontStyle: 'normal'
});

Cufon.replace('.copyright',
{
    fontFamily: 'Eurostile',
    fontWeight: 400,
    fontStyle: 'normal'
});

Cufon.replace('.text-container ul li',
{
    fontFamily: 'Eurostile',
    fontWeight: 400,
    fontStyle: 'normal'
});

Cufon.replace('email-address',
{
    fontFamily: 'Eurostile',
    fontWeight: 400,
    fontStyle: 'normal'
});


Cufon.now();

$(document).ready(function()
{
    $('a').dwFadingLinks({
        color: '#008000',
        duration: 300
    });

    Cufon.DOM.ready(function()
    {
        /*
         $('nav').slideDown({
         duration: 1000,
         specialEasing: "easeInExpo"
         });
         */

        function setGlowEffect()
        {
            setTimeout(function()
            {
                $('nav ul').fadeIn(function()
                {
                    var activeLink = $('nav a.active');
                    var glowLink = $('.glow');

                    var position = activeLink.offset();

                    var pos;

                    pos = position.left;
                    var newPos = (pos + (activeLink.width() / 2)) - (glowLink.width() / 2);

                    glowLink.fadeIn();
                    glowLink.css('margin-left', newPos);

                    var glowPosition = glowLink.offset();
                });
            }, 300);
        }

        setGlowEffect();

        $(window).resize(function() {
            var glowLink = $('.glow');
            glowLink.hide();
            setGlowEffect();
        });
    });

    $(".topnav li").prepend("<span></span>"); //Throws an empty span tag right before the a tag

    $(".topnav li").each(function() { //For each list item...
        var linkText = $(this).find("a").html(); //Find the text inside of the <a> tag
        var className = $(this).find("a").attr('class'); //Find the text inside of the <a> tag
        $(this).find("span").html(linkText).show(); //Add the text in the <span> tag
        $(this).find("span").addClass(className); //Add the text in the <span> tag
    });

    Cufon.refresh();

    $(".topnav li").hover(function() {    //On hover...
        $(this).find("span").stop().animate({
            marginTop: "-40" //Find the <span> tag and move it up 40 pixels
        }, { "duration": 250, "easing": "easeOutQuad" });
    }, function() { //On hover out...
        $(this).find("span").stop().animate({
            marginTop: "0"  //Move the <span> back to its original state (0px)
        }, { "duration": 250, "easing": "easeOutQuad" });
    });

    var emailAddress = $('email-address');
    var emailValue = emailAddress.value;

    $('input[type="text"]').focus(function() {
        if (this.value == this.defaultValue) {
            this.value = '';
        }
        if (this.value != this.defaultValue) {
            this.select();
        }
    });

    $('input[type="text"]').blur(function() {
        if ($.trim(this.value) == '') {
            this.value = (this.defaultValue ? this.defaultValue : '');
        }
    });

});

$(window).load(function()
{
    if($('.Home'))
    {
        var count = 0;

        $('.rim-buttons .left a').click(function(event)
        {
            event.preventDefault();

            $('.rim-container .rims-large').stop().animate({
                left: "-=1500px",

                opacity: 0
            }, {
                duration: 700,
                easing: 'easeInOutExpo',
                complete: function() {

                    if (count === 6) {
                        count = 0;
                    }
                    else {
                        count++;
                    }

                    $('.rim-container .rims-large').css('left', '2000px');
                    $('.rim-container .rims-large li').each(function() {

                        $(this).hide();

                    });


                    $('.rim-container .rims-large li:eq(' + count + ')').show();
                    $('.rim-container .rims-large').animate({
                        left: "0px",
                        opacity: 1
                    }, {
                        duration: 700,
                        easing: 'easeOutExpo',
                        complete: function() {

                        }
                    });

                }
            });
        });

        $('.rim-buttons .right a').click(function(event)
        {

            if (count === 0) {
                count = 6;
            }

            event.preventDefault();

            $('.rim-container .rims-large').stop().animate({
                left: "+=1500px",
                opacity: 0
            }, {
                duration: 700,
                easing: 'easeInOutExpo',
                complete: function() {

                    if (count === 0) {
                        count = 6;
                    }
                    else {
                        count--;
                    }

                    $('.rim-container .rims-large').css('left', '-2000px');
                    $('.rim-container .rims-large li').each(function() {

                        $(this).hide();

                    });


                    $('.rim-container .rims-large li:eq(' + count + ')').show();
                    $('.rim-container .rims-large').animate({
                        left: "0px",
                        opacity: 1
                    }, {
                        duration: 700,
                        easing: 'easeOutExpo',
                        complete: function() {

                        }
                    });
                }
            });
        });
    }
});

/* plugin */
jQuery.fn.dwFadingLinks = function(settings) {
  settings = jQuery.extend({
    color: '#ff8c00',
    duration: 500
  }, settings);
  return this.each(function() {
    var original = $(this).css('color');
    $(this).mouseover(function() { $(this).animate({ color: settings.color },settings.duration); });
    $(this).mouseout(function() { $(this).animate({ color: original },settings.duration); });
  });
};