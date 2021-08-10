class AuthService
   def login(params)
    if params[:email].blank? or params[:password].blank?
        raise "Email dan password harus diisi"
    end
    user = User.find_by(email: params[:email])
    if not user.present?
        raise "Login Gagal, Email tidak ditemukan!"
    end
    if !user.match_password(params[:password])
        raise "Login Gagal, Password tidak sesuai!"
    end
    user
   end 
end