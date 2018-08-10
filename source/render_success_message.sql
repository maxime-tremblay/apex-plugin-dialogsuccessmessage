/*-------------------------------------
 * APEX Dialog Success Message functions
 * Version: 2.0 (2018-08-10)
 * Author:  Maxime Tremblay
 *-------------------------------------
*/
function render_success_message(p_dynamic_action in apex_plugin.t_dynamic_action,
                                p_plugin         in apex_plugin.t_plugin )
return apex_plugin.t_dynamic_action_render_result is
    --
    -- plugin attributes
    l_result                   apex_plugin.t_dynamic_action_render_result;

    l_notification_override    p_dynamic_action.attribute_03%type := p_dynamic_action.attribute_03;
    l_notification_message     p_dynamic_action.attribute_02%type := case when l_notification_override = 'Y' then p_dynamic_action.attribute_02 end;
begin
    -- Debug
    if apex_application.g_debug then
        apex_plugin_util.debug_dynamic_action(p_plugin         => p_plugin,
                                              p_dynamic_action => p_dynamic_action);
    end if;

    l_result.javascript_function := 'apexDialogSuccessMessage.showMessage';
    l_result.attribute_01        := l_notification_message;

    return l_result;
end render_success_message;