# frozen_string_literal: true

# Home controller
class HomeController < ApplicationController
  def index
    if params[:search].blank?
      @posts = Post.all
    else
      @parameter = params[:search].downcase
      @posts = Post.all.where('lower(title) LIKE :search', search: @parameter)
    end
  end
end
