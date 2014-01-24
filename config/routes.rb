LearnedToday::Application.routes.draw do
	match "/", to: "home#index", via: "get"
	match "/home", to: "home#index", via: "get"
end
