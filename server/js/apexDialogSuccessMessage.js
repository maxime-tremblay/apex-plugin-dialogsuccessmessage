// APEX Dialog Success Message functions
// Author: Maxime Tremblay
// Version: 1.2

// global namespace
var apexDialogSuccessMessage = {
    // parse string to boolean
    parseBoolean: function(pString) {
        var lBoolean;

        switch(pString.toLowerCase()) {
            case 'true':
                lBoolean = true;
                break;
            case 'false':
                lBoolean = false;
                break;
            default:
                lBoolean = undefined;
        }

        return lBoolean;
    },
    // function that gets called from plugin
    showMessage: function() {
        // plugin attributes
        var daThis = this;
        var lTemplate = daThis.action.attribute01;
        var lMessage = daThis.action.attribute06 || daThis.data.successMessage.text || '';
        var lCloseNotificationText = daThis.action.attribute02;
        var lWrapClass = daThis.action.attribute03;
        var lCloseMessageTrigger = daThis.action.attribute04;
        var lLogging = apexDialogSuccessMessage.parseBoolean(daThis.action.attribute05);
        var lHtml = '<div class="' + lWrapClass + '">'
                    + lTemplate.replace('#SUCCESS_MESSAGE#', lMessage)
                               .replace('#CLOSE_NOTIFICATION#', lCloseNotificationText)
                    + '</div>';
        var lContainer;

        // Logging
        if (lLogging) {
            apex.debug.trace('showMessage: Attribute Success Message Template:', lTemplate);
            apex.debug.trace('showMessage: Attribute Success Message:', lMessage);
            apex.debug.trace('showMessage: Attribute Wrapping Class:', lWrapClass);
            apex.debug.trace('showMessage: Attribute Close Message Trigger:', lCloseMessageTrigger);
            apex.debug.trace('showMessage: Attribute Logging:', lLogging);
        }
        //remove previous message
        apex.jQuery('.' + lWrapClass).remove();

        //find the standard container for the message
        if ($('#t_Body_content').length > 0){
            lContainer = $('#t_Body_content');
        }
        else if ($('.t-Body').length > 0){
            lContainer = $('.t-Body');
        }
        else if ($('.t-Dialog-Body').length > 0){
            lContainer = $('.t-Dialog-Body');
        }
        else {
            lContainer = $(body);
        }

        //add new message
        //apex.jQuery(lHtml).prependTo('#t_Body_content').wrap('<div class="' + lWrapClass + '"></div>');
        apex.jQuery(lHtml).prependTo(lContainer);

        //Set visible for default UT success message template
        apex.jQuery('.t-Body-alert .t-Alert').addClass('is-visible');

        apex.jQuery(lCloseMessageTrigger).click(function(){
            apex.jQuery('.' + lWrapClass).remove();
        });
    }
};