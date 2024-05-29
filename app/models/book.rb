class Book < ApplicationRecord
  has_many :books_genres, dependent: :delete_all
  has_many :genres, through: :books_genres
  has_one :book_embedding, dependent: :destroy

  validates :isbn, presence: true, uniqueness: true

  before_create do
    genres_string = genres.map(&:label).sort.join(',')
    string = <<-STRING
title: #{title} 
author: #{author} 
series: #{series}
description: #{description}
genres: #{genres_string}
    STRING

    body = {
      inputs: string,
      truncate: true
    }
    response = Faraday.post('http://localhost:8080/embed', body.to_json, 'Content-Type' => 'application/json')
    embedding = JSON.parse(response.body).first
    build_book_embedding(embedding: embedding)
  end
end
