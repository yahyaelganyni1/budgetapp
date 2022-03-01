class PurchasesController < ApplicationController
  load_and_authorize_resource

  def index
    redirect_to categories_url
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user = current_user

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase.categories.first }
      else
        format.html { render :new }
      end
    end
  end

  private

  def purchase_params
    params.fetch(:purchase, {}).permit(:name, :amount, category_ids: [])
  end
end
