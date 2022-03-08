class ActionLog < ApplicationRecord
	belongs_to :loggable, :polymorphic => true
	belongs_to :admin
	default_scope { order(created_at: :desc) }

  def changes
    JSON.parse(params).except("id", "created_at", "updated_at")
  end
end
