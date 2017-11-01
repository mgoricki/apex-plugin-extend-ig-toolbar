# Extend Interactive Grid Toolbar Plugin
Oracle APEX Plugin for customizing Interactive Grid toolbar

# Changelog

- v1.0.0 - 20171101 - Initial Release

# Install
- Import plugin file item_type_plugin_hr_bilog_mgoricki_advanced_slider.sql from source directory
- (Optional) To optimize performance upload static files (CSS and JS) from server directory to Webserver and change File Prefix to point on server directory
- (Optional) Compile package pck_advanced_plugin (from source) in DB schema (available to APEX parsing schema) and change parameter Render Procedure/Function Name to pck_advanced_plugin.p_render_item

# Settings

## Toolbar Group
Choose one of 7 default IG toolbar groups. With this plugin you can add button to the start or end of the group.
Available Groups:
    1. Search Box Group	    
    2. Saved Reports Group	
    3. View Switch Group	
    4. Actions Menu Group	
    5. Edit & Save Group	
    6. Add Row Group	    
    7. Reset Group

## Group Position
Defines group position - put new button to the start or end of the toolbar group selected in first property

## Icon Only 
Icon only button (Yes/No)

## Label
Icon label. You can also use text messages defined in shared components.

## Hot
Hot icon (Yes/No)

## Icon
Defines APEX icon class for a button, for example fa fa-user

## Icon Position
Display position of an icon - before or after label.

## Title
HTML button title attribute. Shown on mouse hover.

## Trigger Action:  

#### Trigger Default IG Action
You can trigger one of the default IG actions or a custom event.

To list all available IG actions use this in browser JS console:

```javascript
apex.region('emp').widget().interactiveGrid('getActions').list();
```
**Replace *emp* with Static ID of your IG region.*

Some examples:
```javascript
show-download-dialog
show-sort-dialog
show-filter-dialog
```

#### Trigger Custom Action
If action doesn't exists in default IG action list it will trigger a custom event Dynamic Action on Interactive Grid region defined in Affected Elements property. Name of custom event is defined with this property.

To handle it with Dynamic Action:
  1. Create Dynamic Action that triggers on event Custom
  2. In Custom Event property put the value of this attribute
  3. For Selection Type choose Region
  4. In Region property choose IG Region

Example:

```javascript
Event: Custom
Custom Event: my-custom-action
Selection Type: Region
Region: Emp
```

## Disabled
Disable button on load.

This property can be used to disable default IG actions. To do this just set name of default IG action in Action property.

## Hidden
Hide button on load.

This property can be used to hide default IG actions. To do this just set name of default IG action in Action property.


# Demo

Demo is available [here](https://apex.oracle.com/pls/apex/f?p=apexbyg:extendigtoolbar). 
