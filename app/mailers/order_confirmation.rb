class OrderConfirmation < ActionMailer::Base
  default from: "from@example.com"
  def notification(user)
    recipients "#{user.display_name} <#{user.email}>"
    from       "Frank's Monsterporium"
    subject    "Thanks for your order!"
    sent_on    Time.now
    body       { :user => user }
  end
end
