module ApplicationHelper

  	def cart_count_over_one
    	if @cart.line_items.count > 0
      		return "<span class='tag is-dark'>#{@cart.line_items.count}</span>".html_safe
    	end
  	end

  	def cart_has_items
      return @cart.line_items.count > 0
  	end

  	def show_comments(id)
  	
		#@instrument=Instrument.find_by(id: id)
		@comment= Comment.where(instrument_id: id).all
		return @comment			
	end
	
	def has_comments(id)
		@comment= Comment.where(instrument_id: id).all
		if(@comment.count > 0)
			return true
		end		
	end

end
