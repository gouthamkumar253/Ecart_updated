class Comment < ApplicationRecord
	belongs_to :instrument , optional: true 
end
