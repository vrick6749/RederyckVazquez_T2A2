class BooksController < ApplicationController


    def index
        @books = Book.all
        @author = Author.all
        
    end



    def show

        @book = Book.find(params[:id])
        
    end




   # Genre.find_by_book_id(book.id)






    def new
        @book = Book.new
        @publisher = Publisher.all
        @author = Author.all
        @genre = Genre.all
    end



    def edit
        @book = Book.find(params[:id])
        @publisher = Publisher.all
        @author = Author.all
        @genre = Genre.all
    end





    def create
        puts "*************************************************************"
        puts params
        puts "************************************************************"
        Book.create(book_params)
        most_recent_book = Book.last
        for genre in params["genre"]["genre_ids"] # you can remove genre_ids  but also need to remove from form
           
            most_recent_book.genres <<  Genre.find(genre)
        end
        redirect_to intro_path
    end

    def update
         Book.update(params["id"], book_params)
         redirect_to intro_path

    end









    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to intro_path
    end


    private

    def book_params
        params.require(:book).permit(:title, :author_id, :price, :publisher_id,:genre_id, :picture)
    end


end