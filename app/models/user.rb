class User < ActiveRecord::Base
  has_many :completions
  has_many :surveys, :through => :completions, :class_name => 'Survey', :foreign_key => 'author_id'
  has_many :responses
end
