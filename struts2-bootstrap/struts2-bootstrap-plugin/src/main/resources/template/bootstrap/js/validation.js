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


function bootstrapValidation(form, errors) {

    "use strict";

    // Clear existing errors on submit
    form.find("div.error").removeClass("error");
    form.find("span.s2_help_inline").remove();
    form.find("div.s2_validation_errors").remove();

    //Handle non field errors
    if (errors.errors && errors.errors.length > 0) {
        var errorDiv = $("<div class='alert alert-error s2_validation_errors'></div>");
        form.prepend(errorDiv);
        $.each(errors.errors, function(index, value) {
            errorDiv.append('<p>' + value + '</p>\n');
        });
    }

    //Handle field errors
    if (errors.fieldErrors) {
        $.each(errors.fieldErrors, function(index, value) {
            var element = form.find(":input[name=\"" + index + "\"]"), controlGroup, controls;
            if (element && element.length > 0) {

            // select first element
                element = $(element[0]);
            controlGroup = element.closest("div.control-group");
            controlGroup.addClass('error');
            controls = controlGroup.find("div.controls");
            if (controls) {
                controls.append("<span class='help-inline s2_help_inline'>" + value[0] + "</span>");
            }
            }
        });
    }
}