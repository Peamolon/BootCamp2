class Post < ApplicationRecord
    belongs_to :owner, class_name: 'User'
    validates :content, :seen,  presence: true
end
