SugarOnRailsBasic::Application.routes.draw do
  match ':module' => 'sugar_beans#list', :as => "module"
  match ':module/:id' => 'sugar_beans#show', :as => "sugar_bean"
  root :to => "sugar_beans#list", :module => "accounts"
end
