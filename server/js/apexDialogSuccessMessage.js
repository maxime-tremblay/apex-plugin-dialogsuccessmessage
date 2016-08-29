// APEX Dialog Success Message functions
// Author: Maxime Tremblay
// Version: 1.1

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
        var lHtml = lTemplate.replace('#SUCCESS_MESSAGE#', lMessage)
                             .replace('#CLOSE_NOTIFICATION#', lCloseNotificationText);

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

        //add new message
        apex.jQuery(lHtml).prependTo('#t_Body_content').wrap('<div class="' + lWrapClass + '"></div>');

        //Set visible for default UT success message template
        apex.jQuery('.t-Body-alert .t-Alert').addClass('is-visible');

        apex.jQuery(lCloseMessageTrigger).click(function(){
            apex.jQuery('.' + lWrapClass).remove();
        });
    }
};