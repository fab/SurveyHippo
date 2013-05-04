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
  erb :user_profile
end

get "/user/:id" do
  erb :user_profile
end