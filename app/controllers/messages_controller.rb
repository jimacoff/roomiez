class MessagesController < ApplicationController

  def index
    @user = current_user
    @messages = Message.order("created_at desc")
    respond_to do |format|
      format.html
      format.json { render json: @messages }
    end
  end

  def show 
    @message = Message.find(params[:id])
    @user = current_user
    if (@user.email == @message.sender) || (@user.email == @message.recepient)
    else
      respond_to do |format|
        format.html { redirect_to :action => :index, notice: 'No message found' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params.merge({sender: current_user.email}))
    @message.sender = current_user.email
    @message.save
    # binding.pry
    respond_to do |format|
      if @message.save!
        format.html { redirect_to :action => :index, notice: 'Message has been sent.' }
        format.json { render json: @messages }
      else
        format.html { redirect_to :action => :new, notice: 'Error: Please try again.' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end

 def message_params
    params.require(:message).permit(:recepient, :subject, :body)
  end