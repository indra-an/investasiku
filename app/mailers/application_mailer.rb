class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@investasi-ku.com'
  layout 'mailer'

  def contact_us(params = {})
    @name = params[:name]
    @email = params[:email]
    @content = params[:message].class.eql?(Array) ? params[:message].first : params[:message]
    mail(to: 'web.investasiku@gmail.com', subject: '[New Contact] ' + @name)
  end

  def newsletter(contact, newsletter)
    @contact = contact
    @content = newsletter.content
    mail(to: contact.email, subject: newsletter.subject)
  end
end
