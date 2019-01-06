class UsersController < ApplicationController

  def index
  	@user  = current_user
  	@book  = Book.new
  	@users = User.all
  end

  def edit
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to user_path(user.id), flash: { notice: "User was successfully updated" }
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
