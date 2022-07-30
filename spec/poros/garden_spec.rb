require 'rails_helper'

RSpec.describe Garden do
    it "exists and has attributes", :vcr do
        data = 	{:id=>"2", 
                :type=>"garden", 
                :attributes=>
                    {:name=>"Summer Garden", 
                    :cardinal_direction=>"South", 
                    :notes=>"it's too damn hot"}}

        garden = Garden.new(data)

        expect(garden).to be_a(Garden)
        expect(garden.name).to eq('Summer Garden')
        expect(garden.cardinal_direction).to eq('South')
        expect(garden.notes).to eq("it's too damn hot")

    end
end
