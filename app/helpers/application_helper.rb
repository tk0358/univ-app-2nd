module ApplicationHelper

  def session_link
    if logged_in?
      link_to("logout", logout_path, method: :delete)
    elsif teacher_logged_in?
      link_to("teacher's logout", teacher_logout_path, method: :delete)
    else
      link_to("login", login_path)
    end
  end
end
