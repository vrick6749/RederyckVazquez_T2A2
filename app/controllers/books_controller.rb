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
        
    end

    def update

    end









    def destroy

    end


    private

    def book_params
        params.require(:book).permit(:title, :author_id, :price, :publisher_id, :genre, :picture)
    end


end