class Member < ApplicationRecord
  before_save { self.email = email.downcase }
  belongs_to :group
  validates :name, presence: true, 
                       length: {minimum: 3, maximum: 20}
  validates :email, presence: true, 
                    length: {maximum: 105},
                    format: {with: /\A\S+@.+\.\S+\z/}
end  