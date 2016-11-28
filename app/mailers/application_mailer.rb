class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def contact_us(params = {})
    @name = params[:name]
    @email = params[:email]
    @content = params[:content]
    mail(to: 'web.investasiku@gmail.com', subject: '[New Contact] ' + @name)
  end
end
