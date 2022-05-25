class Member < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :group_members
  has_many :groups, through: :group_members
  validates :name, presence: true, 
                       uniqueness: { case_sensitive: false },
                       length: {minimum: 3, maximum: 20}
  validates :email, presence: true, 
                    uniqueness: { case_sensitive: false },
                    length: {maximum: 105},
                    format: {with: /\A\S+@.+\.\S+\z/}
end  