class PagesController < ApplicationController
  layout :determine_layout

  def determine_layout
    if user_signed_in?
      'application'
    else
      'clear_layout'
    end
  end

  def landing
  end
end
