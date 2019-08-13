class UsersController < ApplicationController

def show
  user = User.find(params[:id])
  @nickname = user.nickname
  @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
end
end

  #ユーザーのマイページ画面に遷移するコントローラーを作成。idが自動的にパラメーターとしてparamsというハッシュ型の変数に格納されているものの中から、バリューの任意のユーザーを探す。
  #ユーザーのニックネームカラムを@nicknameとして代入。
  #ユーザーに対してtweetは１：多なので、アソシエーションを汲んだ上で、ユーザーのツイート情報を任意のページで、5ずつページネイトし、降順に並べるものである。
  #params[:page]は、ビューのリクエストの際paramsの中にpageというキーが追加されて、その値がビューで指定したページ番号となる。なので、pageの引数はparams[:page]となる。
