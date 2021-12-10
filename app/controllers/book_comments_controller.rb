class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(comment_params)
    comment.book_id = book.id
    comment.save
    @comments = book.book_comments
    render :index
  end

  def destroy
    comment = BookComment.find_by(params[:book_id])
    comment.destroy
    book = Book.find(params[:book_id])
    @comments = book.book_comments
    render :index
  end

  def comment_params
    params.require(:book_comment).permit(:comment)
  end
end
