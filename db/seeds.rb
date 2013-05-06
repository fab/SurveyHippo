100.times do
  User.create(:username => Faker::Name.first_name, :password => 'password', :email => Faker::Internet.email)
end

100.times do
  Survey.create(:author_id => User.all.sample.id, :name => Faker::Company.bs)
end

500.times do
  Question.create(:survey_id => Survey.all.sample.id, :text => Faker::Company.catch_phrase)
end

1000.times do
  Choice.create(:question_id => Question.all.sample.id, :text => Faker::Lorem.sentence)
end

1.upto(100) do |i|
  Response.create(:question_id => 501, :choice_id => [1001, 1002].sample, :user_id => i)
end

1.upto(100) do |i|
  Response.create(:question_id => 502, :choice_id => [1003, 1004].sample, :user_id => i)
end
