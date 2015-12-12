class User < ActiveRecord::
  validates :username, :password, presence:true
end
