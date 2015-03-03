class Teacher::LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_auth_for_current_section, only: [:new, :create]
  before_action :require_auth_for_current_lesson, only: :update

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = current_section.lessons.create(lesson_params)
    if @lesson.valid?
      redirect_to teacher_course_path(current_section.course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    current_lesson.update_attributes(lesson_params)
    render text: 'Updated!'
  end

  private

  def require_auth_for_current_lesson
    if current_lesson.section.course.user != current_user
      render text: 'You are unauthorized to perform this action', status: :unauthorized
    end
  end

  def require_auth_for_current_section
    if current_section.course.user != current_user
      render text: 'You are unauthorized to perform this action', status: :unauthorized  
    end
  end

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  helper_method :current_section
  def current_section
    @current_section ||= Section.find(params[:section_id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle, :video, :row_order_position)
  end


  
end
