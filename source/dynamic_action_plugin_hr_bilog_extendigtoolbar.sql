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
,p_release=>'5.1.3.00.05'
,p_default_workspace_id=>1911086416010549
,p_default_application_id=>105
,p_default_owner=>'GRID'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/hr_bilog_extendigtoolbar
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(13853247592332369)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'HR.BILOG.EXTENDIGTOOLBAR'
,p_display_name=>'Interactive Grid - Extend Toolbar'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>'grid.extendToolbar#MIN#.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function f_render_plugin (',
'    p_dynamic_action in apex_plugin.t_dynamic_action,',
'    p_plugin         in apex_plugin.t_plugin)',
'  return apex_plugin.t_dynamic_action_render_result',
'is',
'  v_return apex_plugin.t_dynamic_action_render_result;',
'begin',
'  -- return',
'  v_return.javascript_function := ''extendGridToolbar.init'';',
'  v_return.attribute_01        := p_dynamic_action.attribute_01;',
'  v_return.attribute_02        := p_dynamic_action.attribute_02;',
'  v_return.attribute_03        := p_dynamic_action.attribute_03;',
'  v_return.attribute_04        := p_dynamic_action.attribute_04; -- hot  ',
'  v_return.attribute_05        := p_dynamic_action.attribute_05; -- icon',
'  v_return.attribute_06        := p_dynamic_action.attribute_06; -- iconOnly  ',
'  v_return.attribute_07        := p_dynamic_action.attribute_07; -- icon position',
'  v_return.attribute_08        := p_dynamic_action.attribute_08; -- title',
'  v_return.attribute_09        := p_dynamic_action.attribute_09; -- trigger custom event  ',
'  v_return.attribute_10        := p_dynamic_action.attribute_10; -- disabled ',
'  v_return.attribute_11        := p_dynamic_action.attribute_11; -- hidden  ',
'  v_return.attribute_12        := p_dynamic_action.attribute_12; -- mode',
'  return v_return;',
'end;'))
,p_api_version=>2
,p_render_function=>'f_render_plugin'
,p_standard_attributes=>'REGION:REQUIRED:ONLOAD'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'Dynamic Action Plugin that enables you to declaratively define IG toolbar buttons.'
,p_version_identifier=>'1.0.0'
,p_about_url=>'https://apex.oracle.com/pls/apex/f?p=apexbyg'
,p_files_version=>3
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(13881777928994343)
,p_plugin_id=>wwv_flow_api.id(13853247592332369)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Toolbar Group'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'actions2'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Choose one of default IG toolbar groups. With this plugin you can add button to the start or end of the group.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(13883623665996528)
,p_plugin_attribute_id=>wwv_flow_api.id(13881777928994343)
,p_display_sequence=>10
,p_display_value=>'1. Search Box Group'
,p_return_value=>'search'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(13884048441997524)
,p_plugin_attribute_id=>wwv_flow_api.id(13881777928994343)
,p_display_sequence=>20
,p_display_value=>'2. Saved Reports Group'
,p_return_value=>'reports'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(13884458269998639)
,p_plugin_attribute_id=>wwv_flow_api.id(13881777928994343)
,p_display_sequence=>30
,p_display_value=>'3. View Switch Group'
,p_return_value=>'views'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(13884878807999706)
,p_plugin_attribute_id=>wwv_flow_api.id(13881777928994343)
,p_display_sequence=>40
,p_display_value=>'4. Actions Menu Group'
,p_return_value=>'actions1'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(13885231666000750)
,p_plugin_attribute_id=>wwv_flow_api.id(13881777928994343)
,p_display_sequence=>50
,p_display_value=>'5. Edit & Save Group'
,p_return_value=>'actions2'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(13885663275001850)
,p_plugin_attribute_id=>wwv_flow_api.id(13881777928994343)
,p_display_sequence=>60
,p_display_value=>'6. Add Row Group'
,p_return_value=>'actions3'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(13886097443002868)
,p_plugin_attribute_id=>wwv_flow_api.id(13881777928994343)
,p_display_sequence=>70
,p_display_value=>'7. Reset Group'
,p_return_value=>'actions4'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(13889530833045999)
,p_plugin_id=>wwv_flow_api.id(13853247592332369)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Group Position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'L'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Choose group position. Start or end of the toolbar group.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(13892602333046728)
,p_plugin_attribute_id=>wwv_flow_api.id(13889530833045999)
,p_display_sequence=>10
,p_display_value=>'Start'
,p_return_value=>'F'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(13893024669047199)
,p_plugin_attribute_id=>wwv_flow_api.id(13889530833045999)
,p_display_sequence=>20
,p_display_value=>'End'
,p_return_value=>'L'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(13896032420051034)
,p_plugin_id=>wwv_flow_api.id(13853247592332369)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Label'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(13933781012296627)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
,p_help_text=>'Label of a button. You can also use text messages defined in shared components.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(13922209996103953)
,p_plugin_id=>wwv_flow_api.id(13853247592332369)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Hot'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'Hot or not? :)'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(13927320065136497)
,p_plugin_id=>wwv_flow_api.id(13853247592332369)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Icon'
,p_attribute_type=>'ICON'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>'fa fa-user'
,p_help_text=>'Define APEX icon class for a button.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(13933781012296627)
,p_plugin_id=>wwv_flow_api.id(13853247592332369)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>25
,p_prompt=>'Icon Only'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'Display only button with icon.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(13944764690323316)
,p_plugin_id=>wwv_flow_api.id(13853247592332369)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Icon Position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'B'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(13927320065136497)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
,p_lov_type=>'STATIC'
,p_help_text=>'Display position of an icon - before or after label.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(13948224101324020)
,p_plugin_attribute_id=>wwv_flow_api.id(13944764690323316)
,p_display_sequence=>10
,p_display_value=>'Before Label'
,p_return_value=>'B'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(13948689508324618)
,p_plugin_attribute_id=>wwv_flow_api.id(13944764690323316)
,p_display_sequence=>20
,p_display_value=>'After Label'
,p_return_value=>'A'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(13953059718345246)
,p_plugin_id=>wwv_flow_api.id(13853247592332369)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Title'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_common=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_help_text=>'HTML button title attribute. Shown on mouse hover.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(13971080195465348)
,p_plugin_id=>wwv_flow_api.id(13853247592332369)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Trigger Action'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h3>Trigger Default IG Action</h3>',
'<p>',
'You can trigger one of the default IG actions or a custom event.<br />',
'To list all available IG actions use this in browser JS console:',
'<pre>apex.region(''emp'').widget().interactiveGrid(''getActions'').list();</pre>',
'<pre>',
'Some examples:',
'show-download-dialog',
'show-sort-dialog',
'show-filter-dialog',
'</pre>',
'Replace <i>emp</i> with Static ID of your IG region.',
'</p>',
'<p>',
'<h3>Trigger Custom Action</h3>',
'If action doesn''t exists in default IG action list it will trigger a custom event Dynamic Action on Interactive Grid region defined in Affected Elements property. Name of custom event is defined with this property.<br />',
'To handle it with Dynamic Action:<br />',
'<ol>',
'  <li>Create Dynamic Action that triggers on event Custom</li>',
'  <li>In Custom Event property put the value of this attribute</li>',
'  <li>For Selection Type choose Region</li>',
'  <li>In Region property choose IG Region</li>',
'</ol>',
'<h4>Example</h4>',
'<pre>',
'Event: Custom',
'Custom Event: my-custom-action',
'Selection Type: Region',
'Region: Emp',
'</pre>',
'</p>'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(14076312262894686)
,p_plugin_id=>wwv_flow_api.id(13853247592332369)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Disabled'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Disable button on load. <br />',
'This property can be used to disable default IG actions. To do this just set name of default IG action in Action property.'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(14087133396980478)
,p_plugin_id=>wwv_flow_api.id(13853247592332369)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Hidden'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Hide button on load. <br />',
'This property can be used to hide default IG actions. To do this just set name of default IG action in Action property.'))
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A210A202A20617065782D706C7567696E2D657874656E646967746F6F6C626172202D204F7261636C65204150455820706C7567696E0A202A2040617574686F72204D61726B6F20476F7269636B690A202A204076657273696F6E2076312E302E300A';
wwv_flow_api.g_varchar2_table(2) := '202A20406C696E6B2068747470733A2F2F6769746875622E636F6D2F6D676F7269636B692F617065782D706C7567696E2D657874656E642D69672D746F6F6C6261720A202A20406C6963656E7365204D49540A202A2F0A2F2A0A202A2043686167654C6F';
wwv_flow_api.g_varchar2_table(3) := '673A0A202A2076312E302E30202D203230313731313031202D20496E697469616C2052656C656173650A202A2F0A76617220657874656E6447726964546F6F6C626172203D207B0A0A20202F2F20496E69742046756E6374696F6E0A2020696E69743A20';
wwv_flow_api.g_varchar2_table(4) := '66756E6374696F6E28297B0A20202020766172206461203D20746869733B0A20202020617065782E64656275672E6C6F672827657874656E6447726964546F6F6C6261722E696E6974272C6461293B0A0A202020202F2F2067657420706C7567696E2061';
wwv_flow_api.g_varchar2_table(5) := '7474726962757465730A20202020766172207647726F757020202020202020203D2064612E616374696F6E2E61747472696275746530313B0A202020207661722076506F736974696F6E20202020203D2064612E616374696F6E2E617474726962757465';
wwv_flow_api.g_varchar2_table(6) := '30323B202F2F2046202D2066697273742C204C202D206C6173740A2020202076617220764C6162656C20202020202020203D2064612E616374696F6E2E61747472696275746530333B0A202020207661722076486F74202020202020202020203D206461';
wwv_flow_api.g_varchar2_table(7) := '2E616374696F6E2E6174747269627574653034203D3D20275927203F2074727565203A2066616C73653B0A20202020766172207649636F6E2020202020202020203D2064612E616374696F6E2E61747472696275746530353B0A20202020766172207649';
wwv_flow_api.g_varchar2_table(8) := '636F6E4F6E6C7920202020203D2064612E616374696F6E2E6174747269627574653036203D3D20275927203F2074727565203A2066616C73653B0A20202020766172207649636F6E506F736974696F6E203D2064612E616374696F6E2E61747472696275';
wwv_flow_api.g_varchar2_table(9) := '74653037203D3D20274227203F2074727565203A2066616C73653B0A2020202076617220765469746C6520202020202020203D2064612E616374696F6E2E61747472696275746530383B0A202020207661722076416374696F6E202020202020203D2064';
wwv_flow_api.g_varchar2_table(10) := '612E616374696F6E2E61747472696275746530393B202F2F20616374696F6E0A20202020766172207644697361626C656420202020203D2064612E616374696F6E2E6174747269627574653130203D3D20275927203F2074727565203A2066616C73653B';
wwv_flow_api.g_varchar2_table(11) := '202F2F2064697361626C650A20202020766172207648696464656E202020202020203D2064612E616374696F6E2E6174747269627574653131203D3D20275927203F2074727565203A2066616C73653B202F2F2068696464656E0A0A202020202F2F2067';
wwv_flow_api.g_varchar2_table(12) := '657420526567696F6E0A202020207661722076526567696F6E4964203D2064612E6166666563746564456C656D656E74735B305D2E69643B0A202020207661722076526567696F6E24203D20617065782E6A51756572792864612E616666656374656445';
wwv_flow_api.g_varchar2_table(13) := '6C656D656E74735B305D293B0A0A202020202F2F20636865636B2069636F6E0A202020202F2F20746F446F3A20636865636B206966207468657265277320616C726561647920666120636C6173730A20202020696620287649636F6E297B0A2020202020';
wwv_flow_api.g_varchar2_table(14) := '207649636F6E203D2027666120272B7649636F6E3B0A202020207D0A0A202020207661722076416374696F6E4E616D65203D20276D792D637573746F6D2D616374696F6E273B0A0A202020202F2F20476574205769646765740A20202020766172207657';
wwv_flow_api.g_varchar2_table(15) := '696467657424203D20617065782E726567696F6E2876526567696F6E4964292E77696467657428293B0A0A202020202F2F204772696420637265617465640A2020202076617220746F6F6C626172203D2076576964676574242E696E7465726163746976';
wwv_flow_api.g_varchar2_table(16) := '65477269642822676574546F6F6C62617222293B0A0A202020202F2F2066696E6420746F6F6C6261722067726F75700A2020202076617220746F6F6C62617247726F7570203D20746F6F6C6261722E746F6F6C626172282766696E6447726F7570272C20';
wwv_flow_api.g_varchar2_table(17) := '7647726F7570293B0A0A20202020766172207661427574746F6E203D207B0A202020202020747970653A2027425554544F4E272C0A2020202020206C6162656C3A20764C6162656C2C0A2020202020207469746C653A20765469746C652C0A2020202020';
wwv_flow_api.g_varchar2_table(18) := '206C6162656C4B65793A20764C6162656C2C202F2F206C6162656C2066726F6D2074657874206D657373616765730A202020202020616374696F6E3A2076416374696F6E2C0A20202020202069636F6E3A207649636F6E2C0A20202020202069636F6E4F';
wwv_flow_api.g_varchar2_table(19) := '6E6C793A207649636F6E4F6E6C792C0A20202020202069636F6E4265666F72654C6162656C3A207649636F6E506F736974696F6E2C0A202020202020686F743A2076486F740A202020207D3B0A0A202020202F2F2061646420627574746F6E0A20202020';
wwv_flow_api.g_varchar2_table(20) := '6966202876506F736974696F6E203D3D20274627297B0A202020202020746F6F6C62617247726F75702E636F6E74726F6C732E756E7368696674287661427574746F6E290A202020207D656C73657B0A202020202020746F6F6C62617247726F75702E63';
wwv_flow_api.g_varchar2_table(21) := '6F6E74726F6C732E70757368287661427574746F6E293B0A202020207D3B0A0A202020202F2F2061646420616374696F6E730A202020207661722076416374696F6E73203D2076576964676574242E696E74657261637469766547726964282767657441';
wwv_flow_api.g_varchar2_table(22) := '6374696F6E7327293B0A0A202020202F2F20636865636B20696620616374696F6E206578697374732C207468656E206A7573742061737369676E2069740A202020207661722076416374696F6E24203D2076416374696F6E732E6C6F6F6B757028764163';
wwv_flow_api.g_varchar2_table(23) := '74696F6E293B0A202020206966282176416374696F6E24297B0A20202020202076416374696F6E732E616464280A20202020202020207B0A202020202020202020206E616D652020203A2076416374696F6E0A20202020202020202C20616374696F6E20';
wwv_flow_api.g_varchar2_table(24) := '3A2066756E6374696F6E286576656E742C20656C656D656E7429207B0A202020202020202020202020617065782E6576656E742E747269676765722876526567696F6E242C2076416374696F6E293B0A2020202020202020207D0A20202020202020202C';
wwv_flow_api.g_varchar2_table(25) := '20686964653A7648696464656E0A20202020202020202C2064697361626C65643A7644697361626C65640A202020202020207D293B0A20202020207D656C73657B0A2020202020202076416374696F6E242E68696465203D207648696464656E3B0A2020';
wwv_flow_api.g_varchar2_table(26) := '202020202076416374696F6E242E64697361626C6564203D207644697361626C65643B0A20202020207D0A0A0A202020202F2F207265667265736820677269640A20202020746F6F6C6261722E746F6F6C62617228277265667265736827293B0A20207D';
wwv_flow_api.g_varchar2_table(27) := '0A7D3B0A0A2F2F2320736F757263654D617070696E6755524C3D677269642E657874656E64546F6F6C6261722E6A732E6D61700A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(14210724436651172)
,p_plugin_id=>wwv_flow_api.id(13853247592332369)
,p_file_name=>'grid.extendToolbar.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A210A202A20617065782D706C7567696E2D657874656E646967746F6F6C626172202D204F7261636C65204150455820706C7567696E0A202A2040617574686F72204D61726B6F20476F7269636B690A202A204076657273696F6E2076312E302E300A';
wwv_flow_api.g_varchar2_table(2) := '202A20406C696E6B2068747470733A2F2F6769746875622E636F6D2F6D676F7269636B692F617065782D706C7567696E2D657874656E642D69672D746F6F6C6261720A202A20406C6963656E7365204D49540A202A2F0A76617220657874656E64477269';
wwv_flow_api.g_varchar2_table(3) := '64546F6F6C6261723D7B696E69743A66756E6374696F6E28297B76617220743D746869733B617065782E64656275672E6C6F672822657874656E6447726964546F6F6C6261722E696E6974222C74293B76617220653D742E616374696F6E2E6174747269';
wwv_flow_api.g_varchar2_table(4) := '6275746530312C693D742E616374696F6E2E61747472696275746530322C613D742E616374696F6E2E61747472696275746530332C6F3D2259223D3D742E616374696F6E2E61747472696275746530342C6E3D742E616374696F6E2E6174747269627574';
wwv_flow_api.g_varchar2_table(5) := '6530352C723D2259223D3D742E616374696F6E2E61747472696275746530362C633D2242223D3D742E616374696F6E2E61747472696275746530372C623D742E616374696F6E2E61747472696275746530382C643D742E616374696F6E2E617474726962';
wwv_flow_api.g_varchar2_table(6) := '75746530392C6C3D2259223D3D742E616374696F6E2E61747472696275746531302C753D2259223D3D742E616374696F6E2E61747472696275746531312C663D742E6166666563746564456C656D656E74735B305D2E69642C733D617065782E6A517565';
wwv_flow_api.g_varchar2_table(7) := '727928742E6166666563746564456C656D656E74735B305D293B6E2626286E3D22666120222B6E293B76617220673D617065782E726567696F6E2866292E77696467657428292C703D672E696E746572616374697665477269642822676574546F6F6C62';
wwv_flow_api.g_varchar2_table(8) := '617222292C763D702E746F6F6C626172282266696E6447726F7570222C65292C683D7B747970653A22425554544F4E222C6C6162656C3A612C7469746C653A622C6C6162656C4B65793A612C616374696F6E3A642C69636F6E3A6E2C69636F6E4F6E6C79';
wwv_flow_api.g_varchar2_table(9) := '3A722C69636F6E4265666F72654C6162656C3A632C686F743A6F7D3B2246223D3D693F762E636F6E74726F6C732E756E73686966742868293A762E636F6E74726F6C732E707573682868293B76617220783D672E696E7465726163746976654772696428';
wwv_flow_api.g_varchar2_table(10) := '22676574416374696F6E7322292C473D782E6C6F6F6B75702864293B473F28472E686964653D752C472E64697361626C65643D6C293A782E616464287B6E616D653A642C616374696F6E3A66756E6374696F6E28742C65297B617065782E6576656E742E';
wwv_flow_api.g_varchar2_table(11) := '7472696767657228732C64297D2C686964653A752C64697361626C65643A6C7D292C702E746F6F6C62617228227265667265736822297D7D3B0A2F2F2320736F757263654D617070696E6755524C3D677269642E657874656E64546F6F6C6261722E6D69';
wwv_flow_api.g_varchar2_table(12) := '6E2E6A732E6D61700A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(14211020523651178)
,p_plugin_id=>wwv_flow_api.id(13853247592332369)
,p_file_name=>'grid.extendToolbar.min.js'
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
