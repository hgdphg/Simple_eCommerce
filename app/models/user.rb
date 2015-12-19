class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_secure_password

  after_destroy :ensure_last_user

  protected
    def ensure_last_user
      if User.count.zero?
        raise "Can't destroy last user"
      end
    end
end
