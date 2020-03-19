class TeachersController < ApplicationController
  skip_before_action :require_user

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

  def show
    @teacher = Teacher.find(params[:id])
  end

  private

  def teacher_param
    params.require(:teacher).permit(:name, :email, :position, :password, :password_confirmation)
  end

end