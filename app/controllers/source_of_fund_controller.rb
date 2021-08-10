class SourceOfFundController < ApplicationController
 before_action :authorize_request
    
    def add
        begin
            response = SourceOfFundService.new.add(params)
            data = { data: response.as_json }
            show_response(BaseResponse.new(Constants::RESPONSE_SUCCESS, "Berhasil Menambahkan Sumber Dana", data, nil, nil, "ADD SOURCE OF FUNDS"))
        rescue => e 
            return show_response(BaseResponse.new(Constants::RESPONSE_ERROR, e.message, nil, Constants::ERROR_CODE_VALIDATION))
        end
    end
end
