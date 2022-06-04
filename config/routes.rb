Rails.application.routes.draw do
  root to: 'shortlinks#index'

  get '/:back_half', to: 'redirects#redirect'

  scope :system do
    resources :shortlinks
  end
end
