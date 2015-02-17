class Lesson < ActiveRecord::Base
  belongs_to :section

  validates :title, presence: { message: 'Please add a title' }
  validates :subtitle, presence: { message: 'Please add a subtitle' }
end
