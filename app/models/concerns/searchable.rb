module Searchable
  extend ActiveSupport::Concern



  module ClassMethods


    def title_search(query)
      if query.present?
        search = where('title like ?', "%#{query}")
        search.empty? ? self.all : search
      else
        self.all
      end
    end

    def name_search(query)
      if query.present?
        search = where('name like ?', "%#{query}")
        search.empty? ? self.all : search
      else
        self.all
      end
    end
    
        

  end

end
