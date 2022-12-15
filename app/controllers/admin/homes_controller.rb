class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all.page(params[:page]).per(10).order('created_at DESC')
  end

end

  # 注文履歴一覧（orders_controller）のindexで定義したのをtopに変更してみた。
  #def index
    #@orders = Order.all.page(params[:page]).per(10).order('created_at DESC')
  #end