FactoryGirl.define do
  factory :user do
    id 99
    email { SecureRandom.urlsafe_base64(5) + '@email.com'}
    password '123456789'
  end

  factory :course do
    id 99
    title 'The Course'
    description 'This is the best course ever!'
    cost '10'
  end

  factory :section do
    title 'Section 1'
    subtitle 'The Lesson'
    course_id 99
  end

  factory :lesson do
    title 'Lesson 99'
    subtitle 'Understanding X, Y, & Z'
    video Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/test/factories/uploads/small.mp4')))
  end

  factory :enrollment do
    id 99
    user_id 99
    course_id 99
  end
end
