class PagesController < ApplicationController
  layout :select_layout
  before_action :require_admin, only: [:users]

  def home
  end

  def users
    @users = User.all
  end

  private

  def appointments
    @appointments = Appointment.all
  end

private
  def select_layout
    case action_name
    when 'home'
      'landing'
    else
      'application'
    end
  end

  def require_admin
    redirect_to root_path unless current_user&.admin?
  end
end
