Rails.application.routes.draw do
  devise_for :users , :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}
  root 'tweets#index'
  resources :tweets do
   resources :comments,only:[:create]
  end
  resources :users ,only:[:show]
end


# get 'tweets/new' => 'tweets#new'
# post 'tweets' => 'tweets#create'
# delete 'tweets/:id' => 'tweets#destroy'
# get 'tweets/:id' => 'tweets#edit'
# get 'tweets/show' => 'tweets#show'
# patch 'tweets/:id' => 'tweets#update'
# get 'users/:id' => 'tweets#show'
# post 'tweets/:tweet_id/comments' => 'comments#create'

#ここでルーティングを組んでいる。devie_for :usersで、ユーザーのログイン周りのルーティングを全て組んでいる。また、最初のページでindex画面を表示させるように設定し、tweetsコントローラに対しリソースを組んでいる。さらに、どのtweetのcommentかを明示化するために、ネストさせており、クリエイトアクションのみ実行可能にしている。
#その次に、usersコントローラのshowアクションのみルーティングを組んでいる。
