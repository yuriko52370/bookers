class BooksController < ApplicationController


  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "Book was successfully created."
      redirect_to '/books'
    else
      flash.now[:alert] = "Book could not be created."
      render :index
    end
  end


  def show
  @book = Book.find(params[:id])


  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "Book was successfully updated."
     redirect_to book_path(book.id)
    else
      flash.now[:alert]= "Book could not be updated."
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
