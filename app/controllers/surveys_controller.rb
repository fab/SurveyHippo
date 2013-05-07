get '/survey/create' do
  erb :survey_create
end

post '/survey/create' do
  create_survey
  redirect to "/survey/#{@survey.id}/results"
end

get '/survey/all' do
  erb :survey_all
end


get '/survey/:id/results' do
  @survey = Survey.find(params[:id])
  erb :survey_results
end


get '/survey/:id' do
  @survey = Survey.find(params[:id])
  if completed?(@survey)
    @message = "You've already completed this survey!"
  end
  erb :survey
end

post '/survey/:id/submit' do
  puts params
  params.each_pair do |q_id,c_id|
    unless q_id == "splat" || q_id ==  "captures" || q_id == "id"
     Response.create(:user_id => current_user.id, :question_id => q_id, :choice_id => c_id)
   end
  end
  Completion.create(:user_id => current_user.id, :survey_id => params[:id], :completed => true)
  redirect '/survey/all'
end
