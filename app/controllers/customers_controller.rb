class CustomersController < ApplicationController
  def index

    @data = Customer.find_by_sql("
      SELECT customers.*, potential_customers.name AS potential_customers_name ,products.name as product_name
      FROM customers 
      INNER JOIN potential_customers ON customers.potential_customer_id = potential_customers.id_potential_customers
      INNER JOIN products ON customers.product_id = products.id_product

    ")

    @potentialCustomer = PotentialCustomer.all
    @products = Product.all

    # byebug
  end
  
  def transaction_action
  
    potential_customer = params[:potential_customer]
    product = params[:product] 

    data = Customer.new(potential_customer_id: potential_customer ,product_id: product, status: "pending")

    # byebug

    if data.save
      redirect_to customers_path
   
    end

  end

  def delete_action
    data = Customer.find_by(id_customer: params[:id])
  
    if data
      data.destroy
      flash[:notice] = "Data berhasil dihapus."
    else
      flash[:alert] = "Data tidak ditemukan."
    end

    redirect_to customers_path

  end

  def aprove_action

    data = Customer.find_by(id_customer: params[:id])
  
    if data.update(status: "accepted")
      flash[:notice] = "Data berhasil diperbarui!"
      redirect_to customers_path
   
    end

    redirect_to customers_path
  end

end
