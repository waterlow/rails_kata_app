# frozen_string_literal: true

module CronJob
  class SampleJob < Base
    self.cron_expression = '0 0 2 * *'

    def perform
      Post.create!(body: SecureRandom.uuid)
    end
  end
end
