get '/survey/create' do
  erb :survey_create
end

post '/survey/create' do
  p params
  # p params[:question]
  # p params[:q1_choice]

  survey = Survey.create(name: params[:name])

  q_num = 1

  params[:question].each do |q|

    question = Question.create(question: q, survey_id: survey.id)

    params["choice_q#{q_num}"].each do |c|
      choice = Choice.create(choice: c, question_id: question.id)
    end

    q_num += 1
  end

  # do it for the first elements in choice up until length of the 

  redirect '/survey/' + survey.id.to_s
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])
  "You're looking for survey with id #{@survey.id}"
  # erb :survey
end
