class Section < ActiveRecord::Base
  belongs_to :course

  validates :title, presence: { message: 'Please add a title' }
end
