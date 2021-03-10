class UsersController < ApplicationController
  def show
    @newbook = Book.new
    @info_user = User.find(params[:id])
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end

  def index
    @newbook = Book.new
    @info_user = User.find_by(id:current_user.id)
    @users = User.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find_by(id:current_user.id)
  end

  def update
    @user = User.find_by(id:current_user.id)
    if @user.update(user_params)
      flash[:success] = 'The user info was successfully updated.'
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
