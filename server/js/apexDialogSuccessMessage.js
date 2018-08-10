// APEX Dialog Success Message functions
// Author: Maxime Tremblay
// Version: 2.0

/**
 * @namespace
 **/
var apexDialogSuccessMessage = {};

( function( plugin, message, debug, $, undefined ) {
    "use strict";

    /**
     * Add messages for use by getMessage and the format functions. Can be called multiple times. Additional
     * messages are merged.
     *
     * @param  {Object} pMessages   An object whose properties are message keys and the values are localized message text.
     *
     * @function showMessage
     * @memberOf apexDialogSuccessMessage
     **/
    plugin.showMessage = function( ) {
        /*
         * Plugin Attributes
         */
        var daThis = this;
        var lMessage = daThis.action.attribute01 || daThis.data.successMessage.text || '';
            
        /*
         * Logging
         */ 
        debug.info('showMessage: Attribute Success Message:', lMessage);
        
        /*
         * Show message
         */
        message.showPageSuccess( lMessage );
    };

})( apexDialogSuccessMessage, apex.message, apex.debug, apex.jQuery );
