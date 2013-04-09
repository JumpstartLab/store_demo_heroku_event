class Admin::ProductsController < ApplicationController
  before_filter :require_admin

  def index
    @products = Product.order('created_at DESC').all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to admin_products_path,
        :notice => "Successfully created product."
    else
      render :action => 'new', :notice  => "Product creation failed."
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to admin_products_path,
        :notice  => "Successfully updated product."
    else
      render :action => 'edit', :notice  => "Update failed."
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_url,
      :notice => "Successfully destroyed product."
  end

  def toggle_status
    @product = Product.find(params[:id])
    if @product.toggle_status
      redirect_to admin_products_path,
        :notice  => "Product status successfully set to '#{@product.status}'."
    else
      head 400
    end
  end
end
