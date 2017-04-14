class Loan < ApplicationRecord
  belongs_to :patron, class_name: "User"
  belongs_to :book
end
