/*!
 * validation.js
 *
 * Client Validation for Bootstrap Forms
 *
 * Requires use of jQuery.
 * Tested with jQuery 1.7
 *
 * Copyright (c) 2021 Johannes Geppert https://www.jgeppert.com
 *
 * Dual licensed under the MIT and GPL licenses:
 *   http://www.opensource.org/licenses/mit-license.php
 *   http://www.gnu.org/licenses/gpl.html
 *
 */


function bootstrapValidation(form, errors) {

    "use strict";

    // Clear existing errors on submit
    form.find(".is-invalid").removeClass("is-invalid");
    form.find(".invalid-feedback").removeClass("invalid-feedback");
    form.find("div.s2_help_inline").remove();
    form.find("small.s2_feedback").remove();
    form.find("div.s2_validation_errors").remove();

    //Handle non field errors
    if (errors.errors && errors.errors.length > 0) {
        var errorDiv = $("<div class='alert alert-danger s2_validation_errors'></div>");
        form.prepend(errorDiv);
        $.each(errors.errors, function(index, value) {
            errorDiv.append('<div>' + value + '</div>\n');
        });
    }

    //Handle field errors
    if (errors.fieldErrors) {
        $.each(errors.fieldErrors, function(index, value) {
            var element = form.find(":input[name=\"" + index + "\"]"), controlGroup, controls;
            if (element && element.length > 0) {

                // select first element
                element = $(element[0]);
                element.addClass('is-invalid');
                if (element) {
                    if(!(element.is(':radio') || element.is(':checkbox'))) {
                        element.append("<small class='bi bi-x-circle form-control-feedback s2_feedback'></small>");
                    }
                    element.after("<div class='invalid-feedback s2_help_inline'>" + value[0] + "</div>");
                }
            }
        });
    }
}