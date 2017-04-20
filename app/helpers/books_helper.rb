module BooksHelper
  
  def author_view?
    !!@author
  end
  
  def classification_list(object, classification)
    selected = object.select {|o| o.classification == classification}
    alphabetized = sort_by_attribute(selected, "title")
    alphabetized
  end
  
  


end
