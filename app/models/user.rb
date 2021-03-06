class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :groups, dependent: :destroy
  validates :username, presence: true, 
                       uniqueness: { case_sensitive: false },
                       length: {minimum: 3, maximum: 20}
  validates :email, presence: true, 
                    uniqueness: { case_sensitive: false },
                    length: {maximum: 105},
                    format: {with: /\A\S+@.+\.\S+\z/}
  has_secure_password                                   
end  