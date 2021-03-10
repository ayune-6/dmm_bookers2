class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = 'The book was successfully posted!'
      redirect_to book_path(@book.id)
    else
      @books = Book.page(params[:page]).reverse_order
      flash[:error] = @book.errors.full_messages
      redirect_to books_path
    end
  end

  def index
    @newbook = Book.new
    @login_user = User.find_by(id:current_user.id)
    @books = Book.page(params[:page]).reverse_order
  end

  def show
    @newbook = Book.new
    @login_user = User.find_by(id:current_user.id)
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = 'The book was successfully updated!'
      redirect_to book_path(@book)
    else
      flash[:error] = @book.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
