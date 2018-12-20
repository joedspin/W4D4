# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  band_id    :integer          not null
#  live       :boolean          default(FALSE), not null
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord

  validates :title, :band_id, :year, presence: true
  validates :live, inclusion: { in: [true, false] }

  belongs_to :band,
    class_name: 'Band',
    foreign_key: :band_id
end
