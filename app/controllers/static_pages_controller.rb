class StaticPagesController < ApplicationController
  def home
    @schedules = Schedule.all
  end

  def about
  end

  def terms
  end
end
