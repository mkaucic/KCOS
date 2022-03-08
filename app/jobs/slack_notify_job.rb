class SlackNotifyJob < ActiveJob::Base
  queue_as :default

  def perform(message, url)
    notifier = Slack::Notifier.new "https://hooks.slack.com/services/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",
                channel: "#errors_webhook",
                username: "webhook-errors"
  begin
    notifier.ping message
  rescue
    notifier.ping "Failed to compose error message on #{Rails.application.class.to_s.split("::").first} -> #{url}"
  end
  end

end
