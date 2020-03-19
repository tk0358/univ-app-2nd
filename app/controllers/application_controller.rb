class ApplicationController < ActionController::Base
  before_action :require_user_or_teacher
  helper_method :current_user, :logged_in?, :current_teacher, :teacher_logged_in?, :user_or_teacher_logged_in?

  def current_user
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in?
    !!current_user  
  end

  def require_user
    if !logged_in?
      flash[:notice] = "You must be logged in to perfomr that action"
      redirect_to login_path
    end
  end

  def current_teacher
    @current_teacher ||= Teacher.find(session[:teacher_id]) if session[:teacher_id]
  end

  def teacher_logged_in?
    !!current_teacher
  end

  def require_teacher
    if !teacher_logged_in?
      flash[:notice] = "You must be logged in as a teacher to perform that action"
      redirect_to root_path
    end
  end

  def user_or_teacher_logged_in?
    logged_in? || teacher_logged_in?
  end

  def require_user_or_teacher
    if !user_or_teacher_logged_in?
      flash[:notice] = "You must be logged in to perfomr that action"
      redirect_to login_path
    end
  end
end
