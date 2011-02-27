SugarOnRailsBasic::Application.routes.draw do
  match ':module' => 'sugar_beans#list', :as => "module"
  match ':module/:id' => 'sugar_beans#show', :as => "sugar_bean"
  match ':module/:id/:association' => 'sugar_beans#show_associations', :as => "sugar_bean_associations"
  root :to => "sugar_beans#list", :module => "accounts"
end
