# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Author.destroy_all      #
Book.destroy_all        #
BookGenre.destroy_all   #
Genre.destroy_all       #
UserProfile.destroy_all #
Review.destroy_all      #
ReviewedBook.destroy_all
UserBook.destroy_all

puts "Destroyed tables"

50.times do 
    UserProfile.create(
        name: Faker::Books::Dune.character,
        bio: Faker::Books::Dune.quote,
    )
end 

puts "Created UserProfile"

50.times do 
    Genre.create(
        genre_name: Faker::Book.genre
    )
end

puts "Created Genre"

50.times do
    Author.create(
        name: Faker::Book.author
    )
end 

puts "Created Author"

50.times do 
    Book.create(
        author_id: rand(1..49),
        title: Faker::Book.title,
        description: Faker::Movies::BackToTheFuture.quote,
        isbn: Faker::Number.number(digits: 13),
        img_url: "img_url"
    )
end 

puts "Created Book"

50.times do 
    BookGenre.create(
        genre_id: rand(1..49),
        book_id: rand(1..49)
    )
end 

puts "Created BookGenre"



50.times do
    UserBook.create(
        book_id: rand(1..49),
        user_profile_id: rand(1..49),
        status: "Want to Read"
    )
end 
puts "Created UserBook"

50.times do 
    Review.create(
        user_profile_id: rand(1..49),
        book_id: rand(1..49),
        rating: rand(1..5),
        title: Faker::Movies::BackToTheFuture.quote,
        comment: Faker::TvShows::Seinfeld.quote,
    )
end 

puts "Created Review"

50.times do 
    ReviewedBook.create(
        book_id: rand(1..49),
        review_id: rand(1..49)
    )
end 

puts "Created ReviewedBook"

puts "Success"