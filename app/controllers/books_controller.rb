class BooksController < ApplicationController

	# ham them moi va luu thong tin sach
  	def new

	  	@book = Book.new
	  	if params[:book]

	  		@book = Book.new(book_params)
	  		if @book.save

	  			flash[:success] = "Saved book!"
	  			redirect_to '/books'
	  		end
	  	end
  	end

  	# ham chinh sua sach
  	def edit

	  	@book = Book.find(params[:id])
	  	if params[:book]

	  		@book.update_attributes(book_params)
	      
	      	flash[:success] = "Updated book!"
	    else

	    	flash[:danger] = "Error. Please type again!"
	    end
  	end

	def view
		
	end

	def index
		@all = Book.all
	end

	def delete
		
	end

  	# nhung ham xai cho rieng controller nay
	private
		def book_params
		  params.require(:book).permit(:name, :description)
		end
end
