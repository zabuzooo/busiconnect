class UnsubscribeCommentsController < ApplicationController
	before_action :sing_in_check, only: [:new]

  def new
    @unsubscribe_comment = UnsubscribeComment.new
  end
  def create
    @unsubscribe_comment = UnsubscribeComment.new(unsubscribe_comment_params)
    @unsubscribe_comment.user_id = current_user.id
    if @unsubscribe_comment.save
      redirect_to unsubscribe_comments_complete_path
    end
  end
  def complete
    if current_user
    current_user.update( delete_flag: "true")
    end
  end
  private
    def unsubscribe_comment_params
      params.require(:unsubscribe_comment).permit(:comment, :user_id)
    end

    def sing_in_check
      unless user_signed_in? || admin_signed_in?
        redirect_to introduction_path
      end
    end
end
