class Page < ApplicationRecord
  belongs_to :subject, { optional: false }
  has_and_belongs_to_many :admin_users
  has_many :sections

  scope :sorted, -> {order('position')}
  scope :visible, -> {where(visible: true)}

  validates_presence_of :name
  validates_length_of :name, maximum: 25
  # use presence_of to make sure it is not just spaces
  validates_presence_of :permalink
  validates_length_of :permalink, within: 3..255
  validates_uniqueness_of :permalink
end
