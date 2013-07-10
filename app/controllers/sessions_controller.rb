class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    user = User.find_by_name(params[:name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      respond_to do |format|
        format.html { redirect_to(user_path(user.id), notice: 'You have successfuly logged in.') }
        format.js { redirect_to(user_path(user.id), notice: 'You have successfuly logged in.', format: 'js') }
      end
    else
      flash.now.alert = 'Invalid name or password.'
      respond_to do |format|
        format.html { render 'new' }
        format.js { render 'new' }
      end
    end
  end

  def destroy
    session[:user_id] = nil

    respond_to do |format|
      format.html { redirect_to(root_url, notice: 'You have successfuly logged out.') }
      format.js { redirect_to(root_url, notice: 'You have successfuly logged out.', format: 'js') }
    end
  end
end
