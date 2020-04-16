# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'json'

require 'faker'

# Author.destroy_all            
# Book.destroy_all              
# BookGenre.destroy_all   
# Genre.destroy_all       
# UserProfile.destroy_all 
# Review.destroy_all      
# ReviewedBook.destroy_all
# UserBook.destroy_all

# puts "Destroyed tables"

# ! - how to use -
# ! - rails db:drop
# ! - rails db:migrate
# ! - rails db:seed
# ! - the seed file has a good chance of crashing, just keep rerunning the seed file
# ! - to keep populating with books


50.times do 
    url = RestClient.get("https://www.googleapis.com/books/v1/volumes?q=#{Faker::Book.title}")
    book_title_parse = JSON.parse(url)
    
    puts "Found a new book..."
    
    book_title = book_title_parse["items"][0]["volumeInfo"]["title"]
    puts "book_title is #{book_title}"
    book_author = book_title_parse["items"][0]["volumeInfo"]["authors"][0]
    puts "book_author is #{book_author}"
    book_description = book_title_parse["items"][0]["volumeInfo"]["description"]
    puts "Book_description was here"
    book_isbn = book_title_parse["items"][0]["volumeInfo"]["industryIdentifiers"][1]["identifier"]
    puts "Book_isbn is #{book_isbn}"
    book_genre = book_title_parse["items"][0]["volumeInfo"]["categories"][0]
    puts "book_genre is #{book_genre}"
    book_url = book_title_parse["items"][0]["volumeInfo"]["imageLinks"]["thumbnail"]
    puts "book_url was here"
    
    Author.create(name: book_author)
    puts "Author created"
    
    author_row = Author.find_by(name: book_author)
    Book.create(author_id: author_row.id, title: book_title, description: book_description, isbn: book_isbn, img_url: book_url)
    
    puts "Book created"
    
    Genre.create(genre_name: book_genre)
    
    puts "Genre created"
    
    book_row = Book.find_by(title: book_title)
    genre_row = Genre.find_by(genre_name: book_genre)
    BookGenre.create(book_id: book_row.id, genre_id: genre_row.id)
    
    puts "Book Genre Created"
end 


# 15.times do 
#     UserProfile.create(
#         name: Faker::Books::Dune.character,
#         bio: Faker::Books::Dune.quote,
#     )
# end 

# puts "Created 15 users"


# 50.times do 
#     UserProfile.create(
#         name: Faker::Books::Dune.character,
#         bio: Faker::Books::Dune.quote,
#     )
# end 

# puts "Created UserProfile"

# 50.times do 
#     Genre.create(
#         genre_name: Faker::Book.genre
#     )
# end

# puts "Created Genre"

# 50.times do
#     Author.create(
#         name: Faker::Book.author
#     )
# end 

# puts "Created Author"

# 50.times do 
#     Book.create(
#         # book_genre_id: rand(1..49),
#         author_id: rand(1..49),
#         title: Faker::Book.title,
#         description: Faker::Movies::BackToTheFuture.quote,
#         isbn: Faker::Number.number(digits: 13),
#         img_url: "img_url"
#     )
# end 

# puts "Created Book"

# 50.times do 
#     BookGenre.create(
#         genre_id: rand(1..49),
#         book_id: rand(1..49)
#     )
# end 

# puts "Created BookGenre"



# 50.times do
#     UserBook.create(
#         book_id: rand(1..49),
#         user_profile_id: rand(1..49),
#         status: "Want to Read"
#     )
# end 
# puts "Created UserBook"

# 50.times do 
#     Review.create(
#         user_profile_id: rand(1..49),
#         book_id: rand(1..49),
#         rating: rand(1..5),
#         title: Faker::Movies::BackToTheFuture.quote,
#         comment: Faker::TvShows::Seinfeld.quote,
#     )
# end 

# puts "Created Review"

# 50.times do 
#     ReviewedBook.create(
#         book_id: rand(1..49),
#         review_id: rand(1..49)
#     )
# end 

# puts "Created ReviewedBook"

# puts "Success"