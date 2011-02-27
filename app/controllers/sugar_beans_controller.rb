class SugarBeansController < ApplicationController
  # This controller provides a generic interface to SugarCRM.  It expects
  # a module name to be passed as an argument
  def list
    @module = params[:module]
    begin
      @beans = class_for(params[:module]).all(:limit => 10)
    rescue NameError
      @modules = available_modules.sort
      render :action => "available_modules"
    end
  end
  
  def show
    @module = params[:module]
    @bean   = class_for(params[:module]).find(params[:id])
  end
  
  private 
  
  def available_modules
    ["SugarCRM", SugarCRM.namespace].join("::").constantize.constants
  end

  def class_for(mod)
    ["SugarCRM", SugarCRM.namespace, mod.classify].join("::").constantize
  end

end
