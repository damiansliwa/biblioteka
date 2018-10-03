class ItemsController < ApplicationController
  
  def show
    @item = Item.find(params[:id])
  end
  
  def new
  	@item = Item.new
  end

  def create
  	@items = Item.all
  	@item = Item.new(item_params)
    if @item.save
      respond_to do |format|
      	format.html { redirect_to items_path }
      	format.js
      end
    else
      render 'new'
    end
  end

  def index
  	if params[:search]
  	  @items = Item.search(params[:search]).order("id").page(params[:page]).per(10)
  	else
  	  @items = Item.all.order("id").page(params[:page]).per(10)
    end
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def update
  	@item = Item.find(params[:id])
  	if @item.update_attributes(item_params)
  	  redirect_to @item
  	else
  	  render 'edit'
  	end
  end

  private

    def item_params
      params.require(:item).permit(:name, :author, :ISBN, :item_type,
      	                           :cover, :remove_cover, :search)
    end

end
