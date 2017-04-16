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

  end

end
