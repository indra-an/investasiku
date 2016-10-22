class Admins::NewsController < Admins::BaseController
  before_action :load_tags, except: [:index, :show, :delete]
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  # GET /news
  def index
    @news = News.all
  end

  # GET /news/1
  def show
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  def create
    @news = News.new(news_params)

    if @news.save
      redirect_to admins_news_index_path, notice: 'News was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /news/1
  def update
    if @news.update(news_params)
      redirect_to admins_news_index_path, notice: 'News was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /news/1
  def destroy
    @news.destroy
    redirect_to admins_news_index_path, notice: 'News was successfully destroyed.'
  end

  private
    def load_tags
      @tags = Tag.select(:id, :name).collect { |tag| [tag.name, tag.id] }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def news_params
      params[:news][:posted_by_id] = current_admin.id
      params[:news][:custom_posted_by] = nil if  params[:news][:custom_posted_by].blank?
      params.require(:news).permit(:title, :content, :image, :posted_by_id,
                                   :custom_posted_by, :tag_ids => [])
    end
end
