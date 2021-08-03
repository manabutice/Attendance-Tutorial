class Attendance < ApplicationRecord
  belongs_to :user
  
  validates :worked_on, presence: true
  validates :note, length: { maximum: 50 }
  
  # 出勤時間と退勤時間の関係をチェック。退勤時間は常に遅い時間。
  validate :finished_at_is_invalid_without_a_started_at
  validate :started_at_than_finished_at_fast_if_invalid


  def finished_at_is_invalid_without_a_started_at
    if started_at.blank? && finished_at.present?
      errors[:base ] << "出勤時間が要ります"
      # 勤怠１０章 errors.add(:started_at, "が必要です") if started_at.blank? && finished_at.present?
    end
  end
  
  def started_at_than_finished_at_fast_if_invalid
    if started_at.present? && finished_at.present?
      errors[:base ] << "より早い退勤時間は無効です" if started_at > finished_at
    end
    # 同上
  end
end
