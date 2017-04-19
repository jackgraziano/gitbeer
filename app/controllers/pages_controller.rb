class PagesController < ApplicationController
  def home
    @facilities = Facility.take(3)
  end
end
