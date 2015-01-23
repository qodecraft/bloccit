require 'rails_helper'

describe Vote do
  describe "valiations" do
    describe "Vote validations" do
      it " only allows 1 or -1 as a value"
      expect ( @vote.value ).to eq(1 || -1)
    end
  end
end
