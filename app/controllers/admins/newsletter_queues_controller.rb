class Admins::NewsletterQueuesController < Admins::BaseController
  before_action :set_newsletter_queue, only: [:show, :edit, :update, :destroy]

  # GET /newsletter_queues
  def index
    @newsletter_queues = NewsletterQueue.all
  end

  # GET /newsletter_queues/1
  def show
  end

  # GET /newsletter_queues/new
  def new
    @newsletter_queue = NewsletterQueue.new
  end

  # GET /newsletter_queues/1/edit
  def edit
  end

  # POST /newsletter_queues
  def create
    @newsletter_queue = NewsletterQueue.new(newsletter_queue_params)

    if @newsletter_queue.save
      redirect_to admins_newsletter_queues_path, notice: 'Newsletter queue was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /newsletter_queues/1
  def update
    if @newsletter_queue.update(newsletter_queue_params)
      redirect_to admins_newsletter_queues_path, notice: 'Newsletter queue was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /newsletter_queues/1
  def destroy
    @newsletter_queue.destroy
    redirect_to admins_newsletter_queues_path, notice: 'Newsletter queue was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter_queue
      @newsletter_queue = NewsletterQueue.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def newsletter_queue_params
      params.require(:newsletter_queue).permit(:subject, :content)
    end
end
