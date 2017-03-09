set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.4.00.12'
,p_default_workspace_id=>1711832432777060
,p_default_application_id=>300
,p_default_owner=>'MAX_PLAYGROUND'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/ca_maximet_apexdialogsuccessmessage
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(121069924631972648)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'CA.MAXIMET.APEXDIALOGSUCCESSMESSAGE'
,p_display_name=>'Show Close Dialog Success Message'
,p_category=>'MISC'
,p_supported_ui_types=>'DESKTOP'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'/*-------------------------------------',
' * APEX Dialog Success Message functions',
' * Version: 1.2 (2017-03-08)',
' * Author:  Maxime Tremblay',
' *-------------------------------------',
'*/',
'function render_success_message(p_dynamic_action in apex_plugin.t_dynamic_action,',
'                                p_plugin         in apex_plugin.t_plugin )',
'return apex_plugin.t_dynamic_action_render_result is',
'    --',
'    -- plugin attributes',
'    l_result                   apex_plugin.t_dynamic_action_render_result;',
'    l_page_template            apex_application_pages.page_template%type;',
'    l_success_message_template apex_application_temp_page.success_message%type;',
'    l_logging                  p_plugin.attribute_01%type := p_plugin.attribute_01;',
'    l_wrap_class               p_plugin.attribute_02%type := p_plugin.attribute_02;',
'    l_close_trigger            p_plugin.attribute_03%type := p_plugin.attribute_03;',
'',
'    l_close_notification_text  p_dynamic_action.attribute_01%type := p_dynamic_action.attribute_01;',
'    l_notification_override    p_dynamic_action.attribute_03%type := p_dynamic_action.attribute_03;',
'    l_notification_message     p_dynamic_action.attribute_02%type := case when l_notification_override = ''Y'' then p_dynamic_action.attribute_02 end;',
'begin',
'    -- Debug',
'    if apex_application.g_debug then',
'        apex_plugin_util.debug_dynamic_action(p_plugin         => p_plugin,',
'                                              p_dynamic_action => p_dynamic_action);',
'    end if;',
'',
'    --',
'    -- add apexDialogSuccessMessage js files',
'    apex_javascript.add_library(p_name                  => ''apexDialogSuccessMessage'',',
'                                p_directory             => p_plugin.file_prefix || ''js/'',',
'                                p_check_to_add_minified => true);',
'',
'    -- get the current page template',
'    select page_template',
'      into l_page_template',
'      from apex_application_pages',
'     where application_id = :APP_ID',
'       and page_id = :APP_PAGE_ID;',
'',
'    -- get default application page template',
'    if l_page_template is null then',
'        select page_template',
'          into l_page_template',
'          from apex_applications',
'         where application_id = :APP_ID;',
'    end if;',
'',
'    -- get the success message template from the page template',
'    select success_message',
'      into l_success_message_template',
'      from apex_application_temp_page',
'     where application_id = :APP_ID',
'       and template_name = l_page_template;',
'',
'    l_result.javascript_function := ''apexDialogSuccessMessage.showMessage'';',
'    l_result.attribute_01        := l_success_message_template;',
'    l_result.attribute_02        := l_close_notification_text;',
'    l_result.attribute_03        := l_wrap_class;',
'    l_result.attribute_04        := l_close_trigger;',
'    l_result.attribute_05        := l_logging;',
'    l_result.attribute_06        := l_notification_message;',
'',
'    return l_result;',
'end render_success_message;'))
,p_render_function=>'render_success_message'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'This dynamic action plugin is used to display the Success Message from the corresponding Dialog Close process.'
,p_version_identifier=>'1.2'
,p_about_url=>'https://github.com/maxime-tremblay/apex-plugin-dialogsuccessmessage'
,p_files_version=>12
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(121077420484748236)
,p_plugin_id=>wwv_flow_api.id(121069924631972648)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Logging'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'false'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(121078563725748867)
,p_plugin_attribute_id=>wwv_flow_api.id(121077420484748236)
,p_display_sequence=>10
,p_display_value=>'True'
,p_return_value=>'true'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(121079053707749481)
,p_plugin_attribute_id=>wwv_flow_api.id(121077420484748236)
,p_display_sequence=>20
,p_display_value=>'False'
,p_return_value=>'false'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(121086313482132824)
,p_plugin_id=>wwv_flow_api.id(121069924631972648)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Wrapping Class'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'t-Body-alert-wrap'
,p_display_length=>50
,p_max_length=>100
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(121088395676369205)
,p_plugin_id=>wwv_flow_api.id(121069924631972648)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Close Trigger'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'.t-Body-alert .t-Alert .t-Alert-buttons .t-Button.t-Button--closeAlert'
,p_display_length=>50
,p_max_length=>100
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(121080166984769168)
,p_plugin_id=>wwv_flow_api.id(121069924631972648)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Close Notification Text'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'Close Notification'
,p_max_length=>500
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(74865993551795145)
,p_plugin_id=>wwv_flow_api.id(121069924631972648)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>30
,p_prompt=>'Notification Message'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(75865547973414045)
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(75865547973414045)
,p_plugin_id=>wwv_flow_api.id(121069924631972648)
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
wwv_flow_api.g_varchar2_table(1) := '76617220617065784469616C6F67537563636573734D6573736167653D7B7061727365426F6F6C65616E3A66756E6374696F6E2861297B76617220623B73776974636828612E746F4C6F776572436173652829297B636173652274727565223A623D2130';
wwv_flow_api.g_varchar2_table(2) := '3B627265616B3B636173652266616C7365223A623D21313B627265616B3B64656661756C743A623D766F696420307D72657475726E20627D2C73686F774D6573736167653A66756E6374696F6E28297B76617220692C613D746869732C623D612E616374';
wwv_flow_api.g_varchar2_table(3) := '696F6E2E61747472696275746530312C633D612E616374696F6E2E61747472696275746530367C7C612E646174612E737563636573734D6573736167652E746578747C7C22222C643D612E616374696F6E2E61747472696275746530322C653D612E6163';
wwv_flow_api.g_varchar2_table(4) := '74696F6E2E61747472696275746530332C663D612E616374696F6E2E61747472696275746530342C673D617065784469616C6F67537563636573734D6573736167652E7061727365426F6F6C65616E28612E616374696F6E2E6174747269627574653035';
wwv_flow_api.g_varchar2_table(5) := '292C683D273C64697620636C6173733D22272B652B27223E272B622E7265706C616365282223535543434553535F4D45535341474523222C63292E7265706C616365282223434C4F53455F4E4F54494649434154494F4E23222C64292B223C2F6469763E';
wwv_flow_api.g_varchar2_table(6) := '223B67262628617065782E64656275672E7472616365282273686F774D6573736167653A204174747269627574652053756363657373204D6573736167652054656D706C6174653A222C62292C617065782E64656275672E7472616365282273686F774D';
wwv_flow_api.g_varchar2_table(7) := '6573736167653A204174747269627574652053756363657373204D6573736167653A222C63292C617065782E64656275672E7472616365282273686F774D6573736167653A20417474726962757465205772617070696E6720436C6173733A222C65292C';
wwv_flow_api.g_varchar2_table(8) := '617065782E64656275672E7472616365282273686F774D6573736167653A2041747472696275746520436C6F7365204D65737361676520547269676765723A222C66292C617065782E64656275672E7472616365282273686F774D6573736167653A2041';
wwv_flow_api.g_varchar2_table(9) := '7474726962757465204C6F6767696E673A222C6729292C617065782E6A517565727928222E222B65292E72656D6F766528292C693D24282223745F426F64795F636F6E74656E7422292E6C656E6774683E303F24282223745F426F64795F636F6E74656E';
wwv_flow_api.g_varchar2_table(10) := '7422293A2428222E742D426F647922292E6C656E6774683E303F2428222E742D426F647922293A2428222E742D4469616C6F672D426F647922292E6C656E6774683E303F2428222E742D4469616C6F672D426F647922293A2428626F6479292C61706578';
wwv_flow_api.g_varchar2_table(11) := '2E6A51756572792868292E70726570656E64546F2869292C617065782E6A517565727928222E742D426F64792D616C657274202E742D416C65727422292E616464436C617373282269732D76697369626C6522292C617065782E6A51756572792866292E';
wwv_flow_api.g_varchar2_table(12) := '636C69636B2866756E6374696F6E28297B617065782E6A517565727928222E222B65292E72656D6F766528297D297D7D3B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(65330301603486821)
,p_plugin_id=>wwv_flow_api.id(121069924631972648)
,p_file_name=>'js/apexDialogSuccessMessage.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2F2041504558204469616C6F672053756363657373204D6573736167652066756E6374696F6E730D0A2F2F20417574686F723A204D6178696D65205472656D626C61790D0A2F2F2056657273696F6E3A20312E320D0A0D0A2F2F20676C6F62616C206E';
wwv_flow_api.g_varchar2_table(2) := '616D6573706163650D0A76617220617065784469616C6F67537563636573734D657373616765203D207B0D0A202020202F2F20706172736520737472696E6720746F20626F6F6C65616E0D0A202020207061727365426F6F6C65616E3A2066756E637469';
wwv_flow_api.g_varchar2_table(3) := '6F6E2870537472696E6729207B0D0A2020202020202020766172206C426F6F6C65616E3B0D0A0D0A20202020202020207377697463682870537472696E672E746F4C6F77657243617365282929207B0D0A20202020202020202020202063617365202774';
wwv_flow_api.g_varchar2_table(4) := '727565273A0D0A202020202020202020202020202020206C426F6F6C65616E203D20747275653B0D0A20202020202020202020202020202020627265616B3B0D0A20202020202020202020202063617365202766616C7365273A0D0A2020202020202020';
wwv_flow_api.g_varchar2_table(5) := '20202020202020206C426F6F6C65616E203D2066616C73653B0D0A20202020202020202020202020202020627265616B3B0D0A20202020202020202020202064656661756C743A0D0A202020202020202020202020202020206C426F6F6C65616E203D20';
wwv_flow_api.g_varchar2_table(6) := '756E646566696E65643B0D0A20202020202020207D0D0A0D0A202020202020202072657475726E206C426F6F6C65616E3B0D0A202020207D2C0D0A202020202F2F2066756E6374696F6E207468617420676574732063616C6C65642066726F6D20706C75';
wwv_flow_api.g_varchar2_table(7) := '67696E0D0A2020202073686F774D6573736167653A2066756E6374696F6E2829207B0D0A20202020202020202F2F20706C7567696E20617474726962757465730D0A202020202020202076617220646154686973203D20746869733B0D0A202020202020';
wwv_flow_api.g_varchar2_table(8) := '2020766172206C54656D706C617465203D206461546869732E616374696F6E2E61747472696275746530313B0D0A2020202020202020766172206C4D657373616765203D206461546869732E616374696F6E2E6174747269627574653036207C7C206461';
wwv_flow_api.g_varchar2_table(9) := '546869732E646174612E737563636573734D6573736167652E74657874207C7C2027273B0D0A2020202020202020766172206C436C6F73654E6F74696669636174696F6E54657874203D206461546869732E616374696F6E2E6174747269627574653032';
wwv_flow_api.g_varchar2_table(10) := '3B0D0A2020202020202020766172206C57726170436C617373203D206461546869732E616374696F6E2E61747472696275746530333B0D0A2020202020202020766172206C436C6F73654D65737361676554726967676572203D206461546869732E6163';
wwv_flow_api.g_varchar2_table(11) := '74696F6E2E61747472696275746530343B0D0A2020202020202020766172206C4C6F6767696E67203D20617065784469616C6F67537563636573734D6573736167652E7061727365426F6F6C65616E286461546869732E616374696F6E2E617474726962';
wwv_flow_api.g_varchar2_table(12) := '7574653035293B0D0A2020202020202020766172206C48746D6C203D20273C64697620636C6173733D2227202B206C57726170436C617373202B2027223E270D0A20202020202020202020202020202020202020202B206C54656D706C6174652E726570';
wwv_flow_api.g_varchar2_table(13) := '6C616365282723535543434553535F4D45535341474523272C206C4D657373616765290D0A202020202020202020202020202020202020202020202020202020202020202E7265706C616365282723434C4F53455F4E4F54494649434154494F4E23272C';
wwv_flow_api.g_varchar2_table(14) := '206C436C6F73654E6F74696669636174696F6E54657874290D0A20202020202020202020202020202020202020202B20273C2F6469763E273B0D0A2020202020202020766172206C436F6E7461696E65723B0D0A0D0A20202020202020202F2F204C6F67';
wwv_flow_api.g_varchar2_table(15) := '67696E670D0A2020202020202020696620286C4C6F6767696E6729207B0D0A202020202020202020202020617065782E64656275672E7472616365282773686F774D6573736167653A204174747269627574652053756363657373204D65737361676520';
wwv_flow_api.g_varchar2_table(16) := '54656D706C6174653A272C206C54656D706C617465293B0D0A202020202020202020202020617065782E64656275672E7472616365282773686F774D6573736167653A204174747269627574652053756363657373204D6573736167653A272C206C4D65';
wwv_flow_api.g_varchar2_table(17) := '7373616765293B0D0A202020202020202020202020617065782E64656275672E7472616365282773686F774D6573736167653A20417474726962757465205772617070696E6720436C6173733A272C206C57726170436C617373293B0D0A202020202020';
wwv_flow_api.g_varchar2_table(18) := '202020202020617065782E64656275672E7472616365282773686F774D6573736167653A2041747472696275746520436C6F7365204D65737361676520547269676765723A272C206C436C6F73654D65737361676554726967676572293B0D0A20202020';
wwv_flow_api.g_varchar2_table(19) := '2020202020202020617065782E64656275672E7472616365282773686F774D6573736167653A20417474726962757465204C6F6767696E673A272C206C4C6F6767696E67293B0D0A20202020202020207D0D0A20202020202020202F2F72656D6F766520';
wwv_flow_api.g_varchar2_table(20) := '70726576696F7573206D6573736167650D0A2020202020202020617065782E6A517565727928272E27202B206C57726170436C617373292E72656D6F766528293B0D0A0D0A20202020202020202F2F66696E6420746865207374616E6461726420636F6E';
wwv_flow_api.g_varchar2_table(21) := '7461696E657220666F7220746865206D6573736167650D0A20202020202020206966202824282723745F426F64795F636F6E74656E7427292E6C656E677468203E2030297B0D0A2020202020202020202020206C436F6E7461696E6572203D2024282723';
wwv_flow_api.g_varchar2_table(22) := '745F426F64795F636F6E74656E7427293B0D0A20202020202020207D0D0A2020202020202020656C736520696620282428272E742D426F647927292E6C656E677468203E2030297B0D0A2020202020202020202020206C436F6E7461696E6572203D2024';
wwv_flow_api.g_varchar2_table(23) := '28272E742D426F647927293B0D0A20202020202020207D0D0A2020202020202020656C736520696620282428272E742D4469616C6F672D426F647927292E6C656E677468203E2030297B0D0A2020202020202020202020206C436F6E7461696E6572203D';
wwv_flow_api.g_varchar2_table(24) := '202428272E742D4469616C6F672D426F647927293B0D0A20202020202020207D0D0A2020202020202020656C7365207B0D0A2020202020202020202020206C436F6E7461696E6572203D202428626F6479293B0D0A20202020202020207D0D0A0D0A2020';
wwv_flow_api.g_varchar2_table(25) := '2020202020202F2F616464206E6577206D6573736167650D0A20202020202020202F2F617065782E6A5175657279286C48746D6C292E70726570656E64546F282723745F426F64795F636F6E74656E7427292E7772617028273C64697620636C6173733D';
wwv_flow_api.g_varchar2_table(26) := '2227202B206C57726170436C617373202B2027223E3C2F6469763E27293B0D0A2020202020202020617065782E6A5175657279286C48746D6C292E70726570656E64546F286C436F6E7461696E6572293B0D0A0D0A20202020202020202F2F5365742076';
wwv_flow_api.g_varchar2_table(27) := '697369626C6520666F722064656661756C742055542073756363657373206D6573736167652074656D706C6174650D0A2020202020202020617065782E6A517565727928272E742D426F64792D616C657274202E742D416C65727427292E616464436C61';
wwv_flow_api.g_varchar2_table(28) := '7373282769732D76697369626C6527293B0D0A0D0A2020202020202020617065782E6A5175657279286C436C6F73654D65737361676554726967676572292E636C69636B2866756E6374696F6E28297B0D0A202020202020202020202020617065782E6A';
wwv_flow_api.g_varchar2_table(29) := '517565727928272E27202B206C57726170436C617373292E72656D6F766528293B0D0A20202020202020207D293B0D0A202020207D0D0A7D3B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(121071616329444833)
,p_plugin_id=>wwv_flow_api.id(121069924631972648)
,p_file_name=>'js/apexDialogSuccessMessage.js'
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
