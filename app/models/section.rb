class Section < ActiveRecord::Base
  belongs_to :course
  has_many :lessons

  validates :title, presence: { message: 'Please add a title' }
  validates :subtitle, presence: { message: 'Please add a subtitle' }
end
