get '/user/:id' do
  erb :user_profile
end


get '/register' do
  erb :user_register
end

post '/register' do
  @user = User.new(params)

  if @user.save
    session[:id] = @user.id
    redirect "/user/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :user_register
  end
end


get '/login' do
  erb :user_login
end

post '/login' do
  login_attempt = User.authenticate(params[:username], params[:password])

  if login_attempt.class == User
    session[:id] = login_attempt.id
    redirect to '/'
  else
    @errors = login_attempt
  end
end

post '/login_ajax' do
  puts params
  login_attempt = User.authenticate(params[:username], params[:password])

  if login_attempt.class == User
    session[:id] = login_attempt.id
    redirect to '/'
  else
    @errors = login_attempt
  end
end

get '/logout' do
  session.clear
  @message = 'You have successfully logged out!'
  redirect to '/'
end

