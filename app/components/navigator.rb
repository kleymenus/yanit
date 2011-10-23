# This component drows a tree that represents a menu. Clicking on a tree node makes a specific component to open in the Workspace component, the id to which must be passed as the :workspace_id parameter (see the Application component).
class Navigator < Netzke::Base
  js_base_class "Ext.tree.Panel"

  # Mix in the javascript object on class level from navigator/javascripts/navigator.js
  js_mixin

  # Include custom stylesheets from navigator/stylesheets/navigator.css
  css_include :navigator

  def default_config
    super.tap do |c|
      c[:store] = {
        root: {
          expanded: true,
          children: [{
            text: 'Projects',
            leaf: true,
            icon_cls: 'icon-projects',
            component: 'ProjectGrid'
          },{
            text: 'Users',
            leaf: true,
            icon_cls: 'icon-users',
            component: 'UserGrid'
          },{
            text: 'Issues',
            icon_cls: 'icon-issues',
            expanded: true,
            children: [{
              text: "All",
              leaf: true,
              icon_cls: 'icon-all-issues',
              component: "IssueGrid"
            },{
              text: "Per project",
              leaf: true,
              icon_cls: 'icon-projects-issues',
              component: "ProjectIssueExplorer"
            },{
              text: "Per user",
              leaf: true,
              icon_cls: 'icon-users-issues',
              component: "UserIssueExplorer"
            }]
          }]
        }
      }

      c[:bbar] = [:close_all_tabs.action]
    end
  end

  # Handler for this action (onCloseAllTabs) is defined in navigator/javascripts/navigator.js
  action :close_all_tabs
end