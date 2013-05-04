post '/register' do
  @user = User.new(params)
  @user.save
  if @user.save
    session[:id] = @user.id
    redirect("/user/#{@user.id}")
  else
    @errors = @user.errors.full_messages
    erb :index
  end
end


post '/login' do
  current_user = User.authenticate(params[:username], params[:password])

  if current_user
    session[:id] = current_user.id
    redirect("/user/#{current_user.id}")
  else
    @errors = current_user.errors.full_messages
    erb :index
  end

  erb :user_profile
end

get "/user/:id" do
  erb :user_profile
end

get '/logout' do
  session.clear
  @message = "You have successfully logged out!"
  erb :index
end

