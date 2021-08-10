class ApplicationController < ActionController::API
    def authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        route_service = RouteService.new(params)
        if header.present?
          begin
            # hasil decode :id, :roles
            @decoded = JsonWebToken.decode(header)
            # @access_type = "ppds"
            # @current_ppds = Trx::Ppds.where(id: @decoded[:id]).first
            # if not @current_ppds.present?
            #   @access_type = "user"
            #   @current_user = Sys::User.where(id: @decoded[:id]).first
            #   if not @current_user.present?
            #     @access_type = "app"
            #     @current_user = Sys::App.find(@decoded[:id])
            #   end
            # end
            # if @access_type == "app"
            #   if !route_service.app_has_permission(@current_user)
            #     show_response(BaseResponse.new(Constants::RESPONSE_ERROR, "Header is don't have permission for this path!", nil, Constants::ERROR_CODE_HEADER_INVALID))
            #   end
            # else
            #   if route_service.need_access
            #     if !route_service.has_permission @current_user
            #       show_response(BaseResponse.new(Constants::RESPONSE_ERROR, "Header is don't have permission for this path!", nil, Constants::ERROR_CODE_HEADER_INVALID))
            #     end
            #   end
              params[:header_user_id] = @decoded[:id]
            # end
        #   rescue ActiveRecord::RecordNotFound => e
        #     show_response(BaseResponse.new(Constants::RESPONSE_ERROR, "Unauthorized!", nil, Constants::ERROR_CODE_HEADER_INVALID))
        #   rescue JWT::DecodeError => e
        #     show_response(BaseResponse.new(Constants::RESPONSE_ERROR, "Unauthorized!", nil, Constants::ERROR_CODE_HEADER_INVALID))
        #   end
        # else
        #   show_response(BaseResponse.new(Constants::RESPONSE_ERROR, "Invalid Header!", nil, Constants::ERROR_CODE_HEADER_INVALID))
        # end
          end
        end
      end

    def show_response(base_response)
        if base_response.get_status == Constants::RESPONSE_SUCCESS
            render json: base_response.get_data, status: base_response.get_status
        else
            render json: {message: base_response.get_message, code: base_response.get_status_error_code}, status: base_response.get_status
        end
    end
end
