class ImportLogs
    include Sidekiq::Worker
    def perform(domain,actor,action,time_stamp)
        Log.create({
            domain: domain,
            actor: actor,
            action: action,
            time_stamp: time_stamp
        })
    end
end