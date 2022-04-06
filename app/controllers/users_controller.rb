class UsersController < ApplicationController
before_action :sign_in_user, only: [:index, :show, :edit, :update, :destroy]
before_action :correct_user, only: [:edit, :update]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "登録が完了しました！"
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @users = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params_update)
      flash[:success] = "お客様情報を更新しました。"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @users = User.find(params[:id])
    @users.destroy
    flash[:success] = "アカウントを削除しました。"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_params_update
    params.require(:user).permit(:name, :email, :telephone, :address, :birth_date)
  end

  def correct_user
    @user = User.find(params[:id])
    if !current_user?(@user)
      flash[:danger] = "このページはアクセスできません。"
      redirect_to root_path
    end
  end
end
