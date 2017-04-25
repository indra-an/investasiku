class HomeController < ApplicationController
  before_action :set_preference
  before_action :set_latest_news, :except => [:index, :learning_module, :perform_search]
  before_action :set_banner_ad, :only => [:index, :learning_module]
  before_action :set_rectangle_ad, :except => [:index, :learning_module]

  def index
    @hot_news = @preference.news || News.last|| News.new
    @news = News.order(:created_at => :desc).limit(4)
    @tips = InvestmentTip.order(:created_at => :desc).limit(3)
    @glossaries = Glosarry.order(:created_at => :desc).limit(3)
  end

  def my_news
    @news = News.includes(:tags).by_tag(params[:tag])
                .search(params[:query]).order(:created_at => :desc)
                .page(params[:page]).per(10)
  end

  def glossary
    @word_indexes = [*('A'..'Z')]
    @glossaries = Glosarry.search(params[:query]).order(:title => :asc)
  end

  def investment_tips
    @tips = InvestmentTip.search(params[:query]).order(:created_at => :desc)
                         .page(params[:page]).per(10)
  end

  def learning_module
  end

  def news_view
    @news = News.includes(:tags).find_by_slug(params[:slug])
    raise ActiveRecord::RecordNotFound unless @news
    @related = News.find_related(@news).limit(3)
  end

  def investment_tips_view
    @tip = InvestmentTip.find_by_slug(params[:slug])
    raise ActiveRecord::RecordNotFound unless @tip
  end

  def perform_search
    @news = News.search(params[:query]).order(:created_at => :desc)
    @news_count = @news.count
    @news = @news.limit(5)

    @tips = InvestmentTip.search(params[:query]).order(:created_at => :desc)
    @tips_count = @tips.count
    @tips = @tips.limit(5)

    @glossaries = Glosarry.search(params[:query]).order(:title => :asc)
    @glossaries_count = @glossaries.count
    @glossaries = @glossaries.limit(5)

    @total_count = @news_count + @tips_count + @glossaries_count
  end

  def contact_us
  end

  def send_contact
    if verify_recaptcha
      full_name = params[:name]
      email = params[:email]
      message = params[:message].class.eql?(Array) ? params[:message].first : params[:message]
      subscribe = params[:subscribe].to_i
      contact = Contact.find_or_initialize_by(:email => email)

      if contact.new_record?
        ApplicationMailer.contact_us(params).deliver_now
        contact.name = full_name
        contact.message = message
        contact.is_subscribed = subscribe.eql?(1)
        contact.save
      end
    end

    redirect_to :back
  end

  def team
  end

  def terms
  end

  def about_us
  end

  private

    def set_latest_news
      @latest_news = News.order(:created_at => :desc).limit(4)
    end

    def set_preference
      @preference = Preference.fetch || Preference.new
    end

    def set_banner_ad
      @ad_code = @preference.banner_ad_script
    end

    def set_rectangle_ad
      @ad_code = @preference.sidebar_ad_script
    end
end
