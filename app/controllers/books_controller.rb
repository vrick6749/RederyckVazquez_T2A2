class BooksController < ApplicationController
    before_action :authenticate_user!

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
        @book = current_user.listings.create(book_params)
       
        most_recent_book = Book.last
        for genre in params["genre"]["genre_ids"] # you can remove genre_ids  but also need to remove from form
           
            most_recent_book.genres <<  Genre.find(genre)
        end
        redirect_to intro_path
    end

    def update
         book_to_edit=Book.find(params["id"])
         book_to_edit.update(book_params)
        #  book_to_edit.bookgenres.where(book_id: params["id"]).update(genre_id: )
         book_to_edit.genres = params["genre"]["genre_ids"].map { |genre_id| Genre.find(genre_id) }
         book_to_edit.save
          print "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"

          
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