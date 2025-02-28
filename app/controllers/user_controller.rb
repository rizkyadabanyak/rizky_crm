class UserController < ApplicationController


  before_action :redirect_if_logged_in, only: [:login,:register]


  def redirect_if_logged_in
    redirect_to dashboard_path if session[:user]
  end


  def index
  end


  def register

    render layout: "auth" 
  end

  def login


    if session[:user] != nil
      redirect_to dashboard_path
    end

  
    # render "keterangan", layout: "auth" 
    # render "login"
    render layout: "auth" 

  end

  def actionLogin


    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user] = user  # Simpan session
      redirect_to dashboard_path, notice: "Login berhasil!"
    else
      redirect_to login_path, alert: "Email atau password salah"

      # flash[:alert] = "Email atau password salah"
      # render :login
    end

  end

  def actionRegister
  
      name = params[:name]
      email = params[:email]
      password = params[:password]
  
      # Validasi sederhana
      if name.blank? || email.blank? || password.blank?
        return render json: { error: "Semua field harus diisi" }, status: :unprocessable_entity
      end
  
      # cek email 
      if User.exists?(email: email)
        redirect_to register_path, alert: "Email sudah digunakan."

      end
  
      # save new user
      user = User.new(name: name, email: email, password: password)

      if user.save
        redirect_to login_path, notice: "Registrasi berhasil! Silakan login."
      else
        render json: { error: "Gagal registrasi", details: user.errors.full_messages }, status: :unprocessable_entity
      end


  end

  def logout
    session[:user] = nil
    redirect_to login_path, notice: "Logout berhasil!"
  end

end
