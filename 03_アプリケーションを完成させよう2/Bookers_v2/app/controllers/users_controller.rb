class UsersController < ApplicationController

  # ユーザーがログインしているか確認
  before_action :authenticate_user!

  def index
  	@user  = current_user
  	@book  = Book.new
  	@users = User.all
  end

  def edit
  end

  def update
    @user = current_user
    begin
      @user.update!(user_params)
      redirect_to user_path(@user), flash: { notice: "User was successfully updated" }
    rescue
      redirect_to edit_user_path(@user), flash: { error: @user.errors.full_messages }
    end
  end

  def show
  	@user  = User.find(params[:id])
  	@book  = Book.new
  	@books = Book.where(user_id: params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :introduction, :image)
  end

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end
