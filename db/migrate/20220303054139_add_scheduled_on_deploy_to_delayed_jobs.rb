class AddScheduledOnDeployToDelayedJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :delayed_jobs, :scheduled_on_deploy, :boolean, null: false, default: false
  end
end
