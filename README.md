# README


##### RUBY VERSION 2.4.1 ####

##### RAILS VERSION 5.0.2 #####

#### REQUIRED GEMS: ######

- bcrypt
- omniauth
- omniauth-facebook
- active_model_serializers

###SETUP####

Fork and clone this repository, then run 'bundle install' and 'rails db:migrate'.

#####OVERVIEW######

Rails Library provides a user interface for accessing and managing a library collection.

Visitors can view the library's collection by title, author, or category.

Users registered as "patrons" can check out and return books.

Users registered as "librarians" can add and edit books, authors, and categories, as well as adding additional copies of books already in the collection. The librarian home page (librarians/dashbord) provides an overview of all currently checked-out books, with overdue books displayed at top.

Librarians can extend patron loans via the patron's home page (at users/:id), and can also delete patron accounts.
