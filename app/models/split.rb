class Split < ApplicationRecord
  belongs_to :expense
  belongs_to :user
   def group
    expense.group
  end
end
