class CommentsController < ApplicationController
before_action :set_id

	def set_id
		@id= params[:instrument_id]
	end 

	def show
		instrument=Instrument.find(params[:instrument_id])
		@comment = instrument.comments.all.order("created_at desc")
	end



	def new
		@comment=Comment.new 
		@id= params[:instrument_id]
	end

	def create

		instrument=Instrument.find(params[:instrument_id])

    @comment = instrument.comments.build(comment_params)
    #nil.check
    respond_to do |format|
      if @comment.save
        format.html { redirect_to instruments_path, notice: 'Comment was successfully posted.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      		end
    	end
	end
	def comment_params
      params.require(:comment).permit(:username,:comment)
	end
end
