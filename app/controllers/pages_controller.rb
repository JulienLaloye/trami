class PagesController < ApplicationController
  def home
    @moods = Mood.all
  end
end
