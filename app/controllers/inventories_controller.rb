class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, expect: [:index,:show]

  respond_to :html

  def index
    @inventories = Inventory.all
    respond_with(@inventories)
  end

  def show
    respond_with(@inventory)
  end

  def new
    @inventory = current_user.inventories.build
    respond_with(@inventory)
  end

  def edit
  end

  
  def create
    @inventory = current_user.inventories.build(inventory_params)

      if @inventory.save
       redirect_to @inventory, notice: 'Inventory was successfully created.' 
      else
        render action: 'new' 
      end
  end


  def update
    @inventory.update(inventory_params)
    respond_with(@inventory)
  end

  def destroy
    @inventory.destroy
    respond_with(@inventory)
  end

  private
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    def inventory_params
      params.require(:inventory).permit(:Name, :Description, :Price)
    end
end
