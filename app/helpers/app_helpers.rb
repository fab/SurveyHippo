helpers do 

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def users_created_surveys
     @created_surveys = Survey.where(author_id: session[:id])
  end

  def users_completed_surveys
     @completed_surveys = Survey.where(author_id: session[:id])
  end
end