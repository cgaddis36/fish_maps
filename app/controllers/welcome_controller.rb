class WelcomeController < ApplicationController
  def index
    @posts = Post.order_posts
  end

  def show

  end
end
