class Course < ActiveRecord::Base
  belongs_to :user
  has_many :sections
  has_many :enrollments

  mount_uploader :image, ImageUploader 
  validates :title, presence: { message: 'Please add a title' }
  validates :description, presence: { message: 'Please add a description' }
  validates :cost, presence: { message: 'Plese add a cost' }, numericality: { greater_than_or_equal_to: 0}

  def cost_in_cents
    return (self.cost * 100).to_i
  end

  def free?
    cost.zero?
  end

  def premium?
    ! free?
  end

end
