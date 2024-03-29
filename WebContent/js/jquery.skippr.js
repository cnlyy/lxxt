
(function () {    

    var Skippr = (function () {

        function Skippr(element, options) {

        	var _ = this,
                timer;
            
            _.settings = $.extend($.fn.skippr.defaults, options);
            _.$element = $(element);
            _.$parent = _.$element.parent();
            _.$photos = _.$element.children();
			_.count = _.$photos.length;
            _.countString = String(_.count);
			_.init();
    
        }

        Skippr.prototype.init = function() {

        	var _ = this;

        	_.setup();
        	_.navClick();
            _.arrowClick();

            if(_.settings.autoPlay == true) {
                _.autoPlay();
                _.autoPlayPause();
            }


        }

        Skippr.prototype.setup = function() {

        	var _ = this;
                
            if (_.settings.childrenElementType == 'img') {
                var makeDivs = [];

                for (i = 0; i < _.count; i++) {
                    var src = _.$photos.eq(i).attr('src'),
                        insert = '<div style="background-image: url(' + src + ')"></div>';

                    makeDivs.push(insert);
                }
                 makeDivs.join("");
                 _.$element.append(makeDivs);
                 _.$element.find('img').remove();
                 _.$photos = _.$element.children();
            }

            if (_.settings.transition == 'fade') {
                _.$photos.not(":first-child").hide();
            }

            if (_.settings.transition == 'slide') {
                _.setupSlider();
            }

        	_.$photos.eq(0).addClass('visible');
        	_.$element.addClass('skippr');

        	_.navBuild();

            if(_.settings.arrows == true) {
                _.arrowBuild();
            }

        };

        Skippr.prototype.arrowBuild = function() {

            var _ = this,
                previous,
                next,
                startingPrevious = _.count; // what will be the first previous slide?

            previous = '<nav class="skippr-arrow skippr-previous" data-slider="' + startingPrevious + '"></nav>';
            next = '<nav class="skippr-arrow skippr-next" data-slider="2"></nav>';

            _.$element.append(previous + next);

        };

        Skippr.prototype.arrowClick = function() {
            
            var _ = this;
            
            $(".skippr-arrow").click(function(){

                _.change($(this));

            });

        };

        Skippr.prototype.navBuild = function() {

        	var _ = this,
        		container,
        		navElements = [];
            if (_.settings.navType == "block") {
                var styleClass = "skippr-nav-element-block";
            } else if(_.settings.navType == "bubble") {
               var styleClass = "skippr-nav-element-bubble"; 
            }

        	for (var i = 0; i < _.count; i++) { 
        		//cycle through slideshow divs and display correct number of bubbles.
        		var insert;

        		if (i == 0) {
        			//check if first bubble, add respective active class.
        	 		insert = "<div class='skippr-nav-element " + styleClass + " skippr-nav-element-active' data-slider='" + (i + 1) + "'></div>";
        		} else {
        			insert = "<div class='skippr-nav-element " + styleClass + "' data-slider='" + (i + 1) + "'></div>";
        		}
        		//insert bubbles into an array.
        		navElements.push(insert); 
        	};
        	//join array elements into a single string.
        	navElements = navElements.join(""); 
        	// append html to bubbles container div.
        	container = '<nav class="skippr-nav-container">' + navElements + '</nav>';

        	_.$element.append(container);

        };

        Skippr.prototype.navClick = function() {

        	var _ = this;

        	_.$element.find('.skippr-nav-element').click(function(){
                _.change($(this));
        	});

        };

        Skippr.prototype.change = function(element) {

            var _ = this,
                item = element.attr('data-slider'),
                currentItem = $(".skippr-nav-element-active").attr('data-slider'),
                nextData = $(".skippr-next").attr('data-slider'),
                previousData = $(".skippr-previous").attr('data-slider');

            if(item != currentItem) { //prevents animation for repeat click.

                if (_.settings.transition == 'fade') {

                    _.$photos.eq(item - 1).css('z-index', '10').siblings('div').css('z-index', '9');
                    
                    _.$photos.eq(item - 1).fadeIn(_.settings.speed, function() {
                        $(".visible").fadeOut('fast',function(){
                            $(this).removeClass('visible');
                            _.$photos.eq(item - 1).addClass('visible');
                        });
                    }); 
                }

                if (_.settings.transition == 'slide') {
                  
                    _.$photos.each(function(){

                        var amountLeft = parseFloat($(this).css('left')),
                            parentWidth = _.$parent.width(),
                            moveAmount;

                        if (item > currentItem) {

                            moveAmount = amountLeft - (parentWidth * (item - currentItem));
                            
                        }
                        if (item < currentItem) {

                            moveAmount = amountLeft + (parentWidth * (currentItem - item));
                        }

                        $(this).velocity({'left': moveAmount + 'px'}, _.settings.speed, _.settings.easing);
                    });
                }


                $(".skippr-nav-element").eq(item - 1).addClass('skippr-nav-element-active').siblings().removeClass('skippr-nav-element-active');
                
                var nextDataAddString = Number(item) + 1,
                    previousDataAddString = Number(item) - 1;

                if ( item == _.count ){ 
                    $(".skippr-next").attr('data-slider', '1' );
                } else {
                    $(".skippr-next").attr('data-slider', nextDataAddString );
                }
                
                if (item == 1) {
                    $(".skippr-previous").attr('data-slider', _.countString );
                }  else {
                   $(".skippr-previous").attr('data-slider', previousDataAddString ); 
                }

            }

        };

        Skippr.prototype.autoPlay = function() {

            var _ = this;

            timer = setInterval(function(){
                var activeElement = $(".skippr-nav-element-active"),
                    activeSlide = activeElement.attr('data-slider');

                if( activeSlide == _.count ) {
                  var elementToInsert = $(".skippr-nav-element").eq(0); 
                } else {
                    var elementToInsert = activeElement.next();
                }

                _.change(elementToInsert);
                    
            },_.settings.autoPlayDuration);

        

        };

        Skippr.prototype.autoPlayPause = function() {

            var _ = this;

            _.$parent.hover(function(){
                clearInterval(timer);
            }, function() {
                _.autoPlay();
            });

        };

        Skippr.prototype.setupSlider = function() {
            var _ = this,
                parentWidth = _.$parent.width(),
                amountLeft;

            _.$photos.css('position', 'absolute');

            for (i = 0; i < _.count; i++) {

                amountLeft = parentWidth * i;
                _.$photos.eq(i).css('left', amountLeft);
            }


        }



        return Skippr;

    })();

    $.fn.skippr = function (options) {
        var instance;
        instance = this.data('skippr');
        if (!instance) {
            return this.each(function () {
                return $(this).data('skippr', new Skippr(this,options));
            });
        }
        if (options === true) return instance;
        if ($.type(options) === 'string') instance[options]();
        return this;
    };

    $.fn.skippr.defaults = {
        transition: 'slide',
        speed: 1000,
        easing: 'easeOutQuart',
        navType: 'block',
        childrenElementType : 'div',
        arrows: true,
        autoPlay: false,
        autoPlayDuration: 5000
       
    };

    // $(function () {
    //     return new Skippr($('[data-skippr]'));
    // }); 

}).call(this);

