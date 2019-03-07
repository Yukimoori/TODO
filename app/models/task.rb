class Task < ApplicationRecord
  validates :title , presence: true
  belongs_to :user

  enum status:{untouched: 0,operating: 1,finished: 2}

  def self.search(search)
    if search
      Task.where(['title LIKE ?', "%#{search}%"])
    else
      Task.all
    end
    end

end
