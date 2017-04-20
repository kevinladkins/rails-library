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
  
  def classification_list(object, classification)
    selected = object.select {|o| o.classification = classification}
  end




end
