class Teacher::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_auth_for_current_course, only: [:show]
  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.create(course_params)
    if @course.valid?
      redirect_to teacher_course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
  end

  private

  def require_auth_for_current_course
    if current_course.user != current_user
      render text: 'You are unauthorized to perform this action', status: :unauthorized  
    end
  end

  helper_method :current_course
  def current_course
    @course ||= Course.find(params[:id])
  end

    
  def course_params
    params.require(:course).permit(:title, :description, :cost)
  end


end
