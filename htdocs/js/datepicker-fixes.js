$(document).ready(function () {
    //ncote
    //always use the jquery datepicker so we can control the format
    //htdocs/js/polyfills.js does some of this when native datepicker is not available so might cause a conflict on older browsers
    //  esp. the event listener for keydown, which ignores keypresses
    var inputDateFormat = 'dd-M-yy';
    var inputDateformatPlaceholder = 'dd-MMM-yyyy';  //user-friendly format hint
    var serverDateFormat = 'yy-mm-dd';

    var dateInputs = $('input[type=date]');

    //disable native datepicker, i.e. turn them into normal text inputs
    dateInputs.attr('type', 'text');
    dateInputs.attr('placeholder', inputDateformatPlaceholder);

    //to safely load and save date values, use safe format yyyy-mm-dd in an alternate hidden field
    //rename existing date fields to ...-visible, and inject fields with original names to hold the universal format
    dateInputs.each(function (index, element) {
        var $element = $(element);
        var name = $element.attr('name');
        $element.attr('name', '');  //blank name will prevent submission
        $element.attr('id', name + '_visible_date_field');
        var $backingElement = $('<input type="hidden" name="' + name + '">');  //give original name to our locale-indepdent date field
        $backingElement.val($element.val());
        $element.after($backingElement);

        $element.datepicker({
            dateFormat: inputDateFormat,  //ncote: CRU standard e.g. 27-Feb-2018, but make configurable (in Smarty templates and React components as well)
            changeMonth: true,
            changeYear: true,
            yearRange: "1900:" + new Date().getFullYear(),
            constrainInput: true,
            altField: $("input[name='" + name + "']"), //i.e. original name
            altFormat: serverDateFormat
        });

        //date will have yyyy-mm-dd format from the server, so format it properly
        if ($element.val()) {  //don't check blanks
            $element.val($.datepicker.formatDate(inputDateFormat, $.datepicker.parseDate(serverDateFormat, $element.val())));
        }

        //handle invalid typed-in dates
        $element.on('change', function () {
            try {
                if ($element.val()) {  //don't check blanks
                    var date = $.datepicker.parseDate(inputDateFormat, $element.val());
                }
                else {//fix bug where blank date doesn't get transferred to backing field
                    $backingElement.val($element.val());
                }
            }
            catch (e) {
                $element.get(0).setCustomValidity('Invalid date');
                //explicitly set the bad value on the backing field so if submitted anyway, we'll get server validation
                $backingElement.val($element.val());
            }
        });
    });
});

