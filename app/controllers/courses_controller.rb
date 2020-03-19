class CoursesController < ApplicationController
  skip_before_action :require_user_or_teacher, only: [:index, :show]
  before_action :require_teacher, only: [:new, :create, :edit, :update]
  before_action :set_course, only: [:edit, :update, :show, :destroy]
  before_action :require_same_teacher, only: [:edit, :update, :destroy]

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
    if @course.update(course_params)
      flash[:notice] = "You have successfully updated your course"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @course.destroy
    flash[:notice] = "You have successfully delete your course"
    redirect_to root_path
  end

  private

  def course_params
    params.require(:course).permit(:name, :short_name, :description)
  end

  def set_course
    @course = Course.find(params[:id])
  end

  def require_same_teacher
    if @course.teacher != current_teacher
      flash[:notice] = "You can update your course only"
      redirect_to current_teacher
    end
  end
end
