module AuthorsHelper

  def authors_for_selection
		authors = Author.find_each
		selection = alphabetize_by(authors, :name)
  end

end