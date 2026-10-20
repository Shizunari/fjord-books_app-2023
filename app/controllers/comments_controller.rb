# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    commentable = find_commentable
    @comment = commentable.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      redirect_to commentable, alert: @comment.errors.full_messages.join(', ')
    end
  end

  def destroy
    commentable = find_commentable
    @comment = commentable.comments.where(user: current_user).find(params[:id])
    @comment.destroy
    redirect_to commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def find_commentable
    if params[:report_id]
      Report.find(params[:report_id])
    elsif params[:book_id]
      Book.find(params[:book_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
