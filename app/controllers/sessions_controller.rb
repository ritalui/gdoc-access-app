class SessionsController < ApplicationController
  def new
  end

  # log in
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_tasks_url
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  # log out
  def destroy
    # Delete Authentication entry for current user
    @provider_auth = ProviderAuth.where("user_id = ?", current_user.id)
    @provider_auth.destroy_all

    session[:user_id] = nil
    redirect_to root_url
  end
end
