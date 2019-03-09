class Task < ApplicationRecord
  validates :title , presence: true
  belongs_to :user

  enum status:{untouched: 0,operating: 1,finished: 2}
  enum priority: { high: 0, low: 1 }
  
  class << self
    def localed_priorities
      priorities.keys.map do |s|
        [ApplicationController.helpers.t("priority.task.#{s}"), s]
      end
    end
  end

  scope :get_by_title, ->(title) {
  where("title like ?", "%#{title}%")
  }

  scope :get_by_op_started, ->(op_started) {
  where(op_started: op_started)
  }

  scope :get_by_op_expection, ->(op_expection) {
  where(op_expection: op_expection)
  }

  scope :get_by_priority, ->(priority) {
  where(priority: priority)
  }

  scope :get_by_status, ->(status) {
  where(status: status)
  }
end
