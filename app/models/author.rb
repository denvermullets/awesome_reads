class Author < ApplicationRecord
    has_many :books

    validates :name, uniqueness: { case_sensitive: false }

    
    
end
