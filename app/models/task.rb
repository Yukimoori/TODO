class Task < ApplicationRecord
  validates :title , presence: true
  belongs_to :user

  enum status:{untouched: 0,operating: 1,finished: 2}

end
