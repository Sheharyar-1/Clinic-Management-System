class Appointment < ApplicationRecord
  belongs_to :admin
  belongs_to :patient

  validates :appointment_date, presence: true
  validates :status, inclusion: { in: %w[upcoming completed canceled] }

  scope :upcoming, -> { where(status: "upcoming").where("appointment_date > ?", Time.current) }
  scope :completed, -> { where(status: "completed") }
  scope :canceled, -> { where(status: "canceled") }
end
