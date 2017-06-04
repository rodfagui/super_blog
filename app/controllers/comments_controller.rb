class CommentsController < ApplicationController
	def create
	  @micropost = Micropost.find_by(id: params[:micropost_id])
	  @micropost.comments.create(comments_params)

	  redirect_to @micropost
	end

	private
	  def comments_params
	    params.require(:comment).permit(:body).merge(user: current_user)
	  end
end
