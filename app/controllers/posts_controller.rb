# frozen_string_literal: true

# Posts controller
class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  # POST /post
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update; end

  def destroy; end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    defaults = { user: current_user, post_category_id: PostCategory.find(1) }
    params.require(:post).permit(:title, :content).reverse_merge(defaults)
  end
end
