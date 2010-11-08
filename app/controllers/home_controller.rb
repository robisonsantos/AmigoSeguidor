class HomeController < ApplicationController
  before_filter :authenticate_user!  
  before_filter :clean_up_session
  
  def index
    redirect_to user_root_path
  end
end
