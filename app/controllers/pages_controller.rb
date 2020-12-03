class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def calls
  end

  def about
    @doctors = Doctor.all
  end
end
