# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post_by_id, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy; end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

  def find_post_by_id
    @post = Post.find(params[:id])
  end
end
