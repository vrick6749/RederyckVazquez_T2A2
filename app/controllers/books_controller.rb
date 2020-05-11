class BooksController < ApplicationController


    def index
        @books = Book.all
        @author = Author.all
    end



    def show

        @book = Book.find(params[:id])

    end











    def new
        @book = Book.new
        @publisher = Publisher.all
        @author = Author.all
    end



    def edit
        @publisher = Publisher.all
        @author = Author.all
    end





    def create
        Book.create(book_params)
        redirect_to intro_path
    end

    def update
        # Book.update()
    end









    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to intro_path
    end


    private

    def book_params
        params.require(:book).permit(:title, :author_id, :price, :publisher_id, :genre, :picture)
    end


end