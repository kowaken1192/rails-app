class Schedule < ApplicationRecord
    validates :title, presence: true, length: { maximum: 20 }
    validates :memo, presence: true, length: { maximum: 500 }
    validate :start_end_check
  
    def start_end_check
      errors.add(:end_date, "終了日は開始日より前の日付は登録できません。") unless start_date.nil? || end_date.nil? || start_date < end_date
    end
  end
  