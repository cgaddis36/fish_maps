class PostController < ApplicationController
  def new
    @post = current_user.posts.new
  end

  def create
    post = current_user.posts.create(post_params)
    if post.save
      flash[:success] = "Successfully created post"
      redirect_to "/post/#{post.id}"
    else
      flash[:notice] = post.errors.full_messages.to_sentence
      redirect_to "/post"
    end
  end

  def show
    @post = Post.find(params[:post_id].to_i)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body_of_water, :city, :state, :region, :privacy, :fly_or_conventional)
  end
end
