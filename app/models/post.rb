class Post < ApplicationRecord
    #has_many :comments

    validates :title, presence: true, uniqueness: true
    validates :content, presence: true, uniqueness: true
    validates :author_name, presence: true

    scope :author, -> (author_name) { where("author_name like ?", "%#{author_name}%")}


end
