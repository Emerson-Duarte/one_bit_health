# == Schema Information
#
# Table name: treatments
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  title       :string
#  description :text
#  date        :datetime
#  local       :string
#  kind        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :treatment do
    sequence(:title) {|n| "Treatment - #{n}"}
    description "MyText"
    date "2020-12-10 16:57:15"
    local "MyString"
    kind 1
    user
    after :create do |treatment|
      create(:tag_kind, tag: create(:tag), tagable: treatment)
    end
  end
end
