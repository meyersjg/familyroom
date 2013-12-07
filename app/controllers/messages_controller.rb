class MessagesController < ApplicationController


  def index
    @messages = Message.all
  end

  def new
    @member = Member.find_by(id: params[:member])
  end

  def create
    @message = Message.new
    @message.title = params[:title]
    @message.body = params[:body]
    @message.member_id = params[:member_id]
    @message.family_id = params[:family_id]
    @message.save

    redirect_to family_url(id: current_member.family_id), notice: "Message created successfully."
  end

  def edit
    @message = Message.find_by(id: params[:id])
    @member = Member.find_by(id: @message.member_id)
  end

  def update
    @message = Message.find_by(id: params[:id])
    @message.title = params[:title]
    @message.body = params[:body]
    @message.member_id = params[:member_id]
    @message.family_id = params[:family_id]
    @message.save

    redirect_to messages_url, notice: "Message updated successfully."
  end

  def destroy
    @message = Message.find_by(id: params[:id])
    @message.destroy

    redirect_to messages_url, notice: "Message deleted."
  end
end
