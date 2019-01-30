class CartsController < ApplicationController
  #escue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart_initial, only: [:create,:reset_cart, :show, :edit, :update, :destroy, :purchase,:order]
  #before_action :set_cart_initial , only: [:create]
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  def purchase
  end

  def reset_cart
    respond_to do |format|
      if @cart.update(status: "dead")
        session[:cart_id]=nil
        #@cart.line_items.destroy
        format.html { redirect_to root_path, notice: 'Cart was successfully deleted.' }
        format.json { head :no_content }
      end
    end
  end

  def order
    @user=current_user
    UsermailMailer.order_email(@user,@cart).deliver_now
    respond_to do |format|
      format.html { redirect_to reset_cart_path(@cart), notice: 'Order Placed' }
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    #nil.check
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.update(status: "dead")
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_initial
      @cart = Cart.find(params[:id])
      #Cart.find(params[:status])
    end

    #def set_cart
     # @cart = Cart.find_by(params[:id])
      #Cart.find(params[:status])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.fetch(:carts,{})
    end

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_path, notice: "That cart doesn't exist"
    end
end
