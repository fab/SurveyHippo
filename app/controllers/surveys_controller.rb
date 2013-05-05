get '/survey/create' do
  erb :survey_create
end

post '/survey/create' do
  # need to be logged in to go down this route

  create_survey

  redirect to '/survey/' + @survey.id.to_s
end


get '/survey/all' do
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