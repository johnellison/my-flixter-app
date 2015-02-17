class Section < ActiveRecord::Base
  belongs_to :course
  has_many :lessons

  validates :title, presence: { message: 'Please add a title' }
end
