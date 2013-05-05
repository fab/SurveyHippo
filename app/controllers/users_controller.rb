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
  current_user = User.authenticate(params[:username], params[:password])

  if current_user
    session[:id] = current_user.id
    redirect to '/user/' + current_user.id.to_s
  else
    @errors = current_user.errors.full_messages
    erb :user_login
  end

end


get '/logout' do
  session.clear
  @message = 'You have successfully logged out!'
  redirect to '/'
end

