# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  power :users, map: {
    [:index] => :users_index,
    [:show] => :users_show,
    %i[new create] => :creatable_users,
    %i[edit update] => :updatable_users,
    [:destroy] => :destroyable_users
  }, as: :users_scope

  # GET /users
  # GET /users.json
  def index
    @users = users_scope.order('id') # .page(params[:page]).per(5)
  end

  # GET /users/1
  # GET /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
    # @user = @user.employees_call_centers.build
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    main_params = %i[full_name user_name email country_code mobile password password_confirmation role status]
    main_params.push(call_center_ids: []) if params[:role].eql?('employee')
    params.permit(main_params)

    # final_params = params.require(:user).permit(main_params)
    # final_params.merge!(call_center_ids: []) if params[:user][:role].eql?('employee')
    # final_params
    # main_params.push(:call_center_id) if params[:user][:role].eql?('employee')
    # params.require(:user).permit(main_params)
  end
end
