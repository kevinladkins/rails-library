module Searchable
  extend ActiveSupport::Concern

  module InstanceMethods

    def these_are_included
      "include Reservable::InstanceMethods"
    end

  end

  module ClassMethods

    def these_are_extended
        "extend Reservable::ClassMethods"
    end

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
