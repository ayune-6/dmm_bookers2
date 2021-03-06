class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    if comment.save
      flash[:success] = 'Your comment was successfully posted!'
      redirect_to request.referrer
    else
      flash[:comment_error] = "Comments can't be blank"
      redirect_to request.referrer
    end
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to request.referrer
  end

  private
    def book_comment_params
      params.require(:book_comment).permit(:comment)
    end

end
