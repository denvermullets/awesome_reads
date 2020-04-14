class ReviewedBook < ApplicationRecord
    belongs_to :book
    belongs_to :review
end
