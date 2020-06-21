class CommentSerializer
    include FastJsonapi::ObjectSerializer
    attributes :content, :name, :created_at
  
    belongs_to :post
end