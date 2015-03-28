class Section < ActiveRecord::Base
  include RankedModel
  belongs_to :course
  has_many :lessons
  ranks :row_order, with_same: :course_id

  def next_section
    section = course.sections
                    .where('row_order > ?', row_order)
                    .rank(:row_order)
                    .first
  end

  validates :title, presence: { message: 'Please add a title' }
  validates :subtitle, presence: { message: 'Please add a subtitle' }
end
