class WishlistsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :clean_up_session, :only => [:index, :show, :destroy]

  include FaceboxRender

  def index
    @wishlists = Wishlist.all
  end

  def show
    @wishlist = Wishlist.find(params[:id])
    check_security(@wishlist)
  end

  def new
    # save the action
    session[:last_action] ||= 'new'
    
    @itens = session[:itens]
    @wishlist = Wishlist.new
  end

  def edit
    # save the action
    session[:last_action] ||= 'edit'
    session[:last_id] ||= params[:id]

    @wishlist = Wishlist.find(params[:id])
    check_security(@wishlist)

    session[:itens] ||= @wishlist.wishitems
    @itens = session[:itens]
  end

  def create
    @wishlist = Wishlist.new(params[:wishlist])
    session[:itens].each do |wishitem| 
      @wishlist.wishitems << wishitem unless wishitem == nil
    end
    if @wishlist.save
      flash[:notice] = "Lista criada com sucesso"
      redirect_to user_root_path
    else
      render :action => 'new'
    end
  end

  def update
    @wishlist = Wishlist.find(params[:id])
    @wishlist.wishitems = session[:itens].delete_if {|i| i == nil}
    if @wishlist.update_attributes(params[:group])
      redirect_to(@wishlist, :notice => "Lista atualizada com sucesso")
    else
      redirect_to :action => 'edit'
    end
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy
    flash[:notice] = "Lista removida"
    redirect_to user_root_path
  end

################################################################################
##                         Itens management                                   ##
################################################################################
  def new_item
    @wishitem = Wishitem.new
    respond_to do |format|
      format.html
      format.js { render_to_facebox }
    end
  end

  def create_item

    if(params[:wishitem])
      session[:itens] ||= []
      params[:wishitem].delete(:index)
      session[:itens] << Wishitem.new(params[:wishitem])
    end

    if session[:last_action] == 'new'
      redirect_to :action => session[:last_action]
    else
      redirect_to edit_wishlist_path(session[:last_id])
    end
  end

  def edit_item
    @wishitem = session[:itens][params[:index].to_i]
    respond_to do |format|
      format.html
      format.js { render_to_facebox }
    end
  end

  def update_item

    if(params[:wishitem])
      session[:itens] ||= []
      session[:itens][params[:wishitem].delete(:index).to_i] = Wishitem.new(params[:wishitem])
    end

    if session[:last_action] == 'new'
      redirect_to :action => session[:last_action]
    else
      redirect_to edit_wishlist_path(session[:last_id])
    end
  end

  def destroy_item
    session[:itens][params[:index].to_i] = nil
  end  
end
