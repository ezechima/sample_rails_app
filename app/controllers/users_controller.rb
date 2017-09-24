class UsersController < ApplicationController
  def new
      #debugger
      @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App"
      redirect_to user_url @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Your profile has been successfully updated"
      redirect_to user_url @user
    else
      render 'edit'
    end

  end

  private

    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
#example@railstutorial.org
#foobar
