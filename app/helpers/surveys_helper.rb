helpers do 

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
    if total == 0
      0
    else
      ((num/total.to_f)*100).round(2)
    end
  end
  
  def create_survey
    @survey = Survey.create(name: params[:name], author_id: session[:id])

    qu_num = 1

    params[:question].each do |qu|

      question = Question.create(text: qu, survey_id: @survey.id)

      params["choice_q#{qu_num}"].each do |ch|
        Choice.create(text: ch, question_id: question.id)
      end

      qu_num += 1

    end
  end

end
