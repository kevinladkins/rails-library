module BooksHelper
  
  def author_view?
    !!@author
  end
  
  def classification_list(object, classification)
    selected = object.select {|o| o.classification == classification}
    alphabetize_by(selected, :title)
  end
  
  


end
