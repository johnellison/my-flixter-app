class Lesson < ActiveRecord::Base
  belongs_to :section

  mount_uploader :video, VideoUploader
  validates :video, presence: { message: 'Please add a video' } 
  validates :title, presence: { message: 'Please add a title' }
  validates :subtitle, presence: { message: 'Please add a subtitle' }
end
