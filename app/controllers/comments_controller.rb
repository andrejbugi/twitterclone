class CommentsController < ApplicationController
  def new
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.build
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])

    @comment = @tweet.comments.build(comment_params)

    if @comment.save
      redirect_to @tweet
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])

    @tweet = @comment.tweet
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
