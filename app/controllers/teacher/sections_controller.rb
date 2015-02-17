class Teacher::SectionsController < ApplicationController
  before_action :authenticate_user!
  def new
    @course = Course.find(params[:course_id])
    @section = Section.new
  end
  
  def create
    @course = Course.find(params[:course_id])
    @section = @course.sections.create(section_params)
    if @section.valid?
      redirect_to teacher_course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end

  end

  private
  def section_params
    params.require(:section).permit(:title)
  end

end
