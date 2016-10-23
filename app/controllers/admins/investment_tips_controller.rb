class Admins::InvestmentTipsController < Admins::BaseController
  before_action :set_investment_tip, only: [:show, :edit, :update, :destroy]

  # GET /investment_tips
  def index
    @investment_tips = InvestmentTip.all
  end

  # GET /investment_tips/1
  def show
  end

  # GET /investment_tips/new
  def new
    @investment_tip = InvestmentTip.new
  end

  # GET /investment_tips/1/edit
  def edit
  end

  # POST /investment_tips
  def create
    @investment_tip = InvestmentTip.new(investment_tip_params)

    if @investment_tip.save
      redirect_to admins_investment_tips_path, notice: 'Investment tip was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /investment_tips/1
  def update
    if @investment_tip.update(investment_tip_params)
      redirect_to admins_investment_tips_path, notice: 'Investment tip was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /investment_tips/1
  def destroy
    @investment_tip.destroy
    redirect_to admins_investment_tips_path, notice: 'Investment tip was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investment_tip
      @investment_tip = InvestmentTip.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def investment_tip_params
      params[:investment_tip][:posted_by_id] = current_admin.id
      params[:investment_tip][:custom_posted_by] = nil if params[:investment_tip][:custom_posted_by].blank?
      params.require(:investment_tip).permit(:title, :content, :posted_by_id, :custom_posted_by)
    end
end
