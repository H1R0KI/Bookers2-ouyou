class PostCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.user_id = current_user.id
    @post_comment.book_id = @book.id
    @post_comment.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    @post_comment = current_user.post_comments.find_by(book_id: @book.id)
    @post_comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
