class BookCommentsController < ApplicationController
    before_action :authenticate_user!
  def create
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comment.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = BookComment.find(params[:id])
    @comment.destroy
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:user_id, :comment)
  end

end