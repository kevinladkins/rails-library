# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements

See files in "/app/assets/javascripts" for jQuery implementation.


- [X] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.

Categories#show allows users to view the next category's Show page (in alphabetical order) via a jQuery AJAX request that generates a new Category javascript model for each page.


- [X] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.

The books#index page uses jQuery AJAX request to retrieve serialized Book objects and instantiate Javascript Book models to display index of books according to selected filter ("fiction", "non-fiction", or "most-borrowed").


-  [X] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.

The authors#show view allows users to display all books by the author via a jQuery AJAX request (:author has_many :books).


- [X] Use your Rails API and a form to create a resource and render the response without a page refresh.

Books#show allows users (in Librarian role) to add a new category to a book, which is then posted to books/:id/categories via AJAX request and rendered on the books#wshow page without reloading page.


- [X] Translate JSON responses into js model objects.

See book.js, author.js, and category.js in "/app/assets/javascripts".


- [X] At least one of the js model objects must have at least one method added by your code to the prototype.

See book.js (Book.listBook()) and category.js (Category.showPage(), Category.listBook(), Category.displayBookCategory()).


Confirm
## I made a large error with my commits; apparently, when I moved from the Learn IDE to a local environment, I failed to properly set up my GitHub username. Consequentially, the first 40+ commits on this leg of the project appear as anonymous commits by "github username" (the default for commits without a valid username). I reset my username as soon as I realized the error, but there seems to be no way to retroactively establish that the previous commits were made by me. I did record a 40-minute coding session during my work, so perhaps that can help to establish that these commits were in fact done by me. ##

- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message
