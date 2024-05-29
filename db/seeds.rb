# frozen_string_literal: true

require 'csv'

# total_books = `wc -l db/books_1.Best_Books_Ever.csv`.to_i
total_books = 10_000
puts "Total books: #{total_books}"

count = 0

CSV.foreach('db/books_1.Best_Books_Ever.csv', headers: true) do |row|
  next unless row['language'] == 'English'
  next if row['isbn'] == '9999999999999'

  begin
    publish_date = Date.strptime(row['publishDate'], '%m/%d/%y')
  rescue Date::Error
    publish_date = nil
  end

  book = Book.create(
    title: row['title'],
    series: row['series'],
    author: row['author'],
    description: row['description'],
    language: row['language'],
    rating: row['rating'],
    isbn: row['isbn'],
    page: row['pages'],
    publish_date: publish_date,
    cover_url: row['coverImg']
  )
  next unless book.persisted?

  genres = eval(row['genres'])
  book_genres = genres.map do |genre|
    Genre.find_or_create_by!(label: genre)
  end

  book.genres << book_genres
  book.save!

  count += 1
  print "\r#{(count * 100 / total_books.to_f).round(2)}%"
  break if count >= 10_000
end

puts "\n#{Book.count} books created."
