module ApplicationHelper


  def generate_path(item)
    item.class.name.downcase + "s"
  end

  def item_name(item)
    item.class.name + "s"
  end



end
