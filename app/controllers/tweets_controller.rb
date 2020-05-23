class TweetsController < ApplicationController
  def index
    tweets = Tweet.order('created_at DESC');
    render json: { status: 'SUCCESS', message: 'Loaded tweets', data:tweets }, status: :ok
  end

  def show
    tweet = Tweet.find(params[:id])
    render json: { status: 'SUCCESS', message: 'Loaded tweet', data:tweet }, status: :ok
  end

  def create
    tweet = Tweet.new(tweet_params)

    if tweet.save
      render json: { status: 'SUCCESS', message: 'Saved tweet', data:tweet }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Tweet not saved', data:tweet.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    render json: { status: 'SUCCESS', message: 'Deleted tweet', data:tweet }, status: :ok
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      render json: { status: 'SUCCESS', message: 'Updated tweet', data:tweet }, status: :ok
    else
      render json: { status: 'ERROR', message: 'tweet not updated', data:tweet }, status: :unprocessable_entity
    end
  end

  private

  def tweet_params
    params.permit(:title, :body)
  end

end
