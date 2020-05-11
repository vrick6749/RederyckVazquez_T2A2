
for i in 1..10

    Author.create(
    name:Faker::Book.author,
    biography:Faker::Lorem.sentence(word_count: 25)
    )


end

for i in 1..20
    Publisher.create(
        name:Faker::Book.publisher,
        details:Faker::Lorem.sentence(word_count: 15)
    )
end

for i in 1..15

    Genre.create(
        name:Faker::Book.genre
    )


end

