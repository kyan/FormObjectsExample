Rails.application.routes.draw do
  resources :contact_us, only: [:index] do
    collection do
      post '' => 'contact_us#send_enquiry'
    end
  end

  root 'contact_us#index'
end
