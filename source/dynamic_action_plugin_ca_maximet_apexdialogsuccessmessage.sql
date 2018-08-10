prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.4.00.08'
,p_default_workspace_id=>1831031383256658
,p_default_application_id=>400
,p_default_owner=>'MAX_PLAYGROUND'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/ca_maximet_apexdialogsuccessmessage
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(128009380812160315)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'CA.MAXIMET.APEXDIALOGSUCCESSMESSAGE'
,p_display_name=>'Show Close Dialog Success Message'
,p_category=>'MISC'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>'#PLUGIN_FILES#js/apexDialogSuccessMessage#MIN#.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*-------------------------------------',
' * APEX Dialog Success Message functions',
' * Version: 2.0 (2018-08-10)',
' * Author:  Maxime Tremblay',
' *-------------------------------------',
'*/',
'function render_success_message(p_dynamic_action in apex_plugin.t_dynamic_action,',
'                                p_plugin         in apex_plugin.t_plugin )',
'return apex_plugin.t_dynamic_action_render_result is',
'    --',
'    -- plugin attributes',
'    l_result                   apex_plugin.t_dynamic_action_render_result;',
'',
'    l_notification_override    p_dynamic_action.attribute_03%type := p_dynamic_action.attribute_03;',
'    l_notification_message     p_dynamic_action.attribute_02%type := case when l_notification_override = ''Y'' then p_dynamic_action.attribute_02 end;',
'begin',
'    -- Debug',
'    if apex_application.g_debug then',
'        apex_plugin_util.debug_dynamic_action(p_plugin         => p_plugin,',
'                                              p_dynamic_action => p_dynamic_action);',
'    end if;',
'',
'    l_result.javascript_function := ''apexDialogSuccessMessage.showMessage'';',
'    l_result.attribute_01        := l_notification_message;',
'',
'    return l_result;',
'end render_success_message;'))
,p_api_version=>1
,p_render_function=>'render_success_message'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'This dynamic action plugin is used to display the Success Message from the corresponding Dialog Close process.'
,p_version_identifier=>'2.0'
,p_about_url=>'https://github.com/maxime-tremblay/apex-plugin-dialogsuccessmessage'
,p_files_version=>16
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(81805449731982812)
,p_plugin_id=>wwv_flow_api.id(128009380812160315)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>30
,p_prompt=>'Notification Message'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(82805004153601712)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(82805004153601712)
,p_plugin_id=>wwv_flow_api.id(128009380812160315)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>20
,p_prompt=>'Override Message'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2F2041504558204469616C6F672053756363657373204D6573736167652066756E6374696F6E730D0A2F2F20417574686F723A204D6178696D65205472656D626C61790D0A2F2F2056657273696F6E3A20322E300D0A0D0A2F2A2A0D0A202A20406E61';
wwv_flow_api.g_varchar2_table(2) := '6D6573706163650D0A202A2A2F0D0A76617220617065784469616C6F67537563636573734D657373616765203D207B7D3B0D0A0D0A282066756E6374696F6E2820706C7567696E2C206D6573736167652C2064656275672C20242C20756E646566696E65';
wwv_flow_api.g_varchar2_table(3) := '642029207B0D0A202020202275736520737472696374223B0D0A0D0A202020202F2A2A0D0A20202020202A20416464206D6573736167657320666F7220757365206279206765744D65737361676520616E642074686520666F726D61742066756E637469';
wwv_flow_api.g_varchar2_table(4) := '6F6E732E2043616E2062652063616C6C6564206D756C7469706C652074696D65732E204164646974696F6E616C0D0A20202020202A206D6573736167657320617265206D65726765642E0D0A20202020202A0D0A20202020202A2040706172616D20207B';
wwv_flow_api.g_varchar2_table(5) := '4F626A6563747D20704D65737361676573202020416E206F626A6563742077686F73652070726F7065727469657320617265206D657373616765206B65797320616E64207468652076616C75657320617265206C6F63616C697A6564206D657373616765';
wwv_flow_api.g_varchar2_table(6) := '20746578742E0D0A20202020202A0D0A20202020202A204066756E6374696F6E2073686F774D6573736167650D0A20202020202A20406D656D6265724F6620617065784469616C6F67537563636573734D6573736167650D0A20202020202A2A2F0D0A20';
wwv_flow_api.g_varchar2_table(7) := '202020706C7567696E2E73686F774D657373616765203D2066756E6374696F6E282029207B0D0A20202020202020202F2A0D0A2020202020202020202A20506C7567696E20417474726962757465730D0A2020202020202020202A2F0D0A202020202020';
wwv_flow_api.g_varchar2_table(8) := '202076617220646154686973203D20746869733B0D0A2020202020202020766172206C4D657373616765203D206461546869732E616374696F6E2E6174747269627574653031207C7C206461546869732E646174612E737563636573734D657373616765';
wwv_flow_api.g_varchar2_table(9) := '2E74657874207C7C2027273B0D0A2020202020202020202020200D0A20202020202020202F2A0D0A2020202020202020202A204C6F6767696E670D0A2020202020202020202A2F200D0A202020202020202064656275672E696E666F282773686F774D65';
wwv_flow_api.g_varchar2_table(10) := '73736167653A204174747269627574652053756363657373204D6573736167653A272C206C4D657373616765293B0D0A20202020202020200D0A20202020202020202F2A0D0A2020202020202020202A2053686F77206D6573736167650D0A2020202020';
wwv_flow_api.g_varchar2_table(11) := '202020202A2F0D0A20202020202020206D6573736167652E73686F77506167655375636365737328206C4D65737361676520293B0D0A202020207D3B0D0A0D0A7D292820617065784469616C6F67537563636573734D6573736167652C20617065782E6D';
wwv_flow_api.g_varchar2_table(12) := '6573736167652C20617065782E64656275672C20617065782E6A517565727920293B0D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(6948063990293581)
,p_plugin_id=>wwv_flow_api.id(128009380812160315)
,p_file_name=>'js/apexDialogSuccessMessage.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '76617220617065784469616C6F67537563636573734D6573736167653D7B7D3B2166756E6374696F6E28732C652C612C742C63297B2275736520737472696374223B732E73686F774D6573736167653D66756E6374696F6E28297B76617220733D746869';
wwv_flow_api.g_varchar2_table(2) := '732E616374696F6E2E61747472696275746530317C7C746869732E646174612E737563636573734D6573736167652E746578747C7C22223B612E696E666F282273686F774D6573736167653A204174747269627574652053756363657373204D65737361';
wwv_flow_api.g_varchar2_table(3) := '67653A222C73292C652E73686F7750616765537563636573732873297D7D28617065784469616C6F67537563636573734D6573736167652C617065782E6D6573736167652C617065782E64656275672C617065782E6A5175657279293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(6948400226293961)
,p_plugin_id=>wwv_flow_api.id(128009380812160315)
,p_file_name=>'js/apexDialogSuccessMessage.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
