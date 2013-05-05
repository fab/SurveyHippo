get '/survey/create' do
  erb :survey_create
end

post '/survey/create' do
  # need to be logged in to go down this route

  survey = Survey.create(name: params[:name], author_id: session[:id])

  q_num = 1
  params[:question].each do |q|
    question = Question.create(question: q, survey_id: survey.id)
    params["choice_q#{q_num}"].each do |c|
      choice = Choice.create(choice: c, question_id: question.id)
    end
    q_num += 1
  end
  
  redirect "/survey/#{survey.id}"
end

get '/survey/:id' do
  @survey = Survey.find(params[:id])
  erb :survey
end

get '/survey/:id/results' do
  # this results matters on login
  @survey = Survey.find(params[:id])
  erb :survey_results
end

get "/view/survey/all" do
 #lists all surveys
  erb :survey_list
end
