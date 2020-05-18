class BooksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_author_genre_publisher, only: [:index, :new, :edit]
    before_action :set_user_books, only: [:destroy, :edit, :update]

    def index

        @books = Book.all
        
    end



    def show
        @book = Book.find(params[:id])
        @book.price = @book.price.to_i
            session = Stripe::Checkout::Session.create(
                payment_method_types: ['card'],
                customer_email: current_user.email,
                line_items: [{
                    name: @book.title,
                    amount: @book.price * 100,
                    currency: 'aud',
                    quantity: 1,
                }],
                payment_intent_data: {
                    metadata: {
                        user_id: current_user.id,
                        book_id: @book.id
                    }
                },
                success_url: "#{root_url}payments/success?userId=#{current_user.id}&bookId=#{@book.id}",
                cancel_url: "#{root_url}books"
            )
        
            @session_id = session.id
        
    
    end



    def new
        
        @book = Book.new

    end



    def edit
        

    end





    def create

        @book = current_user.books.create(book_params)

        if @book.errors.any?
            set_author_genre_publisher
            render "new"
        else


            puts @book.errors.full_messages
            most_recent_book = Book.last
                    for genre in params["genre"]["genre_ids"] # you can remove genre_ids  but also need to remove from form
                        most_recent_book.genres <<  Genre.find(genre)
                    end
            redirect_to intro_path
        end
    end

    def update
         
         @book.update(book_params)
         @book.genres = params["genre"]["genre_ids"].map { |genre_id| Genre.find(genre_id) }
         @book.save
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