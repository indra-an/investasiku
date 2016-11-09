class HomeController < ApplicationController
  before_action :set_preference
  before_action :set_latest_news, :except => [:index, :learning_module, :perform_search]

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
    @word_indexes = Glosarry.word_indexes
    @glossaries = Glosarry.search(params[:query]).order(:title => :asc)
                          .page(params[:page]).per(10)
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
  end

  private

    def set_latest_news
      @latest_news = News.order(:created_at => :desc).limit(4)
    end

    def set_preference
      @preference = Preference.fetch || Preference.new
    end
end
