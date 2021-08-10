class UserController < ApplicationController
    def add
        response = UserService.new.add(params)
        render json: response
    end
end
