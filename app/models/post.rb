class Post < ApplicationRecord
    
    has_many :comments, dependent: :delete_all

    validates :title, presence: true, uniqueness: true
    validates :content, presence: true, uniqueness: true

    accepts_nested_attributes_for :comments, allow_destroy: true

    default_scope { order(created_at: :desc) }
    
end
