class User < ActiveRecord::Base
  include BCrypt


  has_many :completions
  has_many :surveys, :through => :completions, :class_name => 'Survey', :foreign_key => 'author_id'
  has_many :responses
  validates_presence_of :username
  validates_presence_of :password_hash 
  validates_presence_of :email  
  validates :email, :format => { :with => /.+@\w+\.\w{3}/ }, :uniqueness => true
  validates :username, :length => { :minimum => 4, :maximum => 20 }, :uniqueness => true
   

  def self.authenticate(username, password)
    @user = find_by_username(username)
     if @user
      @user.password == password
      @user
    else
      return "Could not find Username or Password."
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
