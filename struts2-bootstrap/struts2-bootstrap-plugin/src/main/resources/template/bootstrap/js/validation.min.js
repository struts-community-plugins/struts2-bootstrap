/*!
 * validation.js
 *
 * Client Validation for Bootstrap Forms
 *
 * Requires use of jQuery.
 * Tested with jQuery 1.7
 *
 * Copyright (c) 2012 Johannes Geppert http://www.jgeppert.com
 *
 * Dual licensed under the MIT and GPL licenses:
 *   http://www.opensource.org/licenses/mit-license.php
 *   http://www.gnu.org/licenses/gpl.html
 *
 */
function bootstrapValidation(a,c){a.find("div.error").removeClass("error");a.find("span.s2_help_inline").remove();a.find("div.s2_validation_errors").remove();if(c.errors&&c.errors.length>0){var b=$("<div class='alert alert-error s2_validation_errors'></div>");a.prepend(b);$.each(c.errors,function(d,e){b.append("<p>"+e+"</p>\n")})}if(c.fieldErrors){$.each(c.fieldErrors,function(e,g){var f=a.find(':input[name="'+e+'"]'),h,d;if(f&&f.length>0){f=$(f[0]);h=f.closest("div.control-group");h.addClass("error");d=h.find("div.controls");if(d){d.append("<span class='help-inline s2_help_inline'>"+g[0]+"</span>")}}})}};