class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.join.subject
  #
  def join(*)
    @greeting = "Time to Travel!!!"
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Your travel tribe is getting bigger')
    # This will render a view in `app/views/user_mailer`!
  end
end

# join trip
# trip id / user id?