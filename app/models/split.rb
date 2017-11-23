class Split < ApplicationRecord
  belongs_to :expense
  belongs_to :user
  belongs_to :group, through: :expense
end
