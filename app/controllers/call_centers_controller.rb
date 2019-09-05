# frozen_string_literal: true

class CallCentersController < ApplicationController
  before_action :set_call_center, only: %i[show edit update destroy]

  # GET /call_centers
  # GET /call_centers.json
  def index
    @call_centers = CallCenter.all
  end

  # GET /call_centers/1
  # GET /call_centers/1.json
  def show; end

  # GET /call_centers/new
  def new
    @call_center = CallCenter.new
  end

  # GET /call_centers/1/edit
  def edit; end

  # POST /call_centers
  # POST /call_centers.json
  def create
    @call_center = CallCenter.new(call_center_params)

    respond_to do |format|
      if @call_center.save
        format.html { redirect_to @call_center, notice: 'Call center was successfully created.' }
        format.json { render :show, status: :created, location: @call_center }
      else
        format.html { render :new }
        format.json { render json: @call_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /call_centers/1
  # PATCH/PUT /call_centers/1.json
  def update
    respond_to do |format|
      if @call_center.update(call_center_params)
        format.html { redirect_to @call_center, notice: 'Call center was successfully updated.' }
        format.json { render :show, status: :ok, location: @call_center }
      else
        format.html { render :edit }
        format.json { render json: @call_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /call_centers/1
  # DELETE /call_centers/1.json
  def destroy
    @call_center.destroy
    respond_to do |format|
      format.html { redirect_to call_centers_url, notice: 'Call center was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_call_center
    @call_center = CallCenter.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def call_center_params
    # params.fetch(:call_center, {})
    params.require(:call_center).permit(
      :name,
      :address,
      :phone_numer,
      :services,
      :email,
      :description,
      :status
    )
  end
end
