class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.order(:created_at)
  end

  def create
    if current_user
      params[:message][:body] = Message.convert( params[:message][:body], session[:dialect] )

      @message = Message.new(message_params)
      if @message.save
        flash[:success] = 'Your message was successfully posted!'
      else
        flash[:danger] = 'Your message cannot be saved.'
        redirect_to root_url
        return
      end
    end
    #redirect_to root_url
  end

  private

  def message_params
    params.require(:message).permit(:body, :username)
  end
end
