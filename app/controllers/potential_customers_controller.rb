class PotentialCustomersController < ApplicationController
  def create
  end

  def edit
    @data = PotentialCustomer.find_by(id_potential_customers: params[:id])

    # byebug
  end

  def edit_action
    name = params[:name]
    email = params[:email]  
    phone_number = params[:phone_number]
    address = params[:address]

    # byebug
    potential_customer = PotentialCustomer.find_by(id_potential_customers: params[:id])

    if potential_customer.update(name: name, email: email, phone_number: phone_number,address: address)
      flash[:notice] = "Data berhasil diperbarui!"
      redirect_to dashboard_path
    else
      flash[:alert] = "Gagal memperbarui data."
      # render :edit, status: :unprocessable_entity
      redirect_to potential_customer_edit_action(params[:id])
    end

  end

  def delete_action

    potential_customer = PotentialCustomer.find_by(id_potential_customers: params[:id])
  
    if potential_customer
      potential_customer.destroy
      flash[:notice] = "Data berhasil dihapus."
    else
      flash[:alert] = "Data tidak ditemukan."
    end

    redirect_to dashboard_path

    
  end


  def create_action
    name = params[:name]
    email = params[:email]  
    phone_number = params[:phone_number]
    address = params[:address]
    
    potentialCustomer = PotentialCustomer.new(name: name, email: email, phone_number: phone_number,address: address)
  
    # cek email 
    if PotentialCustomer.exists?(email: email)
      redirect_to potential_customer_create_path,alert: "Email Customer sudah terdaftar." and return
    end

    if potentialCustomer.save
      redirect_to dashboard_path
   
    end
  end
end
