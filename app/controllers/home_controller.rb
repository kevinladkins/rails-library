class HomeController < ApplicationController

 def index
   @book = Book.first
   @author = Author.first
 end

end
