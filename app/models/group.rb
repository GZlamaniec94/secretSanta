class Group < ApplicationRecord
  belongs_to :user
  has_many :group_members
  has_many :members, through: :group_members
  validates :name, presence: true, 
            uniqueness: { case_sensitive: false },
            length: {minimum: 3, maximum: 20} 
end  