class DashboardController < ApplicationController
    def show
        require 'pry'; binding.pry
        @gardens = ["Garden with tomatoes, Garden with basil, Garden with corn"]
    end
end


