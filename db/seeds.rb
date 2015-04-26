require 'faker'

 #Create Posts
 50.times do 
   Post.create!(
     title: Faker::Lorem.sentence,
     body:  Faker::Lorem.paragraph
   )
 end
posts = Post.all

#Create Comments
 100.times do 
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

if Post.where("title = 'This newer title'") == []
  post_custom = Post.create!(title: "This newer title", body: "More unique still.")  
end

if Comment.where("body = 'Like Nicki Minaj'") == []
  Comment.create!(post: post_custom, body: "Like Nicki Minaj")
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"