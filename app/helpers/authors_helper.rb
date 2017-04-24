module AuthorsHelper

  def authors_for_selection
		authors = Author.find_each
		selection = alphabetize_by(authors, :last_name)
  end
  
  def alphabetized_authors(authors)
		selection = alphabetize_by(authors, :last_name)
  end
  
  

end

