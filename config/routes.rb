Blogit::Engine.routes.draw do

  # Keep these above the posts resources block
  get "posts/page/:page" => "posts#index"
  get "posts/tagged/:tag" => 'posts#tagged', as: :tagged_blog_posts
  get "posts/:id/edit" => 'posts#edit'
  get "posts/:id/*other" => 'posts#show'

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  match "/" => "posts#index", as: :blog_root
end
