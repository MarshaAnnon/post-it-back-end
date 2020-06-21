class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :content, :author_name, :likes, :created_at

  has_many :comments
end
