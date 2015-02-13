class Course < ActiveRecord::Base
  belongs_to :user

  attr_accessor :title, :description, :cost

  validates :title, presence: { message: 'Please add a title' }
  validates :description, presence: { message: 'Please add a description' }
  validates :cost, presence: { message: 'Plese add a cost' }, numericality: { greater_than_or_equal_to: 0}
end
