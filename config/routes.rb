LearnedToday::Application.routes.draw do
	match "/", to: "home#index", via: "get"
	match "/home", to: "home#index", via: "get"
	match "/fact/:fact_url", to: "home#show", via: "get"
	match "/fact/:fact_url/prev", to: "home#prev", via: "get"
	match "/fact/:fact_url/next", to: "home#next", via: "get"
end
