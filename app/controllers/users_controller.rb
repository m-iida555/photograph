class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "登録が完了しました！"
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @users = User.find(params[:id])
  end

  def signin
    
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
