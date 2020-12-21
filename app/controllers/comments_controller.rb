# frozen_string_literal: true

# Comments controller
class CommentsController < ApplicationController
  before_action :set_post, only: [:create]

  def create
    @comment = Comment.new(post_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    @post = @comment.post
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.find(params[:comment][:post_id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:comment).permit(:comment, :post_id).reverse_merge({ user: current_user })
  end
end
