class UserController < ApplicationController

	get '/signup' do
		erb :'users/signup'
	end

	post '/signup' do
		if !params[:email] == "" || !params[:name] == "" || !params[:password] == ""
			redirect to '/signup'
		else
			@user = User.new(:email => params[:email], :name => params[:name], :password => params[:password])
			@user.save
			session[:user_id] = @user.id
			redirect to '/build-sessions'
		end
	end

  get '/login' do
    if logged_in?
      redirect 'build-sessions'
    else
      erb :'users/login'
    end
	end

	post '/login' do
		@user = User.find_by(:email => params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			erb :'/buildsessions/all'
		else
			redirect to '/login'
		end

	end


		

    
end