# frozen_string_literal: true

class DistributorOperationsController < ApplicationController
  before_action :set_distributor_operation, only: %i[show edit update destroy]
  power :distributor_operations
  # GET /distributor_operations
  # GET /distributor_operations.json
  def index
    @distributor_operations = DistributorOperation.all.includes(:user, :call_center)
  end

  # GET /distributor_operations/1
  # GET /distributor_operations/1.json
  def show; end

  # GET /distributor_operations/new
  def new
    @distributor_operation = DistributorOperation.new
  end

  # GET /distributor_operations/1/edit
  def edit; end

  # POST /distributor_operations
  # POST /distributor_operations.json
  def create
    @distributor_operation = DistributorOperation.new(distributor_operation_params)

    respond_to do |format|
      if @distributor_operation.save
        format.html { redirect_to @distributor_operation, notice: 'Distributor operation was successfully created.' }
        format.json { render :show, status: :created, location: @distributor_operation }
      else
        format.html { render :new }
        format.json { render json: @distributor_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /distributor_operations/1
  # PATCH/PUT /distributor_operations/1.json
  def update
    respond_to do |format|
      if @distributor_operation.update(distributor_operation_params)
        format.html { redirect_to @distributor_operation, notice: 'Distributor operation was successfully updated.' }
        format.json { render :show, status: :ok, location: @distributor_operation }
      else
        format.html { render :edit }
        format.json { render json: @distributor_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /distributor_operations/1
  # DELETE /distributor_operations/1.json
  def destroy
    @distributor_operation.destroy
    respond_to do |format|
      format.html { redirect_to distributor_operations_url, notice: 'Distributor operation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_distributor_operation
    @distributor_operation = DistributorOperation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def distributor_operation_params
    # params.fetch(:distributor_operation, {})
    params.require(:distributor_operation).permit(
      :user_id,
      :call_center_id,
      :name,
      :operation_type,
      :quantity,
      :units_number,
      :cost,
      :total,
      :description,
      :opration_date,
      :status
    )
  end
end
