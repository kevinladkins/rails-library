module CategoriesHelper

  def categories_for_selection
   categories = Category.find_each
   selection = alphabetize_by(categories, :name)
  end


end