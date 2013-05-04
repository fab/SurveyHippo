class User < ActiveRecord::Base
  has_many :completions
  has_many :surveys, :through => :completions, :class_name => 'Survey', :foreign_key => 'author_id'
  has_many :responses
  validates_presence_of :username, :password_hash, :email 
  validates :email, :format => { :with => /.+@\w+\.\w{3}/ }, :uniqueness => true
  validates :username, :length => { :minimum => 4, :maximum => 20 }, :uniqueness => true
   include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(name, password)
    @user = find_by_username(name)
     if @user
      @user.password == password
      @user
    else
      nil
    end
  end

end
