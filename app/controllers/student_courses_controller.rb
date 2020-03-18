class StudentCoursesController < ApplicationController

  def create
    course_to_add = Course.find(params[:course_id])
    unless current_user.courses.include?(course_to_add)
      # current_user.courses << course_to_add
      StudentCourse.create(course: course_to_add, student: current_user)
      flash[:notice] = "You have successufully enrolled in #{course_to_add.name}"
      redirect_to root_path
    else
      flash[:notice] = "Something was wrong with your enrollment"
      redirect_to root_path
    end
  end

  def destroy
    student_course = StudentCourse.where(student_id: current_user.id, course_id: params[:course_id]).first
    student_course.destroy
    flash[:notice] = "You have successfully remove the course"
    redirect_to root_path
  end

  private

  def student_course_params
    params.permit(:course)
  end

end