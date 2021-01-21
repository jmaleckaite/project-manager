class TimesheetsController < ApplicationController
  before_action :set_timesheet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  # GET /timesheets
  # GET /timesheets.json
  def index
    @timesheets = Timesheet.all.order("created_at DESC")
    
  end

  # GET /timesheets/1
  # GET /timesheets/1.json
  def show
  end

  # GET /timesheets/new
  def new
    @timesheet = current_user.timesheets.build
    @projects = current_user.projects
  end

  # GET /timesheets/1/edit
  def edit
    @projects = current_user.projects
  end

  # POST /timesheets
  # POST /timesheets.json
  def create
    @timesheet = current_user.timesheets.build(timesheet_params)

    respond_to do |format|
      if @timesheet.save
        format.html { redirect_to root_path, notice: 'Timesheet was successfully created.' }
        format.json { render :show, status: :created, location: @timesheet }
      else
        format.html { render :new }
        format.json { render json: @timesheet.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timesheets/1
  # PATCH/PUT /timesheets/1.json
  def update
    respond_to do |format|
      if @timesheet.update(timesheet_params)
        format.html { redirect_to @timesheet, notice: 'Timesheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @timesheet }
      else
        format.html { render :edit }
        format.json { render json: @timesheet.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timesheets/1
  # DELETE /timesheets/1.json
  def destroy
    @timesheet.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Timesheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timesheet
      @timesheet = Timesheet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def timesheet_params
      params.require(:timesheet).permit(:date, :hours, :project_id)
    end
end
