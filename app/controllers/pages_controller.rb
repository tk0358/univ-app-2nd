class PagesController < ApplicationController
  skip_before_action :require_user_or_teacher

  def about

  end

end