class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@investasi-ku.com'
  layout 'mailer'

  def contact_us(params = {})
    @name = params[:name]
    @email = params[:email]
    @content = params[:message].class.eql?(Array) ? params[:message].first : params[:message]
    mail(to: 'admin@investasi-ku.com', subject: '[New Contact] ' + @name)
  end

  def newsletter(contact, newsletter)
    @contact = contact
    @content = newsletter.content
    @today = DateTime.now.strftime("%d %B %Y")

    @glossaries = Glosarry.where('DATE(glosarries.created_at) = ?', Date.today)
    @glossaries = Glosarry.order(:id => :desc).limit(2) if @glossaries.blank?

    @news = News.where('DATE(news.created_at) BETWEEN ? AND ?', Date.today.at_beginning_of_week, Date.today.at_end_of_week)
    @news = News.order(:id => :desc).limit(2) if @news.blank?

    @tips = InvestmentTip.order(:id => :desc).limit(2)

    @facebook_url = Preference.fetch.facebook_link
    @contact_token = Digest::MD5.hexdigest(@contact.created_at.to_i.to_s)

    mail(to: contact.email, subject: newsletter.subject)
  end
end
