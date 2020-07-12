class CatchController < ApplicationController
  def new
    @catch = current_user.posts.new
  end

  def create
    post = Post.create(post_params)
  end

  private

  def post_params
    require "pry"; binding.pry
  end
end
