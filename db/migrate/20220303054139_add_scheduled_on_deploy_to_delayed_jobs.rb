class AddScheduledOnDeployToDelayedJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :delayed_jobs, :scheduled_on_deploy, :boolean, null: false, default: false
  end
end
