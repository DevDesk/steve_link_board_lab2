class CommentsController < ApplicationController
  #before_action :locate_comment, only: [:new, :create_vote]

  def create_comment
    return unless is_authenticated?
    user = User.find_by_id(@current_user['id'])
    post = Post.find_by_id(params[:id])
    user.comments << post.comments.create({body:params[:comment][:body]})
    redirect_to post_comments_path
    #render json: params
  end
  def new_comment
    @parent_comment = Comment.find_by_id(params[:id])
    @comment = Comment.new
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

  private
  # def locate_comment
  #   redirect_to '/404.html' unless  @post = Post.find_by_id(params[:id])
  # end
  def parent_post comment
    return comment if comment.class == Post
    return parent_post(comment.commentable)
  end


end