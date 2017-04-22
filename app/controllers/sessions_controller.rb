class SessionsController < ApplicationController
  
  def create
    @username = params[:username]
    @dialect = params[:dialect]
    session[:username] = @username unless @username.blank?
    session[:dialect] = @dialect unless @dialect.blank?
    if @username.blank? || @dialect.blank?
      redirect_to root_path, alert: 'Please input your name and dialect'
    else
      flash[:success] = "Hello, #{@username}!"
      redirect_to messages_path
    end
  end

  def destroy
    session[:username] = nil
    session[:dialect] = nil
    flash[:success] = "See you!"
    redirect_to root_path
  end

end
