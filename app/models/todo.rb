class Todo < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :list
  
  belongs_to :parent, :class_name => "Todo", :foreign_key => "parent_id"
  has_many :child_todos, :class_name => "Todo", :foreign_key => "parent_id"

  scope :incomplete, -> { where(completed_at: nil).where(parent_id: nil) }
  scope :completed, -> { where.not(completed_at: nil).where(parent_id: nil)}

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  scope :child_todos, -> {where(parent_id: self.id)}

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
