get '/user/:id' do
  erb :user_profile
end

post '/register_ajax' do
  @user = User.new(params)
  if @user.save
    session[:id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages.join(', ')
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

