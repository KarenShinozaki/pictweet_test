class TweetsController < ApplicationController
#ルイールコントローラーにアプリケーションを継承する

  # before_action :move_to_index, except: [:index,:show]
  #全てのアクションの実行前にインデックスページに飛ぶ。ただし、インデックスページと詳細ページは除く

  def index
     @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    #ツイートモデルを降順に５件のみ表示させる左辺を、ビューファイルで使用したい@tweetsに入れる そこで定義

  end

  def new
  end

  def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
  end
   #ツイートモデルのインスタンスの新規作成をし、保存するメソッド過程。パラムズに:image,:textを入れている。また、paramsに入れる必要のないuser_idは、current_userメソッドを使って自動で入れている

  def destroy
    tweet= Tweet.find(params[:id])
    tweet.destroy if tweet.user_id == current_user.id
    #投稿を削除する。キーとしての:idがバリューで任意のツイートidが入り、ツイートをしたユーザーのid(アソシエーションを組んでいる)と現在ログイン中のユーザーidが等しければ、ツイートは削除される。
    #current_user.idで現在ログイン中のユーザーのusersテーブルのidカラムの情報を引き出している
  end

  def edit
    @tweet = Tweet.find(params[:id])
    #投稿を編集し、ビューファイルへ投げるため、＠tweetへ代入する。
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
       #ツイートを上書きするための変数tweetを定義。その変数tweetのuser_idと現在ログイン中のユーザーidが等しければ、変数tweetはtweet_paramsの:name,:image,:textを上書きする。
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
    #詳細画面をビューファイルに反映させるためのキーとしての:id・バリューで任意のツイートidが入る@tweetを定義。
    #上記定義した@twseetには１：多の関係でcommentsがつくため、アソシエーションを組んだ上で、n+1問題をincludesで解決している。
  end

  private
  def tweet_params
    params.permit( :image, :text)
     ##外部から呼び出されないメソッドである。paramsの中身には、:image.:textのみしか通過できないということを定義
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
    #ユーザーがサインインしていない限り、インデックス画面に遷移する。
  end
end
