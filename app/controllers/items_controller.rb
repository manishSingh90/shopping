class ItemsController < ApplicationController

  def index
    @items = Category.find(params[:category_id]).items
  end

  def show
    @item = Category.find(params[:category_id]).items.find(params[:id])
    # render 'show'
  end

  def edit
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])
  end

  def create
    @category = Category.find(params[:category_id])
    @item = @category.items.create(item_params)
    redirect_to category_path(@category)
  end

  def update
    binding.pry
    @category = Category.find(params[:category_id])

    @item = @category.items.find(params[:id])

    if @item.update(item_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])
    @item.destroy
    redirect_to category_path(@category)
  end


  private

  def item_params
    params.require(:item).permit(:name, :price)
  end

end
