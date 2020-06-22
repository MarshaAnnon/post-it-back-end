class Post < ApplicationRecord
    has_many :comments

    validates :title, presence: true, uniqueness: true
    validates :content, presence: true, uniqueness: true
    validates :author_name, presence: true

    accepts_nested_attributes_for :comments, allow_destroy: true

    default_scope { order(created_at: :desc) }
    scope :author, -> (author_name) { where("author_name like ?", "%#{author_name}%")}
end
