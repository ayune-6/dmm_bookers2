class UsersController < ApplicationController
  def show
    @newbook = Book.new
    @login_user = User.find_by(id:current_user.id)
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end

  def index
    @newbook = Book.new
    @login_user = User.find_by(id:current_user.id)
    @users = User.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
