module BooksHelper

  def author_view?
    !!@author
  end


  def all_books
    alphabetize_by(@books, :title)
  end

	def fiction_books
	 classification_list(@books, "fiction", :title)
	end

	def non_fiction_books
		classification_list(@books, "non_fiction", :title)
	end


end
