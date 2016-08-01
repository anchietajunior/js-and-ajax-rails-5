class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.all
    respond_to do |format|
      format.html
      format.json {
        render json: @messages
      }
      format.js
    end
  end

  def create
    @message = Message.new message_params
    if @message.save
      redirect_to root_path
    else
      @messages = Message.all
      respond_to do |format|
        format.html { render 'index' }
        format.js
      end
    end
  end

  def destroy
    @message = Message.find params[:id]
    @message.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
