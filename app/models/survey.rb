class Survey < ActiveRecord::Base
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  has_many   :questions
  has_many   :completions
  has_many   :users, :through => :completions
end