/*!
* Velocity.js: Accelerated JavaScript animation.
* @version 0.0.12
* @docs http://velocityjs.org
* @license Copyright 2014 Julian Shapiro. MIT License: http://en.wikipedia.org/wiki/MIT_License
*/
!function(a,b,c,d){function e(a){for(var b=-1,c=a?a.length:0,d=[];++b<c;){var e=a[b];e&&d.push(e)}return d}function f(a){return"[object Function]"===Object.prototype.toString.call(a)}function g(a){return"[object Array]"===Object.prototype.toString.call(a)}function h(a){var b=Object.prototype.toString.call(a);return"object"==typeof a&&/^\[object (HTMLCollection|NodeList|Object)\]$/.test(b)&&a.length!==d&&(0===a.length||"object"==typeof a[0]&&a[0].nodeType>0)}function i(a,b,c,d){function e(a,b){return 1-3*b+3*a}function f(a,b){return 3*b-6*a}function g(a){return 3*a}function h(a,b,c){return((e(b,c)*a+f(b,c))*a+g(b))*a}function i(a,b,c){return 3*e(b,c)*a*a+2*f(b,c)*a+g(b)}function j(b){for(var d=b,e=0;8>e;++e){var f=i(d,a,c);if(0===f)return d;var g=h(d,a,c)-b;d-=g/f}return d}if(4!==arguments.length)return!1;for(var k=0;4>k;++k)if("number"!=typeof arguments[k]||isNaN(arguments[k])||!isFinite(arguments[k]))return!1;a=Math.min(a,1),c=Math.min(c,1),a=Math.max(a,0),c=Math.max(c,0);var l=function(e){return a===b&&c===d?e:h(j(e),b,d)};return l}function j(a){if(a)for(var b=(new Date).getTime(),c=0,e=p.State.calls.length;e>c;c++)if(p.State.calls[c]){var f=p.State.calls[c],g=f[0],h=f[2],i=f[3];i||(i=p.State.calls[c][3]=b-16);for(var m=Math.min((b-i)/h.duration,1),r=0,s=g.length;s>r;r++){var t=g[r],u=t.element;if(o.data(u,l)){var v=!1;h.display&&"none"!==h.display&&q.setPropertyValue(u,"display",h.display);for(var w in t)if("element"!==w){var x,y=t[w],z="string"==typeof y.easing?p.Easings[y.easing]:y.easing;if(x=1===m?y.endValue:y.startValue+(y.endValue-y.startValue)*z(m),y.currentValue=x,q.Hooks.registered[w]){var A=q.Hooks.getRoot(w),B=o.data(u,l).rootPropertyValueCache[A];B&&(y.rootPropertyValue=B)}var C=q.setPropertyValue(u,w,y.currentValue+(0===parseFloat(x)?"":y.unitType),y.rootPropertyValue,y.scrollData);q.Hooks.registered[w]&&(o.data(u,l).rootPropertyValueCache[A]=q.Normalizations.registered[A]?q.Normalizations.registered[A]("extract",null,C[1]):C[1]),"transform"===C[0]&&(v=!0)}h.mobileHA&&o.data(u,l).transformCache.translate3d===d&&(o.data(u,l).transformCache.translate3d="(0, 0, 0)",v=!0),v&&q.flushTransformCache(u)}}h.display&&"none"!==h.display&&(p.State.calls[c][2].display=!1),1===m&&k(c)}p.State.isTicking&&n(j)}function k(a){for(var b=p.State.calls[a][0],c=p.State.calls[a][1],e=p.State.calls[a][2],f=!1,g=0,h=b.length;h>g;g++){var i=b[g].element;if("none"!==e.display||e.loop||q.setPropertyValue(i,"display",e.display),o.queue(i)[1]!==d&&/\.velocityQueueEntryFlag/i.test(o.queue(i)[1])||o.data(i,l)&&(o.data(i,l).isAnimating=!1,o.data(i,l).rootPropertyValueCache={},e.mobileHA&&!p.State.isGingerbread&&(delete o.data(i,l).transformCache.translate3d,q.flushTransformCache(i))),g===h-1&&!e.loop&&e.complete){var j=c.jquery?c.get():c;e.complete.call(j,j)}e.queue!==!1&&o.dequeue(i,e.queue)}p.State.calls[a]=!1;for(var k=0,m=p.State.calls.length;m>k;k++)if(p.State.calls[k]!==!1){f=!0;break}f===!1&&(p.State.isTicking=!1,delete p.State.calls,p.State.calls=[])}var l="velocity",m=function(){if(c.documentMode)return c.documentMode;for(var a=7;a>4;a--){var b=c.createElement("div");if(b.innerHTML="<!--[if IE "+a+"]><span></span><![endif]-->",b.getElementsByTagName("span").length)return b=null,a}return d}(),n=b.requestAnimationFrame||function(){var a=0;return b.webkitRequestAnimationFrame||b.mozRequestAnimationFrame||function(b){var c,d=(new Date).getTime();return c=Math.max(0,16-(d-a)),a=d+c,setTimeout(function(){b(d+c)},c)}}();if(7>=m){if(b.jQuery)return void(b.jQuery.fn.velocity=b.jQuery.fn.animate);throw new Error("For IE<=7, Velocity falls back to jQuery, which must first be loaded.")}if(8===m&&!b.jQuery)throw new Error("For IE8, Velocity requires jQuery to be loaded.");if(a.Velocity!==d&&!a.Velocity.Utilities)throw new Error("Velocity's namespace is occupied. Aborting.");var o=b.jQuery||a.Velocity.Utilities,p=a.Velocity=a.velocity=o.extend(a.Velocity||{},{State:{isMobile:/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent),isAndroid:/Android/i.test(navigator.userAgent),isGingerbread:/Android 2\.3\.[3-7]/i.test(navigator.userAgent),prefixElement:c.createElement("div"),prefixMatches:{},scrollAnchor:null,scrollPropertyLeft:null,scrollPropertyTop:null,isTicking:!1,calls:[]},CSS:{},Sequences:{},Easings:{},defaults:{queue:"",duration:400,easing:"swing",complete:null,display:null,loop:!1,delay:!1,mobileHA:!0,_cacheValues:!0},animate:function(){},debug:!1});b.pageYOffset!==d?(p.State.scrollAnchor=b,p.State.scrollPropertyLeft="pageXOffset",p.State.scrollPropertyTop="pageYOffset"):(p.State.scrollAnchor=c.documentElement||c.body.parentNode||c.body,p.State.scrollPropertyLeft="scrollLeft",p.State.scrollPropertyTop="scrollTop"),function(){var a={};o.each(["Quad","Cubic","Quart","Quint","Expo"],function(b,c){a[c]=function(a){return Math.pow(a,b+2)}}),o.extend(a,{Sine:function(a){return 1-Math.cos(a*Math.PI/2)},Circ:function(a){return 1-Math.sqrt(1-a*a)},Elastic:function(a){return 0===a||1===a?a:-Math.pow(2,8*(a-1))*Math.sin((80*(a-1)-7.5)*Math.PI/15)},Back:function(a){return a*a*(3*a-2)},Bounce:function(a){for(var b,c=4;a<((b=Math.pow(2,--c))-1)/11;);return 1/Math.pow(4,3-c)-7.5625*Math.pow((3*b-2)/22-a,2)}}),o.each(a,function(a,b){p.Easings["easeIn"+a]=b,p.Easings["easeOut"+a]=function(a){return 1-b(1-a)},p.Easings["easeInOut"+a]=function(a){return.5>a?b(2*a)/2:1-b(-2*a+2)/2}}),p.Easings.linear=function(a){return a},p.Easings.swing=function(a){return.5-Math.cos(a*Math.PI)/2},p.Easings.ease=i(.25,.1,.25,1),p.Easings["ease-in"]=i(.42,0,1,1),p.Easings["ease-out"]=i(0,0,.58,1),p.Easings["ease-in-out"]=i(.42,0,.58,1),p.Easings.spring=function(a){return 1-Math.cos(4.5*a*Math.PI)*Math.exp(6*-a)}}();var q=p.CSS={RegEx:{valueUnwrap:/^[A-z]+\((.*)\)$/i,wrappedValueAlreadyExtracted:/[0-9.]+ [0-9.]+ [0-9.]+( [0-9.]+)?/,valueSplit:/([A-z]+\(.+\))|(([A-z0-9#-.]+?)(?=\s|$))/gi},Hooks:{templates:{color:["Red Green Blue Alpha","255 255 255 1"],backgroundColor:["Red Green Blue Alpha","255 255 255 1"],borderColor:["Red Green Blue Alpha","255 255 255 1"],borderTopColor:["Red Green Blue Alpha","255 255 255 1"],borderRightColor:["Red Green Blue Alpha","255 255 255 1"],borderBottomColor:["Red Green Blue Alpha","255 255 255 1"],borderLeftColor:["Red Green Blue Alpha","255 255 255 1"],outlineColor:["Red Green Blue Alpha","255 255 255 1"],textShadow:["Color X Y Blur","black 0px 0px 0px"],boxShadow:["Color X Y Blur Spread","black 0px 0px 0px 0px"],clip:["Top Right Bottom Left","0px 0px 0px 0px"],backgroundPosition:["X Y","0% 0%"],transformOrigin:["X Y Z","50% 50% 0%"],perspectiveOrigin:["X Y","50% 50%"]},registered:{},register:function(){var a,b,c;if(m)for(a in q.Hooks.templates){b=q.Hooks.templates[a],c=b[0].split(" ");var d=b[1].match(q.RegEx.valueSplit);"Color"===c[0]&&(c.push(c.shift()),d.push(d.shift()),q.Hooks.templates[a]=[c.join(" "),d.join(" ")])}for(a in q.Hooks.templates){b=q.Hooks.templates[a],c=b[0].split(" ");for(var e in c){var f=a+c[e],g=e;q.Hooks.registered[f]=[a,g]}}},getRoot:function(a){var b=q.Hooks.registered[a];return b?b[0]:a},cleanRootPropertyValue:function(a,b){return q.RegEx.valueUnwrap.test(b)&&(b=b.match(q.Hooks.RegEx.valueUnwrap)[1]),q.Values.isCSSNullValue(b)&&(b=q.Hooks.templates[a][1]),b},extractValue:function(a,b){var c=q.Hooks.registered[a];if(c){var d=c[0],e=c[1];return b=q.Hooks.cleanRootPropertyValue(d,b),b.toString().match(q.RegEx.valueSplit)[e]}return b},injectValue:function(a,b,c){var d=q.Hooks.registered[a];if(d){var e,f,g=d[0],h=d[1];return c=q.Hooks.cleanRootPropertyValue(g,c),e=c.toString().match(q.RegEx.valueSplit),e[h]=b,f=e.join(" ")}return c}},Normalizations:{registered:{clip:function(a,b,c){switch(a){case"name":return"clip";case"extract":var d;return q.RegEx.wrappedValueAlreadyExtracted.test(c)?d=c:(d=c.toString().match(q.RegEx.valueUnwrap),d&&(d=d[1].replace(/,(\s+)?/g," "))),d;case"inject":return"rect("+c+")"}},opacity:function(a,b,c){if(8>=m)switch(a){case"name":return"filter";case"extract":var d=c.toString().match(/alpha\(opacity=(.*)\)/i);return c=d?d[1]/100:1;case"inject":return b.style.zoom=1,parseFloat(c)>=1?"":"alpha(opacity="+parseInt(100*parseFloat(c),10)+")"}else switch(a){case"name":return"opacity";case"extract":return c;case"inject":return c}}},register:function(){function a(a){var b,c=/^#?([a-f\d])([a-f\d])([a-f\d])$/i,d=/^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i;return a=a.replace(c,function(a,b,c,d){return b+b+c+c+d+d}),b=d.exec(a),b?"rgb("+(parseInt(b[1],16)+" "+parseInt(b[2],16)+" "+parseInt(b[3],16))+")":"rgb(0 0 0)"}var b=["translateX","translateY","scale","scaleX","scaleY","skewX","skewY","rotateZ"];9>=m||(b=b.concat(["transformPerspective","translateZ","scaleZ","rotateX","rotateY"]));for(var c=0,e=b.length;e>c;c++)!function(){var a=b[c];q.Normalizations.registered[a]=function(b,c,e){switch(b){case"name":return"transform";case"extract":return o.data(c,l).transformCache[a]===d?/^scale/i.test(a)?1:0:o.data(c,l).transformCache[a].replace(/[()]/g,"");case"inject":var f=!1;switch(a.substr(0,a.length-1)){case"translate":f=!/(%|px|em|rem|\d)$/i.test(e);break;case"scal":case"scale":p.State.isAndroid&&o.data(c,l).transformCache[a]===d&&(e=1),f=!/(\d)$/i.test(e);break;case"skew":f=!/(deg|\d)$/i.test(e);break;case"rotate":f=!/(deg|\d)$/i.test(e)}return f||(o.data(c,l).transformCache[a]="("+e+")"),o.data(c,l).transformCache[a]}}}();for(var f=["color","backgroundColor","borderColor","borderTopColor","borderRightColor","borderBottomColor","borderLeftColor","outlineColor"],c=0,g=f.length;g>c;c++)!function(){var b=f[c];q.Normalizations.registered[b]=function(c,e,f){switch(c){case"name":return b;case"extract":var g;if(q.RegEx.wrappedValueAlreadyExtracted.test(f))g=f;else{var h,i={aqua:"rgb(0, 255, 255);",black:"rgb(0, 0, 0)",blue:"rgb(0, 0, 255)",fuchsia:"rgb(255, 0, 255)",gray:"rgb(128, 128, 128)",green:"rgb(0, 128, 0)",lime:"rgb(0, 255, 0)",maroon:"rgb(128, 0, 0)",navy:"rgb(0, 0, 128)",olive:"rgb(128, 128, 0)",purple:"rgb(128, 0, 128)",red:"rgb(255, 0, 0)",silver:"rgb(192, 192, 192)",teal:"rgb(0, 128, 128)",white:"rgb(255, 255, 255)",yellow:"rgb(255, 255, 0)"};/^[A-z]+$/i.test(f)?h=i[f]!==d?i[f]:i.black:/^#([A-f\d]{3}){1,2}$/i.test(f)?h=a(f):/^rgba?\(/i.test(f)||(h=i.black),g=(h||f).toString().match(q.RegEx.valueUnwrap)[1].replace(/,(\s+)?/g," ")}return 8>=m||3!==g.split(" ").length||(g+=" 1"),g;case"inject":return 8>=m?4===f.split(" ").length&&(f=f.split(/\s+/).slice(0,3).join(" ")):3===f.split(" ").length&&(f+=" 1"),(8>=m?"rgb":"rgba")+"("+f.replace(/\s+/g,",").replace(/\.(\d)+(?=,)/g,"")+")"}}}()}},Names:{camelCase:function(a){return a.replace(/-(\w)/g,function(a,b){return b.toUpperCase()})},prefixCheck:function(a){if(p.State.prefixMatches[a])return[p.State.prefixMatches[a],!0];for(var b=["","Webkit","Moz","ms","O"],c=0,d=b.length;d>c;c++){var e;if(e=0===c?a:b[c]+a.replace(/^\w/,function(a){return a.toUpperCase()}),"string"==typeof p.State.prefixElement.style[e])return p.State.prefixMatches[a]=e,[e,!0]}return[a,!1]}},Values:{isCSSNullValue:function(a){return 0==a||/^(none|auto|transparent|(rgba\(0, ?0, ?0, ?0\)))$/i.test(a)},getUnitType:function(a){return/^(rotate|skew)/i.test(a)?"deg":/(^(scale|scaleX|scaleY|scaleZ|opacity|alpha|fillOpacity|flexGrow|flexHeight|zIndex|fontWeight)$)|color/i.test(a)?"":"px"},getDisplayType:function(a){var b=a.tagName.toString().toLowerCase();return/^(b|big|i|small|tt|abbr|acronym|cite|code|dfn|em|kbd|strong|samp|var|a|bdo|br|img|map|object|q|script|span|sub|sup|button|input|label|select|textarea)$/i.test(b)?"inline":/^(li)$/i.test(b)?"list-item":"block"}},getPropertyValue:function(a,c,e,f){function g(a,c){var e=0;if(8>=m)e=o.css(a,c);else{if(!f){if("height"===c&&"border-box"!==q.getPropertyValue(a,"boxSizing").toString().toLowerCase())return a.offsetHeight-(parseFloat(q.getPropertyValue(a,"borderTopWidth"))||0)-(parseFloat(q.getPropertyValue(a,"borderBottomWidth"))||0)-(parseFloat(q.getPropertyValue(a,"paddingTop"))||0)-(parseFloat(q.getPropertyValue(a,"paddingBottom"))||0);if("width"===c&&"border-box"!==q.getPropertyValue(a,"boxSizing").toString().toLowerCase())return a.offsetWidth-(parseFloat(q.getPropertyValue(a,"borderLeftWidth"))||0)-(parseFloat(q.getPropertyValue(a,"borderRightWidth"))||0)-(parseFloat(q.getPropertyValue(a,"paddingLeft"))||0)-(parseFloat(q.getPropertyValue(a,"paddingRight"))||0)}var h;h=o.data(a,l)===d?b.getComputedStyle(a,null):o.data(a,l).computedStyle?o.data(a,l).computedStyle:o.data(a,l).computedStyle=b.getComputedStyle(a,null),m&&"borderColor"===c&&(c="borderTopColor"),e=9===m&&"filter"===c?h.getPropertyValue(c):h[c],(""===e||null===e)&&(e=a.style[c])}if("auto"===e&&/^(top|right|bottom|left)$/i.test(c)){var i=g(a,"position");("fixed"===i||"absolute"===i&&/top|left/i.test(c))&&(e=o(a).position()[c]+"px")}return e}var h;if(q.Hooks.registered[c]){var i=c,j=q.Hooks.getRoot(i);e===d&&(e=q.getPropertyValue(a,q.Names.prefixCheck(j)[0])),q.Normalizations.registered[j]&&(e=q.Normalizations.registered[j]("extract",a,e)),h=q.Hooks.extractValue(i,e)}else if(q.Normalizations.registered[c]){var k,n;k=q.Normalizations.registered[c]("name",a),"transform"!==k&&(n=g(a,q.Names.prefixCheck(k)[0]),q.Values.isCSSNullValue(n)&&q.Hooks.templates[c]&&(n=q.Hooks.templates[c][1])),h=q.Normalizations.registered[c]("extract",a,n)}return/^[\d-]/.test(h)||(h=g(a,q.Names.prefixCheck(c)[0])),q.Values.isCSSNullValue(h)&&(h=0),p.debug>=2&&console.log("Get "+c+": "+h),h},setPropertyValue:function(a,c,d,e,f){var g=c;if("scroll"===c)f.container?f.container["scroll"+f.direction]=d:"Left"===f.direction?b.scrollTo(d,f.alternateValue):b.scrollTo(f.alternateValue,d);else if(q.Normalizations.registered[c]&&"transform"===q.Normalizations.registered[c]("name",a))q.Normalizations.registered[c]("inject",a,d),g="transform",d=o.data(a,l).transformCache[c];else{if(q.Hooks.registered[c]){var h=c,i=q.Hooks.getRoot(c);e=e||q.getPropertyValue(a,i),d=q.Hooks.injectValue(h,d,e),c=i}if(q.Normalizations.registered[c]&&(d=q.Normalizations.registered[c]("inject",a,d),c=q.Normalizations.registered[c]("name",a)),g=q.Names.prefixCheck(c)[0],8>=m)try{a.style[g]=d}catch(j){console.log("Error setting ["+g+"] to ["+d+"]")}else a.style[g]=d;p.debug>=2&&console.log("Set "+c+" ("+g+"): "+d)}return[g,d]},flushTransformCache:function(a){var b,c,d,e="";for(b in o.data(a,l).transformCache)c=o.data(a,l).transformCache[b],"transformPerspective"!==b?(9===m&&"rotateZ"===b&&(b="rotate"),e+=b+c+" "):d=c;d&&(e="perspective"+d+" "+e),q.setPropertyValue(a,"transform",e)}};q.Hooks.register(),q.Normalizations.register(),p.animate=function(){function a(a){var b=a;return"string"==typeof a?p.Easings[a]||(b=!1):b=g(a)?i.apply(null,a):!1,b===!1&&(b=p.Easings[p.defaults.easing]?p.defaults.easing:"swing"),b}function k(){function b(){function b(b){var c=d,e=d,j=d;return g(b)?(c=b[0],!g(b[1])&&/^[\d-]/.test(b[1])||f(b[1])?j=b[1]:("string"==typeof b[1]||g(b[1]))&&(e=a(b[1]),b[2]&&(j=b[2]))):c=b,e=e||i.easing,f(c)&&(c=c.call(h,v,u)),f(j)&&(j=j.call(h,v,u)),[c||0,e,j]}function n(a,b){var c,d;return d=(b||0).toString().toLowerCase().replace(/[%A-z]+$/,function(a){return c=a,""}),c||(c=q.Values.getUnitType(a)),[d,c]}function w(){var a={parent:h.parentNode,position:q.getPropertyValue(h,"position"),fontSize:q.getPropertyValue(h,"fontSize")},b=a.position===z.lastPosition&&a.parent===z.lastParent,d=a.fontSize===z.lastFontSize&&a.parent===z.lastParent;z.lastParent=a.parent,z.lastPosition=a.position,z.lastFontSize=a.fontSize,null===z.remToPxRatio&&(z.remToPxRatio=parseFloat(q.getPropertyValue(c.body,"fontSize"))||16);var e={overflowX:null,overflowY:null,boxSizing:null,width:null,minWidth:null,maxWidth:null,height:null,minHeight:null,maxHeight:null,paddingLeft:null},f={},g=10;if(f.remToPxRatio=z.remToPxRatio,m)var i=/^auto$/i.test(h.currentStyle.width),j=/^auto$/i.test(h.currentStyle.height);b&&d||(e.overflowX=q.getPropertyValue(h,"overflowX"),e.overflowY=q.getPropertyValue(h,"overflowY"),e.boxSizing=q.getPropertyValue(h,"boxSizing"),e.width=q.getPropertyValue(h,"width",null,!0),e.minWidth=q.getPropertyValue(h,"minWidth"),e.maxWidth=q.getPropertyValue(h,"maxWidth")||"none",e.height=q.getPropertyValue(h,"height",null,!0),e.minHeight=q.getPropertyValue(h,"minHeight"),e.maxHeight=q.getPropertyValue(h,"maxHeight")||"none",e.paddingLeft=q.getPropertyValue(h,"paddingLeft")),b?(f.percentToPxRatioWidth=z.lastPercentToPxWidth,f.percentToPxRatioHeight=z.lastPercentToPxHeight):(q.setPropertyValue(h,"overflowX","hidden"),q.setPropertyValue(h,"overflowY","hidden"),q.setPropertyValue(h,"boxSizing","content-box"),q.setPropertyValue(h,"width",g+"%"),q.setPropertyValue(h,"minWidth",g+"%"),q.setPropertyValue(h,"maxWidth",g+"%"),q.setPropertyValue(h,"height",g+"%"),q.setPropertyValue(h,"minHeight",g+"%"),q.setPropertyValue(h,"maxHeight",g+"%")),d?f.emToPxRatio=z.lastEmToPx:q.setPropertyValue(h,"paddingLeft",g+"em"),b||(f.percentToPxRatioWidth=z.lastPercentToPxWidth=(parseFloat(q.getPropertyValue(h,"width",null,!0))||1)/g,f.percentToPxRatioHeight=z.lastPercentToPxHeight=(parseFloat(q.getPropertyValue(h,"height",null,!0))||1)/g),d||(f.emToPxRatio=z.lastEmToPx=(parseFloat(q.getPropertyValue(h,"paddingLeft"))||1)/g);for(var k in e)null!==e[k]&&q.setPropertyValue(h,k,e[k]);return m?(i&&q.setPropertyValue(h,"width","auto"),j&&q.setPropertyValue(h,"height","auto")):(q.setPropertyValue(h,"height","auto"),e.height!==q.getPropertyValue(h,"height",null,!0)&&q.setPropertyValue(h,"height",e.height),q.setPropertyValue(h,"width","auto"),e.width!==q.getPropertyValue(h,"width",null,!0)&&q.setPropertyValue(h,"width",e.width)),p.debug>=1&&console.log("Unit ratios: "+JSON.stringify(f),h),f}if(0===v&&t&&f(t.begin)){var x=r.jquery?r.get():r;t.begin.call(x,x)}if("scroll"===y){var B,C,D,E=/^x$/i.test(i.axis)?"Left":"Top",F=parseFloat(i.offset)||0;i.container?i.container.jquery||i.container.nodeType?(i.container=i.container[0]||i.container,B=i.container["scroll"+E],D=B+o(h).position()[E.toLowerCase()]+F):i.container=null:(B=p.State.scrollAnchor[p.State["scrollProperty"+E]],C=p.State.scrollAnchor[p.State["scrollProperty"+("Left"===E?"Top":"Left")]],D=o(h).offset()[E.toLowerCase()]+F),k={scroll:{rootPropertyValue:!1,startValue:B,currentValue:B,endValue:D,unitType:"",easing:i.easing,scrollData:{container:i.container,direction:E,alternateValue:C}},element:h}}else if("reverse"===y){if(!o.data(h,l).tweensContainer)return void o.dequeue(h,i.queue);"none"===o.data(h,l).opts.display&&(o.data(h,l).opts.display="block"),o.data(h,l).opts.loop=!1,o.data(h,l).opts.begin=null,o.data(h,l).opts.complete=null,i=o.extend({},o.data(h,l).opts,t);var G=o.extend(!0,{},o.data(h,l).tweensContainer);for(var H in G)if("element"!==H){var I=G[H].startValue;G[H].startValue=G[H].currentValue=G[H].endValue,G[H].endValue=I,t&&(G[H].easing=i.easing)}k=G}else if("start"===y){var G;o.data(h,l).tweensContainer&&o.data(h,l).isAnimating===!0&&(G=o.data(h,l).tweensContainer);for(var J in s){var K=b(s[J]),L=K[0],M=K[1],N=K[2];J=q.Names.camelCase(J);var O=q.Hooks.getRoot(J),P=!1;if(q.Names.prefixCheck(O)[1]!==!1||q.Normalizations.registered[O]!==d){i.display&&"none"!==i.display&&/opacity|filter/.test(J)&&!N&&0!==L&&(N=0),i._cacheValues&&G&&G[J]?(N===d&&(N=G[J].endValue+G[J].unitType),P=o.data(h,l).rootPropertyValueCache[O]):q.Hooks.registered[J]?N===d?(P=q.getPropertyValue(h,O),N=q.getPropertyValue(h,J,P)):P=q.Hooks.templates[O][1]:N===d&&(N=q.getPropertyValue(h,J));var Q,R,S,T;Q=n(J,N),N=Q[0],S=Q[1],Q=n(J,L),L=Q[0].replace(/^([+-\/*])=/,function(a,b){return T=b,""}),R=Q[1],N=parseFloat(N)||0,L=parseFloat(L)||0;var U;if("%"===R&&(/^(fontSize|lineHeight)$/.test(J)?(L/=100,R="em"):/^scale/.test(J)?(L/=100,R=""):/(Red|Green|Blue)$/i.test(J)&&(L=L/100*255,R="")),/[\/*]/.test(T))R=S;else if(S!==R&&0!==N)if(0===L)R=S;else{U=U||w();var V=/margin|padding|left|right|width|text|word|letter/i.test(J)||/X$/.test(J)?"x":"y";switch(S){case"%":N*="x"===V?U.percentToPxRatioWidth:U.percentToPxRatioHeight;break;case"em":N*=U.emToPxRatio;break;case"rem":N*=U.remToPxRatio;break;case"px":}switch(R){case"%":N*=1/("x"===V?U.percentToPxRatioWidth:U.percentToPxRatioHeight);break;case"em":N*=1/U.emToPxRatio;break;case"rem":N*=1/U.remToPxRatio;break;case"px":}}switch(T){case"+":L=N+L;break;case"-":L=N-L;break;case"*":L=N*L;break;case"/":L=N/L}k[J]={rootPropertyValue:P,startValue:N,currentValue:N,endValue:L,unitType:R,easing:M},p.debug&&console.log("tweensContainer ("+J+"): "+JSON.stringify(k[J]),h)}else p.debug&&console.log("Skipping ["+O+"] due to a lack of browser support.")}k.element=h}k.element&&(A.push(k),o.data(h,l).tweensContainer=k,o.data(h,l).opts=i,o.data(h,l).isAnimating=!0,v===u-1?(p.State.calls.length>1e4&&(p.State.calls=e(p.State.calls)),p.State.calls.push([A,r,i]),p.State.isTicking===!1&&(p.State.isTicking=!0,j())):v++)}var h=this,i=o.extend({},p.defaults,t),k={};if("stop"===y)return o.queue(h,"string"==typeof t?t:"",[]),!0;switch(o.data(h,l)===d&&o.data(h,l,{isAnimating:!1,computedStyle:null,tweensContainer:null,rootPropertyValueCache:{},transformCache:{}}),i.duration.toString().toLowerCase()){case"fast":i.duration=200;break;case"normal":i.duration=400;break;case"slow":i.duration=600;break;default:i.duration=parseFloat(i.duration)||1}i.easing=a(i.easing),/^\d/.test(i.delay)&&o.queue(h,i.queue,function(a){p.velocityQueueEntryFlag=!0,setTimeout(a,parseFloat(i.delay))}),i.display&&(i.display=i.display.toString().toLowerCase()),i.mobileHA=i.mobileHA&&p.State.isMobile,i.queue===!1?b():o.queue(h,i.queue,function(a){p.velocityQueueEntryFlag=!0,b(a)}),""!==i.queue&&"fx"!==i.queue||"inprogress"===o.queue(h)[0]||o.dequeue(h)}var n,r,s,t;this.jquery||b.Zepto&&b.Zepto.zepto.isZ(this)?(n=!0,r=this,s=arguments[0],t=arguments[1]):(n=!1,r=arguments[0].jquery?[].slice.call(arguments[0]):arguments[0],s=arguments[1],t=arguments[2]);var u=h(r)||g(r)?r.length:1,v=0;if("stop"!==s&&!o.isPlainObject(t)){var w=n?1:2;t={};for(var x=w;x<arguments.length;x++)!g(arguments[x])&&/^\d/.test(arguments[x])?t.duration=parseFloat(arguments[x]):"string"==typeof arguments[x]?t.easing=arguments[x]:g(arguments[x])&&4===arguments[x].length?t.easing=arguments[x]:f(arguments[x])&&(t.complete=arguments[x])}var y;switch(s){case"scroll":y="scroll";break;case"reverse":y="reverse";break;case"stop":y="stop";break;default:if(!o.isPlainObject(s)||o.isEmptyObject(s))return"string"==typeof s&&p.Sequences[s]?(o.each(r,function(a,b){p.Sequences[s].call(b,b,t||{},a,u)}),r):(p.debug&&console.log("First argument was not a property map, a known action, or a registered sequence. Aborting."),r);y="start"}var z={lastParent:null,lastPosition:null,lastFontSize:null,lastPercentToPxWidth:null,lastPercentToPxHeight:null,lastEmToPx:null,remToPxRatio:null},A=[];if(t&&t.complete&&!f(t.complete)&&(t.complete=null),n)r.each(k);else if(1===u&&r.nodeType)k.call(r);else for(var B in r)r[B].nodeType&&k.call(r[B]);var C,D=o.extend({},p.defaults,t);if(D.loop=parseInt(D.loop),C=2*D.loop-1,D.loop)for(var E=0;C>E;E++){var F={delay:D.delay};D.complete&&E===C-1&&(F.complete=D.complete),n?r.velocity("reverse",F):p.animate(r,"reverse",F)}return r};var r=b.jQuery||b.Zepto;r&&(r.fn.velocity=p.animate,r.fn.velocity.defaults=p.defaults),o.each(["Down","Up"],function(a,b){p.Sequences["slide"+b]=function(a,c){var d=o.extend({},c),e={height:null,marginTop:null,marginBottom:null,paddingTop:null,paddingBottom:null,overflow:null,overflowX:null,overflowY:null},f=d.begin,g=d.complete,h=!1;d.display="Down"===b?d.display||"block":d.display||"none",d.begin=function(){function c(){a.style.display="block",e.height=p.CSS.getPropertyValue(a,"height"),a.style.height="auto",p.CSS.getPropertyValue(a,"height")===e.height&&(h=!0),p.CSS.setPropertyValue(a,"height",e.height+"px")}if("Down"===b){e.overflow=[p.CSS.getPropertyValue(a,"overflow"),0],e.overflowX=[p.CSS.getPropertyValue(a,"overflowX"),0],e.overflowY=[p.CSS.getPropertyValue(a,"overflowY"),0],a.style.overflow="hidden",a.style.overflowX="visible",a.style.overflowY="hidden",c();for(var d in e)/^overflow/.test(d)||(e[d]=[p.CSS.getPropertyValue(a,d),0]);a.style.display="none"}else{c();for(var d in e)e[d]=[0,p.CSS.getPropertyValue(a,d)];a.style.overflow="hidden",a.style.overflowX="visible",a.style.overflowY="hidden"}f&&f.call(a,a)},d.complete=function(a){var c="Down"===b?0:1;h===!0?e.height[c]="auto":e.height[c]+="px";for(var d in e)a.style[d]=e[d][c];g&&g.call(a,a)},p.animate(a,e,d)}}),o.each(["In","Out"],function(a,b){p.Sequences["fade"+b]=function(a,c,d,e){var f=o.extend({},c),g={opacity:"In"===b?1:0};d!==e-1&&(f.complete=f.begin=null),f.display||(f.display="In"===b?p.CSS.Values.getDisplayType(a):"none"),p.animate(this,g,f)}})}(window.jQuery||window.Zepto||window,window,document);