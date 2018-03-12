# Extend Interactive Grid Toolbar Plugin
Oracle APEX Plugin for customizing Interactive Grid toolbar.

With Interactive Grid - Extend Toolbar Plugin you can (declaratively):
- add buttons to one of 7 default grid button groups
- call custom Dynamic Action or one of default IG actions
- add icon only buttons to IG toolbar
- add hot butons to IG toolbar
- ...many more


# Changelog

- v1.0.0 - 20171101 - Initial Release
- v1.0.1 - 20171129 - Added .map files to fix Safari problem
- v1.0.2 - 20180312 - Fix for adding buttons to multiple IG regions on same page

# Install
- Import plugin file dynamic_action_plugin_hr_bilog_extendigtoolbar.sql from source directory
- (Optional) To optimize performance upload static files (JS) from server directory to Webserver and change prefix to point on server directory
- (Optional) Put PL/SQL code of rendering function to the DB package

# Settings

- **Toolbar Group** - Choose one of 7 default IG toolbar groups. With this plugin you can add button to the start or end of the group.

    Available Groups:
    1. Search Box Group	    
    2. Saved Reports Group	
    3. View Switch Group	
    4. Actions Menu Group	
    5. Edit & Save Group	
    6. Add Row Group	    
    7. Reset Group

- **Group Position** -  put new button to the start or end of the toolbar group selected in the first property

- **Icon Only** - Icon only button (Yes/No)

- **Label** - Icon label. You can also use text messages defined in shared components.

- **Hot** - Hot icon (Yes/No)

- **Icon** - Defines APEX icon class for a button, for example fa fa-user.

- **Icon Position** - Display position of an icon - before or after label.

- **Title** - HTML button title attribute - shown on mouse hover.

- **Trigger Action**:  

    ##### Trigger Default IG Action
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

    ##### Trigger Custom Action
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

- **Disabled** - Disable button on load.

    This property can be used to disable default IG actions. To do this just set name of default IG action in Action property.

- **Hidden** - Hide button on load.

    This property can be used to hide default IG actions. To do this just set name of default IG action in Action property.


# Demo

Demo is available [here](https://apex.oracle.com/pls/apex/f?p=apexbyg:extendigtoolbar). 


# Examples

- Dynamic Action (on load) definition:

    ![DA definition](https://github.com/mgoricki/apex-plugin-extend-ig-toolbar/blob/master/images/da_definition.png "DA definition")

- Call Custom DA:

    ![Call Custom DA](https://github.com/mgoricki/apex-plugin-extend-ig-toolbar/blob/master/images/button01.png "Call Custom DA")

- Call default IG action:

    ![Call default IG action](https://github.com/mgoricki/apex-plugin-extend-ig-toolbar/blob/master/images/button01.png "Call default IG action")
