class V1::ProvidersController < ApplicationController
  before_action :set_v1_provider, only: [:show, :edit, :update, :destroy]

  # GET /v1/providers
  # GET /v1/providers.json
  def index
    @v1_providers = V1::Provider.all
  end

  # GET /v1/providers/1
  # GET /v1/providers/1.json
  def show
  end

  # GET /v1/providers/new
  def new
    @v1_provider = V1::Provider.new
  end

  # GET /v1/providers/1/edit
  def edit
  end

  # POST /v1/providers
  # POST /v1/providers.json
  def create
    @v1_provider = V1::Provider.new(v1_provider_params)

    respond_to do |format|
      if @v1_provider.save
        format.html { redirect_to @v1_provider, notice: 'Provider was successfully created.' }
        format.json { render :show, status: :created, location: @v1_provider }
      else
        format.html { render :new }
        format.json { render json: @v1_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /v1/providers/1
  # PATCH/PUT /v1/providers/1.json
  def update
    respond_to do |format|
      if @v1_provider.update(v1_provider_params)
        format.html { redirect_to @v1_provider, notice: 'Provider was successfully updated.' }
        format.json { render :show, status: :ok, location: @v1_provider }
      else
        format.html { render :edit }
        format.json { render json: @v1_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v1/providers/1
  # DELETE /v1/providers/1.json
  def destroy
    @v1_provider.destroy
    respond_to do |format|
      format.html { redirect_to v1_providers_url, notice: 'Provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_provider
      @v1_provider = V1::Provider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def v1_provider_params
      params.fetch(:v1_provider, {})
    end
end
