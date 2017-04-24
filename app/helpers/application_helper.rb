module ApplicationHelper


  def generate_path_name(item)
    pluralize(2, item.class.name.downcase).split.last
  end

  def item_name(item)
    pluralize(2, item.class.name).split.last 
  end
  
  def librarian?
    !!logged_in? && !!current_user.librarian?
  end
  
  def patron?
     !!logged_in? && !!current_user.patron?
  end
  
  def alphabetize_by(collection, attribute)
    collection.sort_by &attribute.to_sym
  end
  
  def classification_list(object, classification, attribute)
    selected = object.select {|o| o.classification == classification}
    alphabetize_by(selected, attribute)
  end
  
  def alphabetized_by_last_name(collection)
		selection = alphabetize_by(collection, :last_name)
  end
  
  




end
