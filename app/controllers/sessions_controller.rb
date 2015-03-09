class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if auth_hash
      user = User.omniauth(env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to root_url
    else
      @user = User.find_by_email params[:user][:email]
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Logged in!"
      else
        @user = User.new
        flash[:alert] = "Wrong email or password"
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
