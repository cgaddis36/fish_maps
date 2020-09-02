class WelcomeController < ApplicationController
  def index
    if params[:region]
      region = params[:region]
      @posts = Post.order_by_region(region)
    else
      @posts = Post.order_posts
    end
  end

  def show; end
end
