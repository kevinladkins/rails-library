class AuthorClassification < ApplicationRecord
  belongs_to :author
  belongs_to :classification
end
