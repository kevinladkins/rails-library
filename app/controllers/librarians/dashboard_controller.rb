class Librarians::DashboardController < ApplicationController

before_action :authorize_user

  def index
    @loans = Loan.all
    @user = User.first
    @book = Book.first
  end

  def stats
    render json: {
        collection: {
            "All Books": Book.total_count.as_json, "On Loan": Loan.total_on_loan.as_json
        },
        users: {
          "All Users": User.total_count.as_json,
          "Active Users": User.active.as_json
        }
    }
  end

end
