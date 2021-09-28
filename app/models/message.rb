class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }
    belongs_to :user
    validates :body, presence: true
    scope :custom_display, -> { order(:created_at).last(20) }
  end
  