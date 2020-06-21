10.times do 
Post.create(
    title: Faker::Quotes::Shakespeare.hamlet_quote,
    content: Faker::Lorem.sentence(word_count: 250),
    author_name: Faker::Internet.username,
    likes: rand(20)
)

Comment.create(
    content: Faker::Lorem.sentence(word_count: 150),
    name: Faker::Name.first_name,
    post: Post.all.sample

)

end