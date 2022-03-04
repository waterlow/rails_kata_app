# frozen_string_literal: true

module CronJob
  class FooJob < Base
    self.cron_expression = '0 0 1 * *'

    def perform
      Post.create!(body: 'foo')
    end
  end
end
