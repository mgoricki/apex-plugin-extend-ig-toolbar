/*!
 * apex-plugin-extendigtoolbar - Oracle APEX plugin
 * @author Marko Goricki
 * @version v1.0.0
 * @link https://github.com/mgoricki/apex-plugin-extend-ig-toolbar
 * @license MIT
 */
/*
 * ChageLog:
 * v1.0.0 - 20171101 - Initial Release
 * v1.0.2 - 20180312 - fix for adding buttons to multiple IG regions on same page (fix for APEX 5.1.4) - more on https://community.oracle.com/message/14739371#14739371
 * v1.0.3 - 20200103 - fixed hidden Rows Per Page Selector, removed code for fix 1.0.2
 */
var extendGridToolbar = {

  // Init Function
  init: function(){
    var da = this;
    apex.debug.log('extendGridToolbar.init',da);

    // get plugin attributes
    var vGroup        = da.action.attribute01;
    var vPosition     = da.action.attribute02; // F - first, L - last
    var vLabel        = da.action.attribute03;
    var vHot          = da.action.attribute04 == 'Y' ? true : false;
    var vIcon         = da.action.attribute05;
    var vIconOnly     = da.action.attribute06 == 'Y' ? true : false;
    var vIconPosition = da.action.attribute07 == 'B' ? true : false;
    var vTitle        = da.action.attribute08;
    var vAction       = da.action.attribute09; // action
    var vDisabled     = da.action.attribute10 == 'Y' ? true : false; // disable
    var vHidden       = da.action.attribute11 == 'Y' ? true : false; // hidden

    // get Region
    var vRegionId = da.affectedElements[0].id;
    var vRegion$ = apex.jQuery(da.affectedElements[0]);

    // check icon
    // toDo: check if there's already fa class
    if (vIcon){
      vIcon = 'fa '+vIcon;
    }  

    var vActionName = 'my-custom-action';
    // Get Widget
    var vWidget$ = apex.region(vRegionId).widget();

    // Grid created
    var toolbar = vWidget$.interactiveGrid("getToolbar");

    // find toolbar group
     var toolbarGroup = toolbar.toolbar('findGroup', vGroup);

    var vaButton = {
      type: 'BUTTON',
      label: vLabel,
      title: vTitle,
      labelKey: vLabel, // label from text messages
      action: vAction,
      icon: vIcon,
      iconOnly: vIconOnly,
      iconBeforeLabel: vIconPosition,
      hot: vHot
    };

    if (vPosition == 'F'){
      toolbarGroup.controls.unshift(vaButton)
    }else{
      toolbarGroup.controls.push(vaButton);
    };

    // add actions
    var vActions = vWidget$.interactiveGrid('getActions');

    // check if action exists, then just assign it
    var vAction$ = vActions.lookup(vAction);
    if(!vAction$){
      vActions.add(
        {
          name   : vAction
        , action : function(event, element) {
            apex.event.trigger(vRegion$, vAction);
         }
        , hide:vHidden
        , disabled:vDisabled
       });
    }else{
      vAction$.hide = vHidden;
      vAction$.disabled = vDisabled;
    }

    // fix v1.0.3 because refresh hides page selector
    var vActionsMenu$ = toolbar.toolbar( "findElement", "actions_button_menu" );
    var vMenuItem = vActionsMenu$.menu( "find", "rows" );
    if (vMenuItem) {
      var vConfig = apex.region(vRegionId).call("option","config");
      vMenuItem.hide = (vConfig.pagination.type !== 'set');
    }  
    
    // refresh grid
    toolbar.toolbar('refresh'); 
  }
};
//# sourceMappingURL=grid.extendToolbar.js.map
