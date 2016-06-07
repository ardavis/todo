class Todo < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :list

  scope :incomplete, -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil) }

  def completed?
    self.completed_at
  end

  def complete!
    self.update_attributes(completed_at: Time.now)
  end

  def reopen!
    self.update_attributes(completed_at: nil)
  end
end
