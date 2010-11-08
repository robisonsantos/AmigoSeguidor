class MessagesController < ApplicationController
  before_filter :authenticate_user!  
  before_filter :clean_up_session
  
  include FaceboxRender

  def index
    @memberships = Membership.where("user_id = ?", current_user.id).all

    if(params[:sent])
      @messages = current_user.sent_msgs.where("group_id = ?", params[:group].to_i).all #maybe add some order here
    elsif(params[:received])
      @messages = current_user.received_msgs.where("group_id = ?", params[:group].to_i).all #maybe add some order here
    end
  end

  def show
    @message = Message.find(params[:id])
    check_security(@group)
    respond_to do |format|
      format.html
      format.js { render_to_facebox }
    end
  end

  def new
    @message = Message.new
    @users = User.all

    respond_to do |format|
      format.html
      format.js { render_to_facebox }
    end
  end

  def create
    params[:message][:receiver] = User.find(params[:message][:receiver])
    @message = Message.new(params[:message])
    @message.sender = current_user
    if @message.save 
      redirect_to(@message, :notice => 'Message was successfully created.')
    else
      render :action => "new"
    end
  end

  def destroy
     @message = Message.find(params[:id])
     @message.destroy
  end

end
