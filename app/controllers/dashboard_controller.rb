class DashboardController < ApplicationController
    def show
        @gardens = ["Garden with tomatoes, Garden with basil, Garden with corn"]
        # binding.pry
    end
end
