class SourceOfFundService

    def add(params)
        sof = Mst::SourceOfFund.new
        sof.user_id = params[:header_user_id]
        sof.saldo = params[:saldo]
        sof.name = params[:name]
        begin
            sof.save!
            sof
        rescue BusinessException => ex
            raise BusinessException.new ex.message
        rescue => e
            raise e.message
        end
    end

end