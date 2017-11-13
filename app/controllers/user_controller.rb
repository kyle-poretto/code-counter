class UserController < ApplicationController


	get '/signup' do
		if !logged_in?
			erb :index
		else
			erb :signup
		end
	end

  get '/login' do
      if logged_in?
          erb :index
      else
         redirect '/login'
      end
	end
		

		

    
end