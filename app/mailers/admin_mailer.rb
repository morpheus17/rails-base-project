class AdminMailer < Devise::Mailer
  default from: 'donotreplyburner@gmail.com'
  layout 'mailer'

  def new_user_waiting_for_approval(user)
    @email = user.email
    @username = user.username
    mail(to: @email, subject: 'Stock app account pending approval')
  end

  def new_user_approved(user)
    @email = user.email
    @username = user.username
    mail(to: @email, subject: 'Stock app account creation')
  end

  def broker_approved(user)
    @email = user.email
    @username = user.username
    mail(to: @email, subject: 'Stock app broker account approved')
  end

end