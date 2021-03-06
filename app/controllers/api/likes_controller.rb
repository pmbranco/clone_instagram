class Api::LikesController < ApplicationController

  def create
    @like = Like.new(like_params)
    if @like.save
      render "api/likes/show"
      # render json: @like
    else
      render json: @like.errors.full_messages, status: 422
    end
  end

  def destroy
    @like = Like.find_by(user_id: like_params[:user_id],
                            post_id: like_params[:post_id])
    if @like
      @like.destroy
      render json: @like
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
