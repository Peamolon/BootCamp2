class Post < ApplicationRecord
    validates :content, :seen,  presence: true
end
