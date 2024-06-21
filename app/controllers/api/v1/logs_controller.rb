class Api::V1::LogsController < ApplicationController
    def create
        log = Log.new(log_params)
        if log.save
            render json: {message: :ok}
        else
            render json: log.errors
        end
    end
    private
    def log_params
        params.require(:log).permit(:actor , :action , :domain , :time_stamp)
    end
end
