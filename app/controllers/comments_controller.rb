class CommentsController < ApplicationController

  def create
 @comment = Comment.create(text: params[:text], tweet_id: params[:tweet_id], user_id: current_user.id)
 redirect_to "/tweets/#{@comment.tweet.id}"
 #コメントモデルを新規作成するにあたって、:text.:tweet_id.と現在ログイン中のユーザーidをparamsに入れる。
 #commentとtweetは1:1なので、アソシエーションを組めている。ここではアソシエーションを使って、@commentと結びつくツイートのidを記述している。
 #Comment.createはCommentモデルのインスタンスを生成するものである。
  end

  private
  def comment_params
    params.permit(:text, :tweet_id)
  end

end

#上記createメソッドでparamsに入れたものは、ストロングパラメーターで、:text,:tweet_idのみDBに保存できる仕様になっている。
