class Admins::LearningModulesController < Admins::BaseController
  before_action :set_learning_module, only: [:show, :edit, :update, :destroy]

  # GET /learning_modules
  def index
    @learning_modules = LearningModule.all
  end

  # GET /learning_modules/1
  def show
  end

  # GET /learning_modules/new
  def new
    @learning_module = LearningModule.new
  end

  # GET /learning_modules/1/edit
  def edit
  end

  # POST /learning_modules
  def create
    @learning_module = LearningModule.new(learning_module_params)

    if @learning_module.save
      redirect_to admins_learning_modules_path, notice: 'Learning module was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /learning_modules/1
  def update
    if @learning_module.update(learning_module_params)
      redirect_to admins_learning_modules_path, notice: 'Learning module was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /learning_modules/1
  def destroy
    @learning_module.destroy
    redirect_to admins_learning_modules_path, notice: 'Learning module was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning_module
      @learning_module = LearningModule.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def learning_module_params
      params[:learning_module][:posted_by_id] = current_admin.id
      params[:learning_module][:custom_posted_by] = nil if params[:learning_module][:custom_posted_by].blank?
      params.require(:learning_module).permit(:title, :content, :posted_by_id, :custom_posted_by)
    end
end
