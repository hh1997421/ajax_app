class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC")
  end

  def create
    Post.create(content: params[:content])
    # メモを保存した後にトップページへリダイレクト
    redirect_to action: :index
  end
end