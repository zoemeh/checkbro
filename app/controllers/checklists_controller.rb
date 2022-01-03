class ChecklistsController < ApplicationController
  before_action :set_checklist, only: %i[ show edit update destroy]

  # GET /checklists or /checklists.json
  def index
    @checklists = Checklist.order(:id)
  end

  # GET /checklists/1 or /checklists/1.json
  def show
  end

  # GET /checklists/new
  def new
    @checklist = Checklist.new
  end

  # GET /checklists/1/edit
  def edit
  end

  # POST /checklists or /checklists.json
  def create
    @checklist = Checklist.new(checklist_params)

    respond_to do |format|
      if @checklist.save
        format.html { redirect_to checklist_url(@checklist), notice: "Checklist was successfully created." }
        format.json { render :show, status: :created, location: @checklist }
        format.turbo_stream { render layout: false}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_item
    @checklist = Checklist.find(params[:checklist_id])
    respond_to do |format|
      item = ChecklistItem.create(description: "", checklist: @checklist)
      format.turbo_stream do
        render turbo_stream: turbo_stream.append(:checklist_items,
                                                 Checklist::ItemComponent.new(checklist_item: item).render_in(view_context))
      end
    end
  end
  # GET /
  def edit_title
    @checklist = Checklist.find(params[:checklist_id])
    respond_to do |format|
      format.html {}
      format.turbo_stream do
        rendered_component = Checklist::EditTitleComponent.new(checklist: @checklist).render_in(view_context)
        render turbo_stream: turbo_stream.update(:checklist_title, rendered_component)
      end
    end
  end

  def update_title
    @checklist = Checklist.find(params[:checklist_id])
    respond_to do |format|
      if @checklist.update(checklist_params)
        format.turbo_stream { render layout: false }
      else

      end
    end
  end

  # PATCH/PUT /checklists/1 or /checklists/1.json
  def update
    respond_to do |format|
      if @checklist.update(checklist_params)
        format.html { redirect_to checklist_url(@checklist), notice: "Checklist was successfully updated." }
        format.json { render :show, status: :ok, location: @checklist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checklists/1 or /checklists/1.json
  def destroy
    @checklist.destroy

    respond_to do |format|
      format.html { redirect_to checklists_url, notice: "Checklist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checklist
      if params.has_key?(:checklist_id)
        @checklist = Checklist.find(params[:checklist_id])
      else
        @checklist = Checklist.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def checklist_params
      params.require(:checklist).permit(:title, checklist_items_attributes: [:id, :description, :is_done])
    end
end
