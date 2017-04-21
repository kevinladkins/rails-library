module Namable
  
	extend ActiveSupport::Concern

		module InstanceMethods

			def alphabetized_name
				self.last_name + ", " + self.first_name
			end

			def set_name
				self.name = self.first_name + " " + self.last_name
			end

		end
  
end