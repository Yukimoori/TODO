class Daily < ApplicationRecord
  validates :date , presence: true
  validates :companyName , presence: true

  enum place: { customer: 0, guest: 1}
  enum status: { proposal: 0, ordered: 1}
  enum expectation: { a: 0, b: 1, c: 2, d: 3,}
end
