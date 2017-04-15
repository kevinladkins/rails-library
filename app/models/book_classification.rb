class BookClassification < ApplicationRecord
  belongs_to :book
  belongs_to :classification
end
