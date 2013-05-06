helpers do 

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def users_created_surveys
     @created_surveys = Survey.where(author_id: current_user.id)
  end

  def users_completed_surveys
     @completed_surveys = Completion.where(user_id: current_user.id)
  end

  def completed?(survey)
    completed = users_completed_surveys.select {|completion| completion.survey_id == survey.id }
    if completed.empty?
      false
    else
      true
    end
  end
end
