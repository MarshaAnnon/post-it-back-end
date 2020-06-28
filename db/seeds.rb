10.times do 
    Post.create(
        title: Faker::Quote.robin,
        content: Faker::Quotes::Shakespeare.hamlet_quote,
        author_name: Faker::Internet.username,
        likes: rand(20)
    )
    
    Comment.create(
        content: Faker::Quote.matz,
        name: Faker::Name.first_name,
        post: Post.all.sample
    
    )
end
   