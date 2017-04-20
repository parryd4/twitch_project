----
Thursday

def average_rating
  self.reviews.average(:rating).to_f

def num_reviews
  self.reviews.count





-----
Wednesday

1. Put default data into database so that when app loads, can show user info

2. if user makes search and no results, go to API to see if any results are there

# Express mode : top 1k games, channels, videos?

command line command to seed data
# rake db:seeds -- loads data from db/seeds.rb

lib/adapters - classes that seed file can use, ex: GoogleBooks
with method: set_default-items,
  reponse = RestClient.get(url)
  book_data = JSON.parse(response)

  book_data['info'] each do |book_info|
    binding.pry # to explore hashes

    book = new book title/info
    author = Author.find_or_create_by(name: bookinfo)
    book.author = author
    book.save
    could break GoogleBooks up into #response_data, #books can call response data, set_default_items
