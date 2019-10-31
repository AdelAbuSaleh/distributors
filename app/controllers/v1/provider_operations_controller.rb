class V1::ProviderOperationsController < ApplicationController
  before_action :set_v1_provider_operation, only: [:show, :edit, :update, :destroy]

  # GET /v1/provider_operations
  # GET /v1/provider_operations.json
  def index
    @v1_provider_operations = V1::ProviderOperation.all
  end

  # GET /v1/provider_operations/1
  # GET /v1/provider_operations/1.json
  def show
  end

  # GET /v1/provider_operations/new
  def new
    @v1_provider_operation = V1::ProviderOperation.new
  end

  # GET /v1/provider_operations/1/edit
  def edit
  end

  # POST /v1/provider_operations
  # POST /v1/provider_operations.json
  def create
    @v1_provider_operation = V1::ProviderOperation.new(v1_provider_operation_params)

    respond_to do |format|
      if @v1_provider_operation.save
        format.html { redirect_to @v1_provider_operation, notice: 'Provider operation was successfully created.' }
        format.json { render :show, status: :created, location: @v1_provider_operation }
      else
        format.html { render :new }
        format.json { render json: @v1_provider_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /v1/provider_operations/1
  # PATCH/PUT /v1/provider_operations/1.json
  def update
    respond_to do |format|
      if @v1_provider_operation.update(v1_provider_operation_params)
        format.html { redirect_to @v1_provider_operation, notice: 'Provider operation was successfully updated.' }
        format.json { render :show, status: :ok, location: @v1_provider_operation }
      else
        format.html { render :edit }
        format.json { render json: @v1_provider_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v1/provider_operations/1
  # DELETE /v1/provider_operations/1.json
  def destroy
    @v1_provider_operation.destroy
    respond_to do |format|
      format.html { redirect_to v1_provider_operations_url, notice: 'Provider operation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_provider_operation
      @v1_provider_operation = V1::ProviderOperation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def v1_provider_operation_params
      params.fetch(:v1_provider_operation, {})
    end
end
