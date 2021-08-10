class User < ApplicationRecord
    self.table_name = "sys_users"
    before_save :encrypt_password

def encrypt_password
      return unless password_changed?
      if self.password.present? and self.salt.present?
        password = self.password + self.salt 
        self.password = BCrypt::Password.create(password)
      end
end

def match_password(login_password)
    password = login_password + self.salt
    BCrypt::Password.new(self.password) == password
end

end
