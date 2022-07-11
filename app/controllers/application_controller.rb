class ApplicationController < Sinatra::Base
set :default_content_type, 'application/json'

  get "/bakeries" do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get "/baked_goods" do
    baked_goods = BakedGood.all
    baked_goods.to_json
  end

  get "/bakeries/:id" do
    cake = Bakery.find(params[:id])
    cake.to_json(include: :baked_goods)
  end

  get "/baked_goods/by_price" do
    baked_goods = BakedGood.by_price
    baked_goods.to_json
  end

  get "/baked_goods/most_expensive" do
    baked_goods = BakedGood.most_expensive
    baked_goods.to_json
  end
end
