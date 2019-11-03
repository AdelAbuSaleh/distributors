# frozen_string_literal: true

class V1::OrgnaizationsController < ApplicationController
  before_action :set_v1_orgnaization, only: %i[show edit update destroy]

  # GET /v1/orgnaizations
  # GET /v1/orgnaizations.json
  def index
    @v1_orgnaizations = V1::Orgnaization.all
  end

  # GET /v1/orgnaizations/1
  # GET /v1/orgnaizations/1.json
  def show; end

  # GET /v1/orgnaizations/new
  def new
    @v1_orgnaization = V1::Orgnaization.new
  end

  # GET /v1/orgnaizations/1/edit
  def edit; end

  # POST /v1/orgnaizations
  # POST /v1/orgnaizations.json
  def create
    @v1_orgnaization = V1::Orgnaization.new(v1_orgnaization_params)

    respond_to do |format|
      if @v1_orgnaization.save
        format.html { redirect_to @v1_orgnaization, notice: 'Orgnaization was successfully created.' }
        format.json { render :show, status: :created, location: @v1_orgnaization }
      else
        format.html { render :new }
        format.json { render json: @v1_orgnaization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /v1/orgnaizations/1
  # PATCH/PUT /v1/orgnaizations/1.json
  def update
    respond_to do |format|
      if @v1_orgnaization.update(v1_orgnaization_params)
        format.html { redirect_to @v1_orgnaization, notice: 'Orgnaization was successfully updated.' }
        format.json { render :show, status: :ok, location: @v1_orgnaization }
      else
        format.html { render :edit }
        format.json { render json: @v1_orgnaization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v1/orgnaizations/1
  # DELETE /v1/orgnaizations/1.json
  def destroy
    @v1_orgnaization.destroy
    respond_to do |format|
      format.html { redirect_to v1_orgnaizations_url, notice: 'Orgnaization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_v1_orgnaization
    @v1_orgnaization = V1::Orgnaization.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def v1_orgnaization_params
    params.fetch(:v1_orgnaization, {})
  end
end
