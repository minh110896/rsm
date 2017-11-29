class Certificate < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: {maximum: Settings.certificate.maximum}
  validates :majors, presence: true, length: {maximum: Settings.certificate.maximum}
  validates :organization, presence: true, length: {maximum: Settings.certificate.maximum}
  validates :classification, length: {maximum: Settings.certificate.maximum}
  validates :received_time, presence: true
end
