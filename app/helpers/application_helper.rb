module ApplicationHelper


  def generate_path(item)
    pluralize(2, item.class.name.downcase).split.last
  end

  def item_name(item)
    pluralize(2, item.class.name).split.last 
  end



end
