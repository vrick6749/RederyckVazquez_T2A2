class BooksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_author_genre_publisher, only: [:index, :new, :edit]
    before_action :set_user_books, only: [:destroy, :edit, :update]

    def index
        @books = Book.all
        
    end



    def show

        @book = Book.find(params[:id])
    
    end



    def new
        @book = Book.new

    end



    def edit
        

    end





    def create
        puts "*************************************************************"
        puts params
        puts "************************************************************"
        @book = current_user.books.create(book_params)
       
        most_recent_book = Book.last
        for genre in params["genre"]["genre_ids"] # you can remove genre_ids  but also need to remove from form
           
            most_recent_book.genres <<  Genre.find(genre)
        end
        redirect_to intro_path
    end

    def update
         
         @book.update(book_params)
         @book.genres = params["genre"]["genre_ids"].map { |genre_id| Genre.find(genre_id) }
         @book.save
          print "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"

          
         redirect_to intro_path

    end




    def destroy
        @book.destroy
        redirect_to intro_path
    end


    private

    def set_author_genre_publisher
        @publisher = Publisher.all
        @author = Author.all
        @genre = Genre.all
    end

    def set_user_books
        @book = current_user.books.find_by_id(params[:id])
        if @book == nil
            redirect_to intro_path

        end
    end
    def book_params
        params.require(:book).permit(:title, :author_id, :price, :publisher_id,:genre_id, :picture)
    end


end