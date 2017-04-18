# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def make_seeds
  make_users
  make_categories
  make_authors
end


def make_users
  [
    {name: "Kevin Adkins", email: "kevinladkins@gmail.com", password: "umbrasprite", role: "librarian"},
    {name: "Lorna Adkins", email: "ladkins@gmail.com", password: "ladkins1", role: "librarian"},
    {name: "Marissa Saam", email: "msaam@gmail.com", password: "msaam1", role: "librarian"},
    {name: "Chris Fowler", email: "cfowler@gmail.com", password: "cfowler1", role: "patron"},
    {name: "Martin Winslow", email: "mwinslow@gmail.com", password: "mwinslow1", role: "patron"},
    {name: "Katie Foster", email: "kfoster@gmail.com", password: "kfoster1", role: "patron"},
    {name: "Hayley Dier", email: "hdier@gmail.com", password: "hdier1", role: "patron"}
  ].each do |user_hash|
    User.create(user_hash)
  end
end

def make_categories
  [
    {classification: "fiction", name: "Space Opera"},
    {classification: "fiction", name: "Military Sci-Fi"},
    {classification: "fiction", name:  "Postmodern"},
    {classification: "non_fiction", name: "Computer Programming"},
    {classification: "non_fiction", name: "History"},
    {classification: "non_fiction", name: "Music Criticism"}
  ].each do |category_hash|
    Category.create(category_hash)
  end
end

def make_authors
  [
    {name: "Iain M Banks", born: '1954-02-19', died: '2013-06-09'},
    {name: "Robert Heinlein", born: '1954-02-19', died: '1988-05-08'},
    {name: "Marjin Haverbeke"},
    {name: "Simon Reynolds", born: '1963-06-19'},
    {name: "Thomas Ligotti", born: '1953-07-09'},
    {name: "Rick Perlstein", born: '1969-09-03'}

  ].each do |authors_hash|
    Author.create(authors_hash)
  end
end


make_seeds
