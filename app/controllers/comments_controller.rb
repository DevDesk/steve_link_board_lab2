class CommentsController < ApplicationController
  def create
    render json: params
  end
  def new
  end
  def create_vote
      return unless is_authenticated?
      User.find_by_id(@current_user['id']).votes << Comment.find_by_id(params[:id]).votes.create
      redirect_to(:back)

      #ajax
      # respond_to do |format|
      #   format.json { render json: {result: !existing_vote,votes:comment.votes.length} }
      #   format.html {redirect_to post_comments_path(parent_post(comment))}

      # render json: params[:id]
      # redirect_to "/"

#if existing vote
#flash error
#else
#run vote line
#end
#redirect to post path
  end

end