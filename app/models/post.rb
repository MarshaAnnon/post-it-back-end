class Post < ApplicationRecord
    
    has_many :comments

    validates :title, presence: true, uniqueness: true
    validates :content, presence: true, uniqueness: true
    validates :author_name, presence: true

    accepts_nested_attributes_for :comments

    default_scope { order(created_at: :desc) }
    
end
