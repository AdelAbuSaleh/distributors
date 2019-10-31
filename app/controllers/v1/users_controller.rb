class V1::UsersController < ApplicationController
  before_action :set_v1_user, only: [:show, :edit, :update, :destroy]

  # GET /v1/users
  # GET /v1/users.json
  def index
    @v1_users = V1::User.all
  end

  # GET /v1/users/1
  # GET /v1/users/1.json
  def show
  end

  # GET /v1/users/new
  def new
    @v1_user = V1::User.new
  end

  # GET /v1/users/1/edit
  def edit
  end

  # POST /v1/users
  # POST /v1/users.json
  def create
    @v1_user = V1::User.new(v1_user_params)

    respond_to do |format|
      if @v1_user.save
        format.html { redirect_to @v1_user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @v1_user }
      else
        format.html { render :new }
        format.json { render json: @v1_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /v1/users/1
  # PATCH/PUT /v1/users/1.json
  def update
    respond_to do |format|
      if @v1_user.update(v1_user_params)
        format.html { redirect_to @v1_user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @v1_user }
      else
        format.html { render :edit }
        format.json { render json: @v1_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v1/users/1
  # DELETE /v1/users/1.json
  def destroy
    @v1_user.destroy
    respond_to do |format|
      format.html { redirect_to v1_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_user
      @v1_user = V1::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def v1_user_params
      params.require(:user).permit(
        :full_name,
        :email,
        :city,
        :orgnaization_id,
        :region,
        :code_country,
        :mobile,
        :password,
        :role,
        :status
      )
    end
end
