class PagesController < ApplicationController
  def home
    @cities = ["Berlin", "London", "Amsterdam", "Paris", "Tokyo"]
  end
end
