100.times do
  User.create(:username => Faker::Name.first_name, :password => 'password', :email => Faker::Internet.email)
end

100.times do
  Survey.create(:author_id => User.all.sample.id, :name => Faker::Company.bs)
end

500.times do
  Question.create(:survey_id => Survey.all.sample.id, :question => Faker::Company.catch_phrase)
end

1000.times do
  Choice.create(:question_id => Question.all.sample.id, :choice => Faker::Lorem.sentence)
end
