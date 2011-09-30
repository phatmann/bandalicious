/*
 * Content-Type:text/javascript
 * 
 * A bridge between touch events and jquery draggable, 
 * sortable etc. mouse interactions.
 *
 * @author Oleg Slobodskoi @oleg008 https://github.com/kof/labs 
 * @author John Hardy @jhlagado https://github.com/jhlagado/Mouse.Touch
 * 
 * Modifications by John Hardy (@jhlagado) 
 * 
 * Copyright 2010, Oleg Slobodskoi 
 * Copyright 2011, John Hardy, Lagado, lagado.com
 * 
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * 
 * http://jquery.org/license
 * 
 */
(function(a){a.support.touch=typeof Touch=="object";if(!a.support.touch)return;var b=a.ui.mouse.prototype,c=b._mouseInit;a.extend(b,{_mouseInit:function(){this.element.bind("touchstart."+this.widgetName,a.proxy(this,"_touchStart")),c.apply(this,arguments)},_touchStart:function(b){if(typeof b.originalEvent!="undefined"&&b.originalEvent.touches.length!=1)return!1;this.element.bind("touchmove."+this.widgetName,a.proxy(this,"_touchMove")).bind("touchend."+this.widgetName,a.proxy(this,"_touchEnd")),this._modifyEvent(b),a(document).trigger(a.Event("mouseup")),this._mouseDown(b)},_touchMove:function(a){this._modifyEvent(a),this._mouseMove(a)},_touchEnd:function(a){this.element.unbind("touchmove."+this.widgetName).unbind("touchend."+this.widgetName),this._mouseUp(a)},_modifyEvent:function(a){a.which=1;if(typeof a.originalEvent!="undefined"){var b=a.originalEvent.targetTouches[0];a.pageX=b.clientX,a.pageY=b.clientY}}})})(jQuery)