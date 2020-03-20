class TeachersController < ApplicationController
  skip_before_action :require_user_or_teacher
  before_action :require_teacher
  before_action :set_teacher, only: [:edit, :update, :show, :my_courses, :my_students]
  before_action :require_same_teacher, only: [:edit, :update, :my_courses, :my_students]


  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_param)
    if @teacher.save
      flash[:notice] = "You have successfully signed up as a teacher"
      redirect_to @teacher
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @teacher.update(teacher_param)
      flash[:notice] = "You have successfully updated your profile"
      redirect_to @teacher
    else
      flash.now[:notice] = "You cannnot update your account because of incorrect information"
      render 'edit'
    end
  end

  def show
  end

  def my_courses
    @courses = @teacher.courses
  end

  def my_students
    @courses = @teacher.courses
  end


  private

  def teacher_param
    params.require(:teacher).permit(:name, :email, :position, :password, :password_confirmation)
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def require_same_teacher
    if @teacher != current_teacher
      flash[:notice] = "You can update your profile only"
      redirect_to current_teacher
    end
  end

end