class AuthController < ApplicationController
    def login
        begin
            response = AuthService.new.login(params)
            token = JsonWebToken::encode({id: response.id})
            data = { data: response.as_json(except: [:salt, :password]), access_token: token}
            show_response(BaseResponse.new(Constants::RESPONSE_SUCCESS, "Berhasil Login", data, nil, nil, "LOGIN"))
        rescue => e 
            return show_response(BaseResponse.new(Constants::RESPONSE_ERROR, e.message, nil, Constants::ERROR_CODE_VALIDATION))
        end
    end
end
