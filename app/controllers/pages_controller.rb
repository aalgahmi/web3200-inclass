class PagesController < ApplicationController
  layout :select_layout
  def home
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
end
