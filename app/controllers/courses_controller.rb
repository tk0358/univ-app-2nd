class CoursesController < ApplicationController
  skip_before_action :require_user_or_teacher, only: [:index, :show]
  before_action :require_teacher, only: [:new, :create, :edit, :update]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = current_teacher.courses.build(course_params)
    if @course.save
      flash[:notice] = "You have successfully create this course"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def show
    @course = Course.find(params[:id])
  end

  def destroy

  end

  private

  def course_params
    params.require(:course).permit(:name, :short_name, :description)
  end
end
