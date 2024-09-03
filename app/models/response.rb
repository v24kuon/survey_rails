class Response < ApplicationRecord
  belongs_to :user
  belongs_to :survey

  validates :user_id, presence: true
  validates :survey_id, presence: true
  validates :answers, presence: true
  validates :status, presence: true, inclusion: { in: %w[in_progress completed] }

  before_create :set_started_at
  before_save :set_completed_at, if: :status_changed_to_completed?

  private

  def set_started_at
    self.started_at ||= Time.current
  end

  def set_completed_at
    self.completed_at = Time.current if status == 'completed'
  end

  def status_changed_to_completed?
    status_changed? && status == 'completed'
  end
end
