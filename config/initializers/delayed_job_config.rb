Delayed::Worker.logger = Logger.new(File.join(Rails.root, 'log', 'delayed_job.log'))
Delayed::Worker.destroy_failed_jobs = false

# require 'delayed_job'

# class Delayed::Job
#   before_destroy do
#     Rails.logger.(caller.join("\n"))
#   end
# end
