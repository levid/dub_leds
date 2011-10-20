// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require cufon-yui
//= require_tree .


$(document).ready(function()
{
    $.extend($.easing,
    {
        def: 'easeOutQuad',
        swing: function (x, t, b, c, d) {
            //alert($.easing.default);
            return $.easing[$.easing.def](x, t, b, c, d);
        },
        easeInQuad: function (x, t, b, c, d) {
            return c * (t /= d) * t + b;
        },
        easeOutQuad: function (x, t, b, c, d) {
            return -c * (t /= d) * (t - 2) + b;
        },
        easeInOutQuad: function (x, t, b, c, d) {
            if ((t /= d / 2) < 1) return c / 2 * t * t + b;
            return -c / 2 * ((--t) * (t - 2) - 1) + b;
        },
        easeInCubic: function (x, t, b, c, d) {
            return c * (t /= d) * t * t + b;
        },
        easeOutCubic: function (x, t, b, c, d) {
            return c * ((t = t / d - 1) * t * t + 1) + b;
        },
        easeInOutCubic: function (x, t, b, c, d) {
            if ((t /= d / 2) < 1) return c / 2 * t * t * t + b;
            return c / 2 * ((t -= 2) * t * t + 2) + b;
        },
        easeInQuart: function (x, t, b, c, d) {
            return c * (t /= d) * t * t * t + b;
        },
        easeOutQuart: function (x, t, b, c, d) {
            return -c * ((t = t / d - 1) * t * t * t - 1) + b;
        },
        easeInOutQuart: function (x, t, b, c, d) {
            if ((t /= d / 2) < 1) return c / 2 * t * t * t * t + b;
            return -c / 2 * ((t -= 2) * t * t * t - 2) + b;
        },
        easeInQuint: function (x, t, b, c, d) {
            return c * (t /= d) * t * t * t * t + b;
        },
        easeOutQuint: function (x, t, b, c, d) {
            return c * ((t = t / d - 1) * t * t * t * t + 1) + b;
        },
        easeInOutQuint: function (x, t, b, c, d) {
            if ((t /= d / 2) < 1) return c / 2 * t * t * t * t * t + b;
            return c / 2 * ((t -= 2) * t * t * t * t + 2) + b;
        },
        easeInSine: function (x, t, b, c, d) {
            return -c * Math.cos(t / d * (Math.PI / 2)) + c + b;
        },
        easeOutSine: function (x, t, b, c, d) {
            return c * Math.sin(t / d * (Math.PI / 2)) + b;
        },
        easeInOutSine: function (x, t, b, c, d) {
            return -c / 2 * (Math.cos(Math.PI * t / d) - 1) + b;
        },
        easeInExpo: function (x, t, b, c, d) {
            return (t == 0) ? b : c * Math.pow(2, 10 * (t / d - 1)) + b;
        },
        easeOutExpo: function (x, t, b, c, d) {
            return (t == d) ? b + c : c * (-Math.pow(2, -10 * t / d) + 1) + b;
        },
        easeInOutExpo: function (x, t, b, c, d) {
            if (t == 0) return b;
            if (t == d) return b + c;
            if ((t /= d / 2) < 1) return c / 2 * Math.pow(2, 10 * (t - 1)) + b;
            return c / 2 * (-Math.pow(2, -10 * --t) + 2) + b;
        },
        easeInCirc: function (x, t, b, c, d) {
            return -c * (Math.sqrt(1 - (t /= d) * t) - 1) + b;
        },
        easeOutCirc: function (x, t, b, c, d) {
            return c * Math.sqrt(1 - (t = t / d - 1) * t) + b;
        },
        easeInOutCirc: function (x, t, b, c, d) {
            if ((t /= d / 2) < 1) return -c / 2 * (Math.sqrt(1 - t * t) - 1) + b;
            return c / 2 * (Math.sqrt(1 - (t -= 2) * t) + 1) + b;
        },
        easeInElastic: function (x, t, b, c, d) {
            var s = 1.70158;
            var p = 0;
            var a = c;
            if (t == 0) return b;
            if ((t /= d) == 1) return b + c;
            if (!p) p = d * .3;
            if (a < Math.abs(c)) {
                a = c;
                var s = p / 4;
            }
            else var s = p / (2 * Math.PI) * Math.asin(c / a);
            return -(a * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p)) + b;
        },
        easeOutElastic: function (x, t, b, c, d) {
            var s = 1.70158;
            var p = 0;
            var a = c;
            if (t == 0) return b;
            if ((t /= d) == 1) return b + c;
            if (!p) p = d * .3;
            if (a < Math.abs(c)) {
                a = c;
                var s = p / 4;
            }
            else var s = p / (2 * Math.PI) * Math.asin(c / a);
            return a * Math.pow(2, -10 * t) * Math.sin((t * d - s) * (2 * Math.PI) / p) + c + b;
        },
        easeInOutElastic: function (x, t, b, c, d) {
            var s = 1.70158;
            var p = 0;
            var a = c;
            if (t == 0) return b;
            if ((t /= d / 2) == 2) return b + c;
            if (!p) p = d * (.3 * 1.5);
            if (a < Math.abs(c)) {
                a = c;
                var s = p / 4;
            }
            else var s = p / (2 * Math.PI) * Math.asin(c / a);
            if (t < 1) return -.5 * (a * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p)) + b;
            return a * Math.pow(2, -10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p) * .5 + c + b;
        },
        easeInBack: function (x, t, b, c, d, s) {
            if (s == undefined) s = 1.70158;
            return c * (t /= d) * t * ((s + 1) * t - s) + b;
        },
        easeOutBack: function (x, t, b, c, d, s) {
            if (s == undefined) s = 1.70158;
            return c * ((t = t / d - 1) * t * ((s + 1) * t + s) + 1) + b;
        },
        easeInOutBack: function (x, t, b, c, d, s) {
            if (s == undefined) s = 1.70158;
            if ((t /= d / 2) < 1) return c / 2 * (t * t * (((s *= (1.525)) + 1) * t - s)) + b;
            return c / 2 * ((t -= 2) * t * (((s *= (1.525)) + 1) * t + s) + 2) + b;
        },
        easeInBounce: function (x, t, b, c, d) {
            return c - $.easing.easeOutBounce(x, d - t, 0, c, d) + b;
        },
        easeOutBounce: function (x, t, b, c, d) {
            if ((t /= d) < (1 / 2.75)) {
                return c * (7.5625 * t * t) + b;
            } else if (t < (2 / 2.75)) {
                return c * (7.5625 * (t -= (1.5 / 2.75)) * t + .75) + b;
            } else if (t < (2.5 / 2.75)) {
                return c * (7.5625 * (t -= (2.25 / 2.75)) * t + .9375) + b;
            } else {
                return c * (7.5625 * (t -= (2.625 / 2.75)) * t + .984375) + b;
            }
        },
        easeInOutBounce: function (x, t, b, c, d) {
            if (t < d / 2) return $.easing.easeInBounce(x, t * 2, 0, c, d) * .5 + b;
            return $.easing.easeOutBounce(x, t * 2 - d, 0, c, d) * .5 + c * .5 + b;
        }
    });

    Cufon.DOM.ready(function()
    {
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

        /*
         $('nav').slideDown({
         duration: 1000,
         specialEasing: "easeInExpo"
         });
         */


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
                glowLink.css('left', newPos);

                var glowPosition = glowLink.offset();
            });
        }, 300);
    });

    $(".topnav li").prepend("<span></span>"); //Throws an empty span tag right before the a tag

    $(".topnav li").each(function() { //For each list item...
        var linkText = $(this).find("a").html(); //Find the text inside of the <a> tag
        var className = $(this).find("a").attr('class'); //Find the text inside of the <a> tag
        $(this).find("span").show().html(linkText); //Add the text in the <span> tag
        $(this).find("span").addClass(className); //Add the text in the <span> tag
    });

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
                left: "-=2000px",

                opacity: 0
            }, {
                duration: 500,
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
                        duration: 500,
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
                left: "+=2000px",
                opacity: 0
            }, {
                duration: 500,
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
                        duration: 500,
                        easing: 'easeOutExpo',
                        complete: function() {

                        }
                    });
                }
            });
        });
    }
});