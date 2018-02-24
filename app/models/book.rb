class Book < ApplicationRecord
  validates :title, presence: true

  belongs_to :user

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  scope :published, -> { where(is_hidden:false) }
  scope :recent, -> { order('created_at DESC') }

  mount_uploader :image, ImageUploader

end
