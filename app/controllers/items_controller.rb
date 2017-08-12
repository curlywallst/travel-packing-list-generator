class ItemsController < ApplicationController

  def new
  end

  def create
    @item = Item.create(item_params)
    if params[:trip][:item_id].nil? || params[:item][:item_id] == ""
      @trip.category = Category.find_or_create_by(name: params[:item][:categories][:name])
    else
      @trip.category = Category.find(params[:item][:category_id][0])
    end
    current_user.trips << @item
    redirect_to trip_path(@item)
  end

  def index
    @items = Item.all
  end

  def show

  end

  private

  def item_params
    params.require(:item).permit(:name, :category_id, :description, trip_ids:[], trip_attributes: [:title, :year, :category])
  end
end
