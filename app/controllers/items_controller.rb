class ItemsController < ApplicationController
  
  def show
    @item = Item.find(params[:id])
  end
  
  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def index
  	if params[:search]
  	  @items = Item.search(params[:search]).page(params[:page]).per(5)
  	else
  	  @items = Item.all.order("name").page(params[:page]).per(5)
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
      params.require(:item).permit(:name, :author, :ISBN,
                                   :item_type, :cover, :remove_cover,
                                   :search)
    end

end
