class Teacher::SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_auth_for_current_course, only: [:create]
  before_action :require_auth_for_current_section, only: :update

  def create
    @section = @course.sections.create(section_params)
    if @section.valid?
      redirect_to teacher_course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    current_section.update_attributes(section_params)
    render text: 'Updated'
  end

  private

  def require_auth_for_current_section
    if current_section.course.user != current_user
      render text: 'You are unauthorized to perform this action' , status: :unauthorized
    end
  end

  def require_auth_for_current_course
    if current_course.user != current_user
      render text: 'You are unauthorized to perform this action' , status: :unauthorized
    end
  end

  def current_section
    @section ||= Section.find(params[:id])
  end

  helper_method :current_course
  def current_course
    @course ||= Course.find(params[:course_id])
  end

  def section_params
    params.require(:section).permit(:title, :subtitle, :row_order_position)
  end

end
