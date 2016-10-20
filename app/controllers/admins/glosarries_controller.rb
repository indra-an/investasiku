class Admins::GlosarriesController < Admins::BaseController
  before_action :set_glosarry, only: [:show, :edit, :update, :destroy]

  # GET /glosarries
  def index
    @glosarries = Glosarry.all.order('title ASC')
  end

  # GET /glosarries/1
  def show
  end

  # GET /glosarries/new
  def new
    @glosarry = Glosarry.new
  end

  # GET /glosarries/1/edit
  def edit
  end

  # POST /glosarries
  def create
    @glosarry = Glosarry.new(glosarry_params)

    if @glosarry.save
      redirect_to admins_glosarries_path, notice: 'Glosarry was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /glosarries/1
  def update
    if @glosarry.update(glosarry_params)
      redirect_to admins_glosarries_path, notice: 'Glosarry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /glosarries/1
  def destroy
    @glosarry.destroy
    redirect_to admins_glosarries_path, notice: 'Glosarry was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_glosarry
      @glosarry = Glosarry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def glosarry_params
      params.require(:glosarry).permit(:title, :description)
    end
end
