$(document).ready(function()
{ 
    $('a.link').css('backgroundPosition', "-81px "+ ($(this).outerHeight()-2) +"px"); 
    $('a.link').bind('mouseenter',function(e)
    { 
        var a = $(this); 
        a.animate({'backgroundPosition': a.outerWidth() + "px"+ (a.outerHeight()-2) +"px"},600); 
    }); 
    
    $('a.link').bind('mouseleave',function(e)
    { 
        var a = $(this);
        a.animate({'backgroundPosition': "-81px "+ (a.outerHeight()-2) +"px"},600); 
    }); 
})

jQuery.fn.center = function () {
    this.css("position","fixed");
    this.css("top", (($(window).height() - this.outerHeight()) / 2) + "px");
    this.css("left", (($(window).width() - this.outerWidth()) / 2) + "px");
    return this;
}