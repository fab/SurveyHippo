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
    redirect to '/user/' + @user.id.to_s
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

  if login_attempt
    session[:id] = login_attempt.id
    redirect to '/'
  else
    @errors = login_attempt.errors.full_messages
    erb :user_login
  end

end


get '/logout' do
  session.clear
  @message = 'You have successfully logged out!'
  redirect to '/'
end

