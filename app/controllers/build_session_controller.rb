class BuildSessionController < ApplicationController
    
  get '/build-sessions' do
    incompleted = []
    @build_sessions = BuildSession.all
      @build_sessions.each do |build_session|
        if build_session.completed? == false
          incompleted << build_session
        end
      end
      @build_sessions = incompleted
		erb :'buildsessions/all'
	end


	get '/build-sessions/new' do
		if !logged_in?
			redirect to '/login'
		else
			erb :'buildsessions/new'
		end
	end

  post '/build-sessions/new' do
		@build_session = BuildSession.new(:name => params[:name], :description => params[:description], :reward => params[:reward], :expected_pomo_periods => params[:expected_pomo_periods], :actual_pomo_periods => 0, :completed? => false, :user_id => params[:user_id])
		@build_session.save
		redirect to "/build-sessions/#{@build_session.id}"
	end

	get '/build-sessions/:id' do
		@build_session = BuildSession.find_by_id(params[:id])
		erb :'/buildsessions/show'
	end

  get '/build-sessions/:id/edit' do 
    @build_session = BuildSession.find_by_id(params[:id])
    if @build_session.user == current_user
      erb :"/buildsessions/edit"
    else 
      redirect to '/login'
    end
	end

  patch '/build-sessions/:id/edit' do
    build_session = BuildSession.find_by_id(params[:id])
    if build_session.user == current_user
      build_session.name = params[:name]
      build_session.description = params[:description]
      build_session.reward = params[:reward]
      build_session.expected_pomo_periods = params[:expected_pomo_periods]

      redirect to "/build-sessions/#{build_session.id}"
    else 
      redirect to "/build-sessions/#{build_session.id}/edit"
    end

	end

	get '/build-sessions/:id/work' do
		@build_session = BuildSession.find_by_id(params[:id])
		erb :"buildsessions/work_session"
	end


  get '/build-sessions/:id/reward' do
    @build_session = BuildSession.find_by_id(params[:id])
		erb :'/buildsessions/reward'
	end

	post '/build-sessions/:id/reward' do
    @build_session = BuildSession.find_by_id(params[:id])
    @build_session.completed? == true  
		redirect to "/build-sessions/#{@build_session.id}/reward"
	end

end