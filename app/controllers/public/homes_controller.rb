class Public::HomesController < ApplicationController
  def top
    @items = Item.all.order(created_at: :desc).first(3)
  end

  def about
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :introduction, :non_taxed_price)
  end
end
