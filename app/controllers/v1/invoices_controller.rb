
# frozen_string_literal: true
  
class V1::InvoicesController < ApplicationController
  before_action :set_v1_invoice, only: %i[show edit update destroy]
  power :invoices
  # GET /v1/invoices
  # GET /v1/invoices.json
  def index
    @v1_invoices = ::Invoice.all
  end

  # GET /v1/invoices/1
  # GET /v1/invoices/1.json
  def show; end

  # GET /v1/invoices/new
  def new
    @v1_invoice = Invoice.new
  end

  # GET /v1/invoices/1/edit
  def edit; end

  # POST /v1/invoices
  # POST /v1/invoices.json
  def create
    @v1_invoice = Invoice.new(v1_invoice_params)

    respond_to do |format|
      if @v1_invoice.save
        format.html { redirect_to root_url, notice: 'invoice was successfully created.' }
        format.json { render :show, status: :created, location: @v1_invoice }
      else
        flash[:error] = @v1_invoice.errors.full_messages
        format.html { render :new, notice: @v1_invoice.errors.full_messages}
        format.json { render json: @v1_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /v1/invoices/1
  # PATCH/PUT /v1/invoices/1.json
  def update
    respond_to do |format|
      if @v1_invoice.update(v1_invoice_params)
        format.html { redirect_to @v1_invoice, notice: 'invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @v1_invoice }
      else
        format.html { render :edit }
        format.json { render json: @v1_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v1/invoices/1
  # DELETE /v1/invoices/1.json
  def destroy
    @v1_invoice.destroy
    respond_to do |format|
      format.html { redirect_to v1_invoices_url, notice: 'invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_v1_invoice
    @v1_invoice = V1::Invoice.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def v1_invoice_params
    params.permit(
      :orgnaization_id,
      :name,
      :invoice_type,
      :invoice_number,
      :amount_paid,
      :remaining,
      :total_cost,
      :status,
      :date,
      :address,
      :description
    )
  end
end
