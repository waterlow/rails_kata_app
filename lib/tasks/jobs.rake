namespace :db do
  desc 'Schedule all cron jobs'
  task schedule_jobs: :environment do
    scheduled_jobs = Delayed::Job.where(scheduled_on_deploy: true).index_by(&:name)
    glob = Rails.root.join('app/models/cron_job/**/*_job.rb')
    Dir.glob(glob).each { |file| require file }
    schedulable_jobs = CronJob::Base.subclasses.select(&:cron_expression)
    schedulable_jobs.each do |c|
      if (scheduled_job = scheduled_jobs[c.name])
        scheduled_job.update!(cron: c.cron_expression)
      else
        Delayed::Job.enqueue(c.new, cron: c.cron_expression, scheduled_on_deploy: true)
      end
    end

    scheduled_jobs.except(schedulable_jobs.map(&:name)).each_value(&:destroy)
  end
end
