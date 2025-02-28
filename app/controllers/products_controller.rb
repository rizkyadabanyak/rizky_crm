class ProductsController < ApplicationController
  def index

    @data = Product.all
  end

  def create_action
    name = params[:name]
    
    data = Product.new(name: name)
  

    if data.save
      redirect_to products_path
   
    end
  end

  def edit
    @data = Product.find_by(id_product: params[:id])

    # byebug
  end

  def edit_action
    name = params[:name]

    data = Product.find_by(id_product: params[:id])


    if data.update(name: name)
      flash[:notice] = "Data berhasil diperbarui!"
      redirect_to products_path
    else
      flash[:alert] = "Gagal memperbarui data."
      # render :edit, status: :unprocessable_entity
      redirect_to products_edit_path(params[:id])
    end

  end


  def delete_action

    data = Product.find_by(id_product: params[:id])
  
    if data
      data.destroy
      flash[:notice] = "Data berhasil dihapus."
    else
      flash[:alert] = "Data tidak ditemukan."
    end

    redirect_to products_path

    
  end


end
