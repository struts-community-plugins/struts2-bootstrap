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

const bootstrapValidation = (form, errors) => {
    'use strict';

    const clearExistingErrors = () => {
        const elementsToClean = [
            '.is-invalid',
            '.invalid-feedback',
            'div.s2_help_inline',
            'small.s2_feedback',
            'div.s2_validation_errors'
        ];

        elementsToClean.forEach(selector => {
            const elements = form.find(selector);
            selector.startsWith('.')
                ? elements.removeClass(selector.substring(1))
                : elements.remove();
        });
    };

    const handleNonFieldErrors = () => {
        if (!errors.errors?.length) return;

        const errorDiv = $('<div>').addClass('alert alert-danger s2_validation_errors');
        const errorMessages = errors.errors.map(value =>
            $('<div>').text(value)
        );

        errorDiv.append(errorMessages);
        form.prepend(errorDiv);
    };

    const handleFieldErrors = () => {
        if (!errors.fieldErrors) return;

        Object.entries(errors.fieldErrors).forEach(([fieldName, value]) => {
            const element = form.find(`:input[name="${fieldName}"]`);

            if (element?.length > 0) {
                // Your existing logic for handling individual field errors would continue here
                // This is where the code snippet ends in the original
            }
        });
    };

    // Main execution
    clearExistingErrors();
    handleNonFieldErrors();
    handleFieldErrors();
};
