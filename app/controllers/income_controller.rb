class IncomeController < ApplicationController
    before_action :authorize_request

    def add
        begin
            response = IncomeService.new.add(params)
            data = { data: response.as_json }
            show_response(BaseResponse.new(Constants::RESPONSE_SUCCESS, "Berhasil Menambahkan Income", data, nil, nil, "ADD INCOMES"))
        rescue => e 
            return show_response(BaseResponse.new(Constants::RESPONSE_ERROR, e.message, nil, Constants::ERROR_CODE_VALIDATION))
        end
    end
end
