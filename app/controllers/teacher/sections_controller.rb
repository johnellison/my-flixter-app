class Teacher::SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_auth_for_current_course

  def new
    @section = Section.new
  end
  
  def create
    @section = @course.sections.create(section_params)
    if @section.valid?
      redirect_to teacher_course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def require_auth_for_current_course
    if current_course.user != current_user
      render text: 'You are unauthorized to perform this action' , status: :unauthorized
    end
  end

  helper_method :current_course
  def current_course
    @course ||= Course.find(params[:course_id])
  end

  def section_params
    params.require(:section).permit(:title, :subtitle)
  end

end
