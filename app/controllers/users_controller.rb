class UsersController < ApplicationController
  def new
    @user = User.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      session[:user_id] = @user.id

      respond_to do |format|
        format.html { redirect_to(user_path(@user.id), notice: 'You have successfully signed up.') }
        format.js { redirect_to(user_path(@user.id), notice: 'You have successfully signed up.', format: 'js') }
      end
    else
      respond_to do |format|
        format.html { render('new') }
        format.js { render('new') }
      end
    end
  end

  def show
    if current_user.nil? || current_user.id != params[:id].to_i
      respond_to do |format|
        format.html { redirect_to(root_path, alert: "You are not allowed to view this content.") }
        format.js { redirect_to(root_path, alert: "You are not allowed to view this content.", format: 'js') }
      end
    else
      @user = User.find(params[:id])
      respond_to do |format|
        format.html 
        format.js 
      end
    end
  end
end
