class Group < ApplicationRecord
  belongs_to :user
  has_many :members
  validates :name, presence: true, 
            length: {minimum: 3, maximum: 20} 
end  