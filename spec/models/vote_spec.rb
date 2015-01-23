require 'rails_helper'

describe Vote do
  
  describe "valiations" do
    describe "Vote validations" do
      it " only allows 1 or -1 as a value" do
        
      v = Vote.new(value: 1)
      expect(v.valid?).to eq(true)
      
      v2 = Vote.new(value: -1)
      expect(v2.valid?).to eq(true)
      
      v3 = Vote.new(value: 2)
      expect(v3.valid?).to eq(false)
      
    end
  end
end
end

