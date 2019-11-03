# frozen_string_literal: true

class V1::RequestsController < ApplicationController
  before_action :set_v1_request, only: %i[show edit update destroy]

  # GET /v1/requests
  # GET /v1/requests.json
  def index
    @v1_requests = V1::Request.all
  end

  # GET /v1/requests/1
  # GET /v1/requests/1.json
  def show; end

  # GET /v1/requests/new
  def new
    @v1_request = V1::Request.new
  end

  # GET /v1/requests/1/edit
  def edit; end

  # POST /v1/requests
  # POST /v1/requests.json
  def create
    @v1_request = V1::Request.new(v1_request_params)

    respond_to do |format|
      if @v1_request.save
        format.html { redirect_to @v1_request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @v1_request }
      else
        format.html { render :new }
        format.json { render json: @v1_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /v1/requests/1
  # PATCH/PUT /v1/requests/1.json
  def update
    respond_to do |format|
      if @v1_request.update(v1_request_params)
        format.html { redirect_to @v1_request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @v1_request }
      else
        format.html { render :edit }
        format.json { render json: @v1_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v1/requests/1
  # DELETE /v1/requests/1.json
  def destroy
    @v1_request.destroy
    respond_to do |format|
      format.html { redirect_to v1_requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_v1_request
    @v1_request = V1::Request.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def v1_request_params
    params.fetch(:v1_request, {})
  end
end
