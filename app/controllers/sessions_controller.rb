class SessionsController < ApplicationController
  
  def create
    @username = params[:username]
    @dialect = params[:dialect]
    session[:username] = @username unless @username.blank?
    session[:dialect] = @dialect unless @dialect.blank?
    if @username.blank? || @dialect.blank?
      redirect_to root_path, alert: 'Please input your name and dialect'
    else
      au = ActiveUser.create(username: session[:username])
      au.user_session_id = au.id
      session[:user_session_id] = au.id
      au.save
      flash[:session_created] = true
      flash[:success] = "Hello, #{@username}!"
      redirect_to messages_path
    end
  end

  def destroy
    @id = session[:user_session_id]
    ActiveUser.where(user_session_id: session[:user_session_id], username: session[:username]).delete_all
    session[:username] = nil
    session[:dialect] = nil
    session[:user_session_id] = nil
    flash[:success] = "See you!"
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { render json: {id: @id} }
    end
    
  end

end
