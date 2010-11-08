class UsersController < ApplicationController
  before_filter :authenticate_user!  
  before_filter :clean_up_session
  def index
    @user = current_user
    @memberships = @user.memberships
  end
end
