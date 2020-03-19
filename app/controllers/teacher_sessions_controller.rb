class TeacherSessionsController < ApplicationController
  skip_before_action :require_user_or_teacher

  def new

  end

  def create
    teacher = Teacher.find_by(email: params[:teacher_sessions][:email])
    if teacher && teacher.authenticate(params[:teacher_sessions][:password])
      flash[:notice] = "You have successfully logged in as a teacher"
      session[:teacher_id] = teacher.id
      redirect_to teacher
    else
      render "new"
    end
  end

  def destroy
    session[:teacher_id] = nil
    flash[:notice] = "You have successfully logged out as a teacher"
    redirect_to teacher_login_path
  end

end