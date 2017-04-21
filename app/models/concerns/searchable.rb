module Searchable

  extend ActiveSupport::Concern

		module ClassMethods


			def title_search(query)
				if query.present?
					search = where('title like ?', "%#{query}")
					search.empty? ? self.find_each : search
				else
					self.find_each
				end
			end

			def name_search(query)
				if query.present?
					search = where('name like ?', "%#{query}")
					search.empty? ? self.find_each : search
				else
					self.find_each
				end
			end     

		end

end
