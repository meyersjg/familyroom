class SessionsController < ApplicationController

  def new
    # redirect_to family_url(id: current_member.family_id)
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  def create
    member = Member.find_by(email: params[:email])
    if member.present?
      if member.authenticate(params[:password])

        session[:member_id] = member.id
        redirect_to family_url(id: current_member.family_id), notice: "Hello, #{member.first_name}"
      else
        flash.now[:notice] = "Please try again."
        render 'new'
      end
    else
      flash.now[:notice] = "Please try again."
      render 'new'
    end
  end
end
