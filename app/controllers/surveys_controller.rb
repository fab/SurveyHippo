get '/survey/create' do
  erb :survey_create
end

post '/survey/create' do
  # need to be logged in to go down this route

  survey = Survey.create(name: params[:name], author_id: session[:id])

  qu_num = 1
  params[:question].each do |qu|
    question = Question.create(text: qu, survey_id: survey.id)
    params["choice_q#{qu_num}"].each do |ch|
      choice = Choice.create(text: ch, question_id: question.id)
    end
    qu_num += 1
  end
  redirect "/survey/#{survey.id}"
end


get "/survey/all" do
  erb :survey_all
end


get '/survey/:id/results' do
  # this results matters on login
  @survey = Survey.find(params[:id])
  erb :survey_results
end


get '/survey/:id' do
  @survey = Survey.find(params[:id])
  erb :survey
end