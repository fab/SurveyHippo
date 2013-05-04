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

  def all_surveys
    @all_surveys = Survey.all
  end

  def responses_per_question(question)
    Response.where('question_id = ?', question.id).count
  end

  def responses_per_choice(question, choice)
    Response.where('question_id = ? and choice_id = ?', question.id, choice.id).count
  end

  def percentage(num, total)
    ((num/total.to_f)*100).round(2)
  end
end
