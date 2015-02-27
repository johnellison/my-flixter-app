class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    if current_course.premium?
      @amount = current_course.cost_in_cents

      customer = Stripe::Customer.create(
        :email => current_user.email,
        :card  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Flixter course #{current_course.title}',
        :currency    => 'usd'
      )
    end

    current_user.enrollments.create(course: current_course)
    redirect_to course_path(current_course)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to course_path(current_course)
  end

  private

  def current_course
    @course ||= Course.find(params[:course_id])
  end

end
