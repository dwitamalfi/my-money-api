class IncomeService

    def add(params)
        sof = Mst::SourceOfFund.find_by(params[:source_of_fund_id])
        icm = Trx::Income.new
        icm.user_id = params[:header_user_id]
        icm.source_of_fund_id = sof.id
        icm.nominal = params[:nominal]
        if not params[:nominal].blank?
            sof.saldo = sof.saldo.to_i + params[:nominal].to_i
            sof.saldo = sof.saldo.to_s
        end
        begin
            icm.save!
            sof.save!
            icm
        rescue BusinessException => ex
            raise BusinessException.new ex.message
        rescue => e
            raise e.message
        end
    end

end