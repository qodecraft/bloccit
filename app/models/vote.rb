class Vote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not valid" }
  
  def up_vote?
     value == 1
   end
 
   def down_vote?
     value == -1
   end
  
end
