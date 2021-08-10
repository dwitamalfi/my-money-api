class UserService
    def add(param)
        user_data = User.new
        user_data.username = param[:username]
        user_data.email = param[:email]
        user_data.name = param[:name]
        user_data.password = param[:password]
        user_data.salt = StringHelper.generate_salt 
        user_data.save!
        user_data
    end
end