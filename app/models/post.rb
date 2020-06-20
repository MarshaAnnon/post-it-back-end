class Post < ApplicationRecord
    #has_many :comments

    validates :title, presence: true, unique: true
    validates :content, presence: true, unique: true
    validates :author_name, presence: true
end
