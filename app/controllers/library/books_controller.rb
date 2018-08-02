class Library::BooksController < ApplicationController
  before_action :set_library_book, only: [:show, :borrow_book, :return_book]
  before_action :set_user_library_book, only: [:edit, :update, :destroy]


  # GET /library/books
  # GET /library/books.json
  def index
    @library_books = Library::Book.all.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /library/books/1
  # GET /library/books/1.json
  def show
  end

  # GET /library/books/new
  def new
    @library_book = current_user.books.new
  end

  # GET /library/books/1/edit
  def edit
  end

  # POST /library/books
  # POST /library/books.json
  def create
    @library_book = current_user.books.new(library_book_params)

    respond_to do |format|
      if @library_book.save
        format.html { redirect_to @library_book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @library_book }
      else
        format.html { render :new }
        format.json { render json: @library_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /library/books/1
  # PATCH/PUT /library/books/1.json
  def update
    respond_to do |format|
      if @library_book.update(library_book_params)
        format.html { redirect_to @library_book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @library_book }
      else
        format.html { render :edit }
        format.json { render json: @library_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /library/books/1
  # DELETE /library/books/1.json
  def destroy
    @library_book.destroy
    respond_to do |format|
      format.html { redirect_to library_books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def borrow_book

    if @library_book.available?

      borrow = current_user.borrows.new(book_id: @library_book.id, borrow_date: DateTime.now())

      if borrow.save
        @library_book.borrow!
        redirect_to @library_book, notice: 'Książka została wypożyczona'
      else
        redirect_to library_books_url, alert: 'Wystąpił nieoczekiwany błąd.'
      end
    else
      redirect_to library_books_url, alert: 'Książka niedostępna.'
    end


  end

  def return_book

    if @library_book.borrowed?

      borrow = current_user.borrows.find_by_book_id(@library_book.id)

      if borrow.update({:draw_date => DateTime.now()})
        @library_book.return!
        redirect_to @library_book, notice: 'Książka została zwrócona'
      else
        redirect_to library_books_url, alert: 'Wystąpił nieoczekiwany błąd.'
      end
    else
      redirect_to library_books_url, alert: 'Książka jest dostępna do wypożyczenia.'
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library_book
      @library_book = Library::Book.find(params[:id])
    end

    def set_user_library_book
      @library_book = current_user.books.find_by_id(params[:id])
      return head 404 if @library_book.blank?
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def library_book_params
      params.require(:library_book).permit(:name, :lead, :is_active)
    end
end
