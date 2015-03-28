class Lesson < ActiveRecord::Base
  include RankedModel
  belongs_to :section
  ranks :row_order, with_same: :section_id

  def next_lesson
    lesson = section.lessons
                    .where('row_order > ?', row_order)
                    .rank(:row_order)
                    .first
    if lesson.blank? && section.next_section
      section.next_section.lessons.rank(:row_order).first
    end
  end


  mount_uploader :video, VideoUploader
  validates :video, presence: { message: 'Please add a video' } 
  validates :title, presence: { message: 'Please add a title' }
  validates :subtitle, presence: { message: 'Please add a subtitle' }
end
