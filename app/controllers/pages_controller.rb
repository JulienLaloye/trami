class PagesController < ApplicationController
  def home
    @cities = ["Berlin", "London", "Amsterdam", "Paris", "Tokyo"]
    # conditions = cities.map { |city| "address LIKE '%#{city}%'" }.join(" OR ")
    # @rooms = Room.where(conditions)
  end
end
