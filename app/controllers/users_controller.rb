class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @users.books.page(params[:page]).reverse_order
  end
end