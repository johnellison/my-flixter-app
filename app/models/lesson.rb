class Lesson < ActiveRecord::Base
  include RankedModel
  belongs_to :section
  ranks :row_order, with_same: :section_id

  mount_uploader :video, VideoUploader
  validates :video, presence: { message: 'Please add a video' } 
  validates :title, presence: { message: 'Please add a title' }
  validates :subtitle, presence: { message: 'Please add a subtitle' }
end
