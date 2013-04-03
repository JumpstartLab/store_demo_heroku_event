class Mailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(to: user.email, subject: "Welcome to My Awesome Site")
  end

  def order_confirmation(user, order)
    @user = user
    @order = order
    mail(to: user.email, subject: "Thanks for your purchase!")
  end
end
