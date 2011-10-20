/*!
 * Modernizr v1.6
 * http://www.modernizr.com
 *
 * Developed by:
 * - Faruk Ates  http://farukat.es/
 * - Paul Irish  http://paulirish.com/
 *
 * Copyright (c) 2009-2010
 * Dual-licensed under the BSD or MIT licenses.
 * http://www.modernizr.com/license/
 */


/*
 * Modernizr is a script that detects native CSS3 and HTML5 features
 * available in the current UA and provides an object containing all
 * features with a true/false value, depending on whether the UA has
 * native support for it or not.
 *
 * Modernizr will also add classes to the <html> element of the page,
 * one for each feature it detects. If the UA supports it, a class
 * like "cssgradients" will be added. If not, the class name will be
 * "no-cssgradients". This allows for simple if-conditionals in your
 * CSS, giving you fine control over the look & feel of your website.
 *
 * @author        Faruk Ates
 * @author        Paul Irish
 * @copyright     (c) 2009-2010 Faruk Ates.
 * @contributor   Ben Alman
 */

window.Modernizr = (function(window,doc,undefined){

    var version = '1.6',

    ret = {},

    /**
     * !! DEPRECATED !!
     *
     * enableHTML5 is a private property for advanced use only. If enabled,
     * it will make Modernizr.init() run through a brief while() loop in
     * which it will create all HTML5 elements in the DOM to allow for
     * styling them in Internet Explorer, which does not recognize any
     * non-HTML4 elements unless created in the DOM this way.
     *
     * enableHTML5 is ON by default.
     *
     * The enableHTML5 toggle option is DEPRECATED as per 1.6, and will be
     * replaced in 2.0 in lieu of the modular, configurable nature of 2.0.
     */
    enableHTML5 = true,


    docElement = doc.documentElement,

    /**
     * Create our "modernizr" element that we do most feature tests on.
     */
    mod = 'modernizr',
    m = doc.createElement( mod ),
    m_style = m.style,

    /**
     * Create the input element for various Web Forms feature tests.
     */
    f = doc.createElement( 'input' ),

    smile = ':)',

    tostring = Object.prototype.toString,

    prefixes = ' -webkit- -moz- -o- -ms- -khtml- '.split(' '),



    domPrefixes = 'Webkit Moz O ms Khtml'.split(' '),

    ns = {'svg': 'http://www.w3.org/2000/svg'},

    tests = {},
    inputs = {},
    attrs = {},

    classes = [],

    featurename, // used in testing loop



    testMediaQuery = function(mq){

      var st = document.createElement('style'),
          div = doc.createElement('div'),
          ret;

      st.textContent = mq + '{#modernizr{height:3px}}';
      (doc.head || doc.getElementsByTagName('head')[0]).appendChild(st);
      div.id = 'modernizr';
      docElement.appendChild(div);

      ret = div.offsetHeight === 3;

      st.parentNode.removeChild(st);
      div.parentNode.removeChild(div);

      return !!ret;

    },


    /**
      * isEventSupported determines if a given element supports the given event
      * function from http://yura.thinkweb2.com/isEventSupported/
      */
    isEventSupported = (function(){

      var TAGNAMES = {
        'select':'input','change':'input',
        'submit':'form','reset':'form',
        'error':'img','load':'img','abort':'img'
      };

      function isEventSupported(eventName, element) {

        element = element || document.createElement(TAGNAMES[eventName] || 'div');
        eventName = 'on' + eventName;

        var isSupported = (eventName in element);

        if (!isSupported) {
          if (!element.setAttribute) {
            element = document.createElement('div');
          }
          if (element.setAttribute && element.removeAttribute) {
            element.setAttribute(eventName, '');
            isSupported = typeof element[eventName] == 'function';

            if (typeof element[eventName] != 'undefined') {
              element[eventName] = undefined;
            }
            element.removeAttribute(eventName);
          }
        }

        element = null;
        return isSupported;
      }
      return isEventSupported;
    })();


    var _hasOwnProperty = ({}).hasOwnProperty, hasOwnProperty;
    if (typeof _hasOwnProperty !== 'undefined' && typeof _hasOwnProperty.call !== 'undefined') {
      hasOwnProperty = function (object, property) {
        return _hasOwnProperty.call(object, property);
      };
    }
    else {
      hasOwnProperty = function (object, property) { /* yes, this can give false positives/negatives, but most of the time we don't care about those */
        return ((property in object) && typeof object.constructor.prototype[property] === 'undefined');
      };
    }

    /**
     * set_css applies given styles to the Modernizr DOM node.
     */
    function set_css( str ) {
        m_style.cssText = str;
    }

    /**
     * set_css_all extrapolates all vendor-specific css strings.
     */
    function set_css_all( str1, str2 ) {
        return set_css(prefixes.join(str1 + ';') + ( str2 || '' ));
    }

    /**
     * contains returns a boolean for if substr is found within str.
     */
    function contains( str, substr ) {
        return (''+str).indexOf( substr ) !== -1;
    }

    /**
     * test_props is a generic CSS / DOM property test; if a browser supports
     *   a certain property, it won't return undefined for it.
     *   A supported CSS property returns empty string when its not yet set.
     */
    function test_props( props, callback ) {
        for ( var i in props ) {
            if ( m_style[ props[i] ] !== undefined && ( !callback || callback( props[i], m ) ) ) {
                return true;
            }
        }
    }

    /**
     * test_props_all tests a list of DOM properties we want to check against.
     *   We specify literally ALL possible (known and/or likely) properties on
     *   the element including the non-vendor prefixed one, for forward-
     *   compatibility.
     */
    function test_props_all( prop, callback ) {

        var uc_prop = prop.charAt(0).toUpperCase() + prop.substr(1),
            props   = (prop + ' ' + domPrefixes.join(uc_prop + ' ') + uc_prop).split(' ');

        return !!test_props( props, callback );
    }


    /**
     * Tests
     */

    tests['flexbox'] = function() {
        /**
         * set_prefixed_value_css sets the property of a specified element
         * adding vendor prefixes to the VALUE of the property.
         * @param {Element} element
         * @param {string} property The property name. This will not be prefixed.
         * @param {string} value The value of the property. This WILL be prefixed.
         * @param {string=} extra Additional CSS to append unmodified to the end of
         * the CSS string.
         */
        function set_prefixed_value_css(element, property, value, extra) {
            property += ':';
            element.style.cssText = (property + prefixes.join(value + ';' + property)).slice(0, -property.length) + (extra || '');
        }

        /**
         * set_prefixed_property_css sets the property of a specified element
         * adding vendor prefixes to the NAME of the property.
         * @param {Element} element
         * @param {string} property The property name. This WILL be prefixed.
         * @param {string} value The value of the property. This will not be prefixed.
         * @param {string=} extra Additional CSS to append unmodified to the end of
         * the CSS string.
         */
        function set_prefixed_property_css(element, property, value, extra) {
            element.style.cssText = prefixes.join(property + ':' + value + ';') + (extra || '');
        }

        var c = doc.createElement('div'),
            elem = doc.createElement('div');

        set_prefixed_value_css(c, 'display', 'box', 'width:42px;padding:0;');
        set_prefixed_property_css(elem, 'box-flex', '1', 'width:10px;');

        c.appendChild(elem);
        docElement.appendChild(c);

        var ret = elem.offsetWidth === 42;

        c.removeChild(elem);
        docElement.removeChild(c);

        return ret;
    };


    tests['canvas'] = function() {
        var elem = doc.createElement( 'canvas' );
        return !!(elem.getContext && elem.getContext('2d'));
    };

    tests['canvastext'] = function() {
        return !!(ret['canvas'] && typeof doc.createElement( 'canvas' ).getContext('2d').fillText == 'function');
    };


    tests['webgl'] = function(){

        var elem = doc.createElement( 'canvas' );

        try {
            if (elem.getContext('webgl')){ return true; }
        } catch(e){	}

        try {
            if (elem.getContext('experimental-webgl')){ return true; }
        } catch(e){	}

        return false;
    };

    /*
     * The Modernizr.touch test only indicates if the browser supports
     *    touch events, which does not necessarily reflect a touchscreen
     *    device, as evidenced by tablets running Windows 7 or, alas,
     *    the Palm Pre / WebOS (touch) phones.
     *
     * Additionally, Chrome (desktop) used to lie about its support on this,
     *    but that has since been rectified: http://crbug.com/36415
     *
     * We also test for Firefox 4 Multitouch Support.
     *
     * For more info, see: http://modernizr.github.com/Modernizr/touch.html
     */

    tests['touch'] = function() {

        return ('ontouchstart' in window) || testMediaQuery('@media ('+prefixes.join('touch-enabled),(')+'modernizr)');

    };


    /**
     * geolocation tests for the new Geolocation API specification.
     *   This test is a standards compliant-only test; for more complete
     *   testing, including a Google Gears fallback, please see:
     *   http://code.google.com/p/geo-location-javascript/
     * or view a fallback solution using google's geo API:
     *   http://gist.github.com/366184
     */
    tests['geolocation'] = function() {
        return !!navigator.geolocation;
    };

    tests['postmessage'] = function() {
      return !!window.postMessage;
    };




    tests['websqldatabase'] = function() {
      var result = !!window.openDatabase;
      /*
      if (result){
        try {
          result = !!openDatabase( mod + "testdb", "1.0", mod + "testdb", 2e4);
        } catch(e) {
        }
      }
      */
      return result;
    };

    tests['indexedDB'] = function(){
      for (var i = -1, len = domPrefixes.length; ++i < len; ){
        var prefix = domPrefixes[i].toLowerCase();
        if (window[prefix + '_indexedDB'] || window[prefix + 'IndexedDB']){
          return true;
        }
      }
      return false;
    };

    tests['hashchange'] = function() {
      return isEventSupported('hashchange', window) && ( document.documentMode === undefined || document.documentMode > 7 );
    };

    tests['history'] = function() {
      return !!(window.history && history.pushState);
    };

    tests['draganddrop'] = function() {
        return  isEventSupported('drag') &&
                isEventSupported('dragstart') &&
                isEventSupported('dragenter') &&
                isEventSupported('dragover') &&
                isEventSupported('dragleave') &&
                isEventSupported('dragend') &&
                isEventSupported('drop');
    };

    tests['websockets'] = function(){
        return ('WebSocket' in window);
    };


    tests['rgba'] = function() {

        set_css(  'background-color:rgba(150,255,150,.5)' );

        return contains( m_style.backgroundColor, 'rgba' );
    };

    tests['hsla'] = function() {

        set_css('background-color:hsla(120,40%,100%,.5)' );

        return contains( m_style.backgroundColor, 'rgba' ) || contains( m_style.backgroundColor, 'hsla' );
    };

    tests['multiplebgs'] = function() {

        set_css( 'background:url(//:),url(//:),red url(//:)' );


        return new RegExp("(url\\s*\\(.*?){3}").test(m_style.background);
    };




    tests['backgroundsize'] = function() {
        return test_props_all( 'backgroundSize' );
    };

    tests['borderimage'] = function() {
        return test_props_all( 'borderImage' );
    };



    tests['borderradius'] = function() {
        return test_props_all( 'borderRadius', '', function( prop ) {
            return contains( prop, 'orderRadius' );
        });
    };


    tests['boxshadow'] = function() {
        return test_props_all( 'boxShadow' );
    };

    tests['textshadow'] = function(){
        return doc.createElement('div').style.textShadow === '';
    };


    tests['opacity'] = function() {

        set_css_all( 'opacity:.5' );

        return contains( m_style.opacity, '0.5' );
    };


    tests['cssanimations'] = function() {
        return test_props_all( 'animationName' );
    };


    tests['csscolumns'] = function() {
        return test_props_all( 'columnCount' );
    };


    tests['cssgradients'] = function() {
        /**
         * For CSS Gradients syntax, please see:
         * http://webkit.org/blog/175/introducing-css-gradients/
         * https://developer.mozilla.org/en/CSS/-moz-linear-gradient
         * https://developer.mozilla.org/en/CSS/-moz-radial-gradient
         * http://dev.w3.org/csswg/css3-images/#gradients-
         */

        var str1 = 'background-image:',
            str2 = 'gradient(linear,left top,right bottom,from(#9f9),to(white));',
            str3 = 'linear-gradient(left top,#9f9, white);';

        set_css(
            (str1 + prefixes.join(str2 + str1) + prefixes.join(str3 + str1)).slice(0,-str1.length)
        );

        return contains( m_style.backgroundImage, 'gradient' );
    };


    tests['cssreflections'] = function() {
        return test_props_all( 'boxReflect' );
    };


    tests['csstransforms'] = function() {
        return !!test_props([ 'transformProperty', 'WebkitTransform', 'MozTransform', 'OTransform', 'msTransform' ]);
    };


    tests['csstransforms3d'] = function() {

        var ret = !!test_props([ 'perspectiveProperty', 'WebkitPerspective', 'MozPerspective', 'OPerspective', 'msPerspective' ]);

        if (ret){

          ret = testMediaQuery('@media ('+prefixes.join('transform-3d),(')+'modernizr)');
        }
        return ret;
    };


    tests['csstransitions'] = function() {
        return test_props_all( 'transitionProperty' );
    };


    tests['fontface'] = function(){

        var
        sheet,
        head = doc.head || doc.getElementsByTagName('head')[0] || docElement,
        style = doc.createElement("style"),
        impl = doc.implementation || { hasFeature: function() { return false; } };

        style.type = 'text/css';
        head.insertBefore(style, head.firstChild);
        sheet = style.sheet || style.styleSheet;


        var supportAtRule = impl.hasFeature('CSS2', '') ?
                function(rule) {
                    if (!(sheet && rule)) return false;
                    var result = false;
                    try {
                        sheet.insertRule(rule, 0);
                        result = !(/unknown/i).test(sheet.cssRules[0].cssText);
                        sheet.deleteRule(sheet.cssRules.length - 1);
                    } catch(e) { }
                    return result;
                } :
                function(rule) {
                    if (!(sheet && rule)) return false;
                    sheet.cssText = rule;

                    return sheet.cssText.length !== 0 && !(/unknown/i).test(sheet.cssText) &&
                      sheet.cssText
                            .replace(/\r+|\n+/g, '')
                            .indexOf(rule.split(' ')[0]) === 0;
                };


        ret._fontfaceready = function(fn){
          fn(ret.fontface);
        };

        return supportAtRule('@font-face { font-family: "font"; src: "font.ttf"; }');

    };




    tests['video'] = function() {
        var elem = doc.createElement('video'),
            bool = !!elem.canPlayType;

        if (bool){
            bool      = new Boolean(bool);
            bool.ogg  = elem.canPlayType('video/ogg; codecs="theora"');

            var h264 = 'video/mp4; codecs="avc1.42E01E';
            bool.h264 = elem.canPlayType(h264 + '"') || elem.canPlayType(h264 + ', mp4a.40.2"');

            bool.webm = elem.canPlayType('video/webm; codecs="vp8, vorbis"');
        }
        return bool;
    };

    tests['audio'] = function() {
        var elem = doc.createElement('audio'),
            bool = !!elem.canPlayType;

        if (bool){
            bool      = new Boolean(bool);
            bool.ogg  = elem.canPlayType('audio/ogg; codecs="vorbis"');
            bool.mp3  = elem.canPlayType('audio/mpeg;');

            bool.wav  = elem.canPlayType('audio/wav; codecs="1"');
            bool.m4a  = elem.canPlayType('audio/x-m4a;') || elem.canPlayType('audio/aac;');
        }
        return bool;
    };






    tests['localstorage'] = function() {
        try {
          return ('localStorage' in window) && window.localStorage !== null;
        } catch(e) {
          return false;
        }
    };

    tests['sessionstorage'] = function() {
        try {
            return ('sessionStorage' in window) && window.sessionStorage !== null;
        } catch(e){
            return false;
        }
    };


    tests['webWorkers'] = function () {
        return !!window.Worker;
    };


    tests['applicationcache'] =  function() {
        return !!window.applicationCache;
    };


    tests['svg'] = function(){
        return !!doc.createElementNS && !!doc.createElementNS(ns.svg, "svg").createSVGRect;
    };

    tests['inlinesvg'] = function() {
      var div = document.createElement('div');
      div.innerHTML = '<svg/>';
      return (div.firstChild && div.firstChild.namespaceURI) == ns.svg;
    };

    tests['smil'] = function(){
        return !!doc.createElementNS && /SVG/.test(tostring.call(doc.createElementNS(ns.svg,'animate')));
    };

    tests['svgclippaths'] = function(){
        return !!doc.createElementNS && /SVG/.test(tostring.call(doc.createElementNS(ns.svg,'clipPath')));
    };


    function webforms(){

        ret['input'] = (function(props) {
            for (var i = 0,len=props.length;i<len;i++) {
                attrs[ props[i] ] = !!(props[i] in f);
            }
            return attrs;
        })('autocomplete autofocus list placeholder max min multiple pattern required step'.split(' '));


        ret['inputtypes'] = (function(props) {
            for (var i = 0, bool, len=props.length ; i < len ; i++) {

                f.setAttribute('type', props[i]);
                bool = f.type !== 'text';

                if (bool){

                    f.value = smile;

                    if (/^range$/.test(f.type) && f.style.WebkitAppearance !== undefined){

                      docElement.appendChild(f);
                      var defaultView = doc.defaultView;

                      bool =  defaultView.getComputedStyle &&
                              defaultView.getComputedStyle(f, null).WebkitAppearance !== 'textfield' &&

                              (f.offsetHeight !== 0);

                      docElement.removeChild(f);

                    } else if (/^(search|tel)$/.test(f.type)){


                    } else if (/^(url|email)$/.test(f.type)) {

                      bool = f.checkValidity && f.checkValidity() === false;

                    } else {
                      bool = f.value != smile;
                    }
                }

                inputs[ props[i] ] = !!bool;
            }
            return inputs;
        })('search tel url email datetime date month week time datetime-local number range color'.split(' '));

    }






    for ( var feature in tests ) {
        if ( hasOwnProperty( tests, feature ) ) {
            featurename  = feature.toLowerCase();
            ret[ featurename ] = tests[ feature ]();

            classes.push( ( ret[ featurename ] ? '' : 'no-' ) + featurename );
        }
    }

    if (!ret.input) webforms();



    ret.crosswindowmessaging = ret.postmessage;
    ret.historymanagement = ret.history;



    /**
     * Addtest allows the user to define their own feature tests
     * the result will be added onto the Modernizr object,
     * as well as an appropriate className set on the html element
     *
     * @param feature - String naming the feature
     * @param test - Function returning true if feature is supported, false if not
     */
    ret.addTest = function (feature, test) {
      feature = feature.toLowerCase();

      if (ret[ feature ]) {
        return; // quit if you're trying to overwrite an existing test
      }
      test = !!(test());
      docElement.className += ' ' + (test ? '' : 'no-') + feature;
      ret[ feature ] = test;
      return ret; // allow chaining.
    };

    /**
     * Reset m.style.cssText to nothing to reduce memory footprint.
     */
    set_css( '' );
    m = f = null;

    if ( enableHTML5 && window.attachEvent && (function(){ var elem = doc.createElement("div");
                                      elem.innerHTML = "<elem></elem>";
                                      return elem.childNodes.length !== 1; })()) {
        (function(f,l){var j="abbr|article|aside|audio|canvas|details|figcaption|figure|footer|header|hgroup|mark|meter|nav|output|progress|section|summary|time|video",n=j.split("|"),k=n.length,g=new RegExp("<(/*)("+j+")","gi"),h=new RegExp("\\b("+j+")\\b(?!.*[;}])","gi"),m=l.createDocumentFragment(),d=l.documentElement,i=d.firstChild,b=l.createElement("style"),e=l.createElement("body");b.media="all";function c(p){var o=-1;while(++o<k){p.createElement(n[o])}}c(l);c(m);function a(t,s){var r=t.length,q=-1,o,p=[];while(++q<r){o=t[q];s=o.media||s;p.push(a(o.imports,s));p.push(o.cssText)}return p.join("")}f.attachEvent("onbeforeprint",function(){var r=-1;while(++r<k){var o=l.getElementsByTagName(n[r]),q=o.length,p=-1;while(++p<q){if(o[p].className.indexOf("iepp_")<0){o[p].className+=" iepp_"+n[r]}}}i.insertBefore(b,i.firstChild);b.styleSheet.cssText=a(l.styleSheets,"all").replace(h,".iepp_$1");m.appendChild(l.body);d.appendChild(e);e.innerHTML=m.firstChild.innerHTML.replace(g,"<$1bdo")});f.attachEvent("onafterprint",function(){e.innerHTML="";d.removeChild(e);i.removeChild(b);d.appendChild(m.firstChild)})})(this,document);
    }

    ret._enableHTML5     = enableHTML5;
    ret._version         = version;

    docElement.className=docElement.className.replace(/\bno-js\b/,'') + ' js';

    docElement.className += ' ' + classes.join( ' ' );

    return ret;

})(this,this.document);
