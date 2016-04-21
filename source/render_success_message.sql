function render_success_message(p_dynamic_action in apex_plugin.t_dynamic_action,
                                p_plugin         in apex_plugin.t_plugin )
return apex_plugin.t_dynamic_action_render_result is
    --
    -- plugin attributes
    l_result                   apex_plugin.t_dynamic_action_render_result;
    l_page_template            apex_application_pages.page_template%type;
    l_success_message_template apex_application_temp_page.success_message%type;
    l_logging                  varchar2(50)  := p_plugin.attribute_01;
    l_wrap_class               varchar2(100) := p_plugin.attribute_02;
    l_close_trigger            varchar2(100) := p_plugin.attribute_03;
    l_close_notification_text  varchar2(500) := p_dynamic_action.attribute_01;
begin
    -- Debug
    if apex_application.g_debug then
        apex_plugin_util.debug_dynamic_action(p_plugin         => p_plugin,
                                              p_dynamic_action => p_dynamic_action);
    end if;
    
    --
    -- add tooltipster and apextooltip js files
    apex_javascript.add_library(p_name                  => 'apexDialogSuccessMessage',
                                p_directory             => p_plugin.file_prefix || 'js/',
                                p_check_to_add_minified => true);
    
    -- get the current page template
    select page_template
      into l_page_template
      from apex_application_pages
     where application_id = :APP_ID
       and page_id = :APP_PAGE_ID;
    
    -- get default application page template
    if l_page_template is null then
        select page_template
          into l_page_template
          from apex_applications
         where application_id = :APP_ID;
    end if;
    
    -- get the success message template from the page template
    select success_message
      into l_success_message_template
      from apex_application_temp_page
     where application_id = :APP_ID
       and template_name = l_page_template;
    
    l_result.javascript_function := 'apexDialogSuccessMessage.showMessage';
    l_result.attribute_01        := l_success_message_template;
    l_result.attribute_02        := l_close_notification_text;
    l_result.attribute_03        := l_wrap_class;
    l_result.attribute_04        := l_close_trigger;
    l_result.attribute_05        := l_logging;
    
    return l_result;
end render_success_message;