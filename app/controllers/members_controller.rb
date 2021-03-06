class MembersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:show, :edit, :update, :destroy]


  def invite_members

  end

  def create_invite_members
    family_id = params[:family_id]
    first_name = params[:first_name]
    email = params[:email]
    InviteMailer.invite_members(family_id, first_name, email).deliver

    redirect_to family_url(id: current_member.family_id)
  end

  def index
    @members = Member.all
  end

  def show
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new
    @member.first_name = params[:member][:first_name]
    @member.email = params[:member][:email]
    @member.password = params[:member][:password]
    @member.password_confirmation = params[:member][:password_confirmation]
    @member.family_id = params[:member][:family_id] if params[:member][:family_id].present?

    if @member.save
      session[:member_id] = @member.id  # sign in!
    else
      render 'new'
    end

    if params[:member][:family_id].present?
      redirect_to family_url(id: @member.family_id)
    else
      redirect_to new_family_url
    end
  end

  def edit
  end

  def update
    @member.first_name = params[:member][:first_name]
    @member.email = params[:member][:email]
    @member.password = params[:member][:password]
    @member.bio = params[:member][:bio]

    if @member.save
      redirect_to member_url
    else
      render 'edit'
    end
  end

  def destroy
    @member.destroy
    redirect_to members_url
  end


  private

  def set_user
    @member = Member.find(params[:id])
  end

  def require_login
    if params[:id] != session[:member_id]
      # redirect_to root_url, notice: "Nice try!"
    end
  end
end

