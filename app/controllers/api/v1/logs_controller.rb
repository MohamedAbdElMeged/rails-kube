class Api::V1::LogsController < ApplicationController
    def create
        log= Log.new(log_params)
        if log.valid?
            ImportLogs.perform_async(log.domain,log.actor,log.action,log.time_stamp)
            render json: "will be added"
        else
            render json: log.errors
        end
    end
    private
    def log_params
        params.require(:log).permit(:actor , :action , :domain , :time_stamp)
    end
end
