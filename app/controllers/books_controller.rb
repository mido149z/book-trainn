class BooksController < ApplicationController
	before_action :loginned, only: [:new, :edit, :index, :delete, :drop, :view]

	# ham them moi va luu thong tin sach
  	def new

	  	@book = Book.new
	  	if params[:book]

	  		@book = Book.new(book_params)

	  		# lay id nguoi dang logi ngan vao owner_id de xac nhan chinh chu
	  		@book[:owner_id] = current_user.id
	  		if @book.save

	  			flash[:success] = "Saved book!"
	  			redirect_to '/books'
	  		end
	  	end
  	end

  	# ham chinh sua sach
  	def edit

	  	@book = Book.find(params[:id])

	  	# check quyen xem 
  		check_view(@book)

	  	if params[:book]

	  		@book.update_attributes(book_params)
	      
	      	flash[:success] = "Updated book!"
	    end
  	end

	def view
		@book = Book.find(params[:id])

		# check quyen xem 
  		check_view(@book)
	end

	def index

		# them dieu kien de duoc xem
		if current_user.admin
			@books = Book.paginate(page: params[:page], :per_page => 10)
		else
			@books = Book.where(owner_id: current_user.id).paginate(page: params[:page], :per_page => 10)
		end
	end

	# xoa tung record book
	def delete
		Book.find(params[:id]).destroy
		flash[:success] = "Deleted book!"
		redirect_to '/books'
	end

	# xoa het bang book
	def drop
		Book.delete_all
		flash[:success] = "Deleted table book!"
		redirect_to '/books'
	end

	# chan truy cap
	def loginned
		unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
	end

	# owner?
	def check_view(book)

		if !current_user.admin && book.owner_id != current_user.id

			flash[:danger] = "Don't see this book!"
			redirect_to '/books'
		end
	end

  	# nhung ham xai cho rieng controller nay
	private
		def book_params

			params.require(:book).permit(:name, :description)
		end
end
