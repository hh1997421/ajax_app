class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC")
  end
  def create
    post = Post.create(content: params[:content], checked: false)
    render json:{ post: post }
  end
  # checkedアクションは、「既読」の操作を行ったときに実行されるアクション
  def checked

    # 先ほど設定したURLパラメーターから、既読したメモのidが渡されるように設定するので、そのidを使用して該当するレコードを取得
    post = Post.find(params[:id])
    # if文で、post.checkedという既読であるか否かを判定するプロパティを指定
    if post.checked
      # 既読であれば「既読を解除するためにfalseへ変更」
      post.update(checked: false)
    else
      # 既読でなければ「既読にするためtrueへ変更」
      post.update(checked: true)
    end
    # 更新したレコードをitem = Post.find(params[:id])で取得し直し
    item = Post.find(params[:id])
    # render json:{ post: item }でJSON形式（データ）としてchecked.jsに返却
    render json: { post: item } 
  end
end