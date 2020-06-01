class BooksController < ApplicationController
 
  # GET /books
  # GET /books.json
  def index
    @book = Book.new
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
     @book = Book.find(params[:id])
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

   # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
      @book = Book.find(params[:id])
      if@book.update(book_params)
        redirect_to book_path, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end
  # POST /books
  # POST /books.json
  def create
       @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      @books = Book.all
      render :index
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
