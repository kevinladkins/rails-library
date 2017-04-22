# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project 
  
		=> Done.
  

- [X] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
  
		=> Author has_many Books


- [X] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  
		=> Book belongs_to Author


- [X] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
   
		 => Book has_many borrowers (Users) through Loans; Users have_many borrowed_books (Books) through Loans; Books have_many Categories through BookCategories; Categories have_many Books through BookCategories
   


- [X] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)

		=> book.categories; new Category for Book submittable at books/:id/categories/new
  
  

- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

	 => User, Book, Category, Author, Loan
 
   

- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

	 => Book.most_borrowed, viewable at books/most_borrowed
 

- [X] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)

	 => books/new, Category & Author
 

- [X] Include signup (how e.g. Devise)

	 => /signup (GET users#new, POST users#create, custom logic)
 
 

- [X] Include login (how e.g. Devise)

	 => /login (GET sessions#new, POST sessions#create, custom logic)
 
 
 
- [X] Include logout (how e.g. Devise)

	 => /logout (DELETE sessions#destroy, custom logic)
 
 

- [X] Include third party signup/login (how e.g. Devise/OmniAuth)

	 => Facebook login at /auth/facebook via OmniAuth
	 
	 

- [X] Include nested resource show or index (URL e.g. users/2/recipes)

	 =>  authors/:id/books, authors/:id/books/:id, 



- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients)

 => authors/:id/books/new, books/:id/categories/new
 
 

- [X] Include form display of validation errors (form URL e.g. /recipes/new)

  => /books/new, /books/:id/categories/new, /signup 

Confirm:
- [X] The application is pretty DRY
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate
