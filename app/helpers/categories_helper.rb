module CategoriesHelper

  def categories_for_selection
   categories = Category.find_each
   selection = alphabetize_by(categories, :name)
  end
  
  def fiction_categories
    classification_list(@categories, "fiction", :name)
  end
  
  def non_fiction_categories
    classification_list(@categories, "non_fiction", :name)
  end


end