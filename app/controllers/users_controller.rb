class UsersController < ApplicationController
  def show
    @env = Rails.env
    @first_user = SugarCRM::User.first
    @last_user = SugarCRM::User.last
  end

end
