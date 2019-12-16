class CheckoutsController < ApplicationController
  before_action :logged_in_user

  def create
    @checkout = Checkout.new(book_id: checkout_params[:book_id], user: current_user)
    if @checkout.save
      flash[:success] = "Checked out this Book!"
      redirect_to user_path(current_user)
    else
      render books_path(checkout_params[:book_id])
    end
  end

  def destroy
    @checkout = Checkout.find_by(params[:id])
    @checkout.destroy
    flash[:success] = "Book returned"
    redirect_to user_path
  end

  private

  #before filters
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def checkout_params
    params.permit(:book_id)
  end

end
