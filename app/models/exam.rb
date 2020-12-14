# == Schema Information
#
# Table name: exams
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  title       :string
#  description :text
#  exam_date   :date
#  place       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Exam < ApplicationRecord
  belongs_to :user
  has_many :tag_kinds, as: :tagable, dependent: :destroy
  has_many :tags, through: :tag_kinds
  has_many_attached :files

  validates :title, :description, :exam_date, :place, presence: true

end
