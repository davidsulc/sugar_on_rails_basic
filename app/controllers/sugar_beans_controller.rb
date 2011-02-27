class SugarBeansController < ApplicationController
  # This controller provides a generic interface to SugarCRM.  It expects
  # a module name to be passed as an argument
  def list
    @sugar_module = params[:module]
    begin
      @beans = class_for(params[:module]).all(:limit => 10)
    rescue NameError
      @sugar_modules = available_modules.sort
      render :action => "available_modules"
    end
  end
  
  def show
    @sugar_module = params[:module]
    @bean         = class_for(params[:module]).find(params[:id])
  end
  
  def show_associations
    @sugar_module = params[:module]
    @bean         = class_for(params[:module]).find(params[:id])
    @association  = params[:association]
    @beans        = @bean.send(@association.to_sym)
  end
  
  private 
  
  def available_modules
    ["SugarCRM", SugarCRM.namespace].join("::").constantize.constants
  end

  def class_for(mod)
    ["SugarCRM", SugarCRM.namespace, mod.classify].join("::").constantize
  end

end
