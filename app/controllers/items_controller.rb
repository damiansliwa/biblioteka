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
  	@items = if params[:search]
  		Item.where('name LIKE ?', "%#{params[:search]}%")
  	  else
  	  	#@items = Item.all
  	    @items = Item.order("name").page(params[:page]).per(5)
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
