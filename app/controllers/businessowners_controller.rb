class BusinessownersController < ApplicationController
  before_action :set_businessowner, only: [:show, :edit, :update, :destroy]

  # GET /businessowners
  # GET /businessowners.json
  def index
    @businessowners = Businessowner.all
  end

  # GET /businessowners/1
  # GET /businessowners/1.json
  def show
  end

  # GET /businessowners/new
  def new
     @businessowner = Businessowner.new
  end

  # GET /businessowners/1/edit
  def edit
  end

  # POST /businessowners
  # POST /businessowners.json
  def create
    
    puts "----------check for the count------------"
    puts Businessowner.where(email: params[:businessowner][:email]).count
    #check if email already registered, reject if yes and redirect to register page with warning
    respond_to do |format|

      if Businessowner.where(email: params[:businessowner][:email]).count > 0
        errors = 'The account with provided email already exists.'
        flash[:error] = errors
        
        format.html { redirect_to "/account/register"  }
        format.json { render :show, status: :created, location: @businessowner }
      else
        @businessowner = Businessowner.new(businessowner_params)
        @businessowner.role = "Company" # to distinguish between admin and normal company user. set admin from database
        if @businessowner.save
          cookies[:id] = params[:businessowner][:email]
          session[:user_id] = @businessowner.id
          format.html { redirect_to "/Dashboard" }
          format.json { render :show, status: :created, location: @businessowner }
        else
          format.html { render :new }
          format.json { render json: @businessowner.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def validate
    @businessowner = Businessowner.where("email =? and password =? ",params[:businessowner][:email], params[:businessowner][:password])
    
    respond_to do |format|
      if !@businessowner.blank?
        cookies[:id] = params[:businessowner][:email]
        session[:user_id] = @businessowner.first.id
        format.html { redirect_to "/Dashboard"}
        format.json { render :show, status: :created, location: @businessowner }
      else
        flash[:error] = "Invalid login credentials"
        @businessowner = Businessowner.new
        format.html { redirect_to "/account/login" }
        format.json { render json: @businessowner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businessowners/1
  # PATCH/PUT /businessowners/1.json
  def update
    respond_to do |format|
      if @businessowner.update(businessowner_params)
        format.html { redirect_to @businessowner, notice: 'Businessowner was successfully updated.' }
        format.json { render :show, status: :ok, location: @businessowner }
      else
        format.html { render :edit }
        format.json { render json: @businessowner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businessowners/1
  # DELETE /businessowners/1.json
  def destroy
    @businessowner.destroy
    respond_to do |format|
      format.html { redirect_to businessowners_url, notice: 'Businessowner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_businessowner
      @businessowner = Businessowner.find(params[:id])
    end

    

    # Never trust parameters from the scary internet, only allow the white list through.
    def businessowner_params
      params.require(:businessowner).permit(:company_name, :email, :password, :company_website, :phone, :event_id)
    end
end
