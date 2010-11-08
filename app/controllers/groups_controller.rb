require 'uuid'
class GroupsController < ApplicationController
  before_filter :authenticate_user!  
  before_filter :clean_up_session
  
  def index
    @groups = Group.search(params[:search])
  end

  def show
    @group = Group.find(params[:id])
    check_security(@group)
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
    check_security(@group)
  end

  def create
    @group = Group.new(params[:group])
    if @group.save_with_membership(current_user)
      flash[:notice] = "Grupo criado com sucesso"
      redirect_to user_root_path
    else
      redirect_to :action => 'new'
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      redirect_to(@group, :notice => "Grupo atualizado com sucesso")
    else
      redirect_to :action => 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:notice] = "Grupo removido"
    redirect_to user_root_path
  end

  def secret_friend
    @group = Group.find(params[:id])
    @friend = Membership.where(:group_id => params[:id], :user_id => current_user).first.friend
  end

  def new_invitation
    @group = Group.find(params[:id])
  end

  def send_invitation
    @group = Group.find(params[:group])
    ## Get the token for this invitation
    uuid = UUID.new
    token = uuid.generate
    pc = Privatecode.new
    pc.group_id = @group.id
    pc.code = token 
    GroupMailer.invite(params[:email], @group, token).deliver
    pc.save!
    flash[:notice] = "Convite enviado com sucesso"
    redirect_to group_path(@group)
  end

  def privategroup
    pcs = Privatecode.where("code like ?", params[:code]).all
    if(pcs.empty?)
      flash[:error] = "Codigo invalido"
      redirect_to groups_path
    else
      pc = pcs[0]
      g = Group.find(pc.group_id)
      Membership.new(:user_id => current_user.id, :group_id => pc.group_id).save!
      pc.destroy
      flash[:notice] = "Voce ja esta participando do grupo '#{g.name}'"
      redirect_to user_root_path
    end
  end
end
