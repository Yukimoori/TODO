class Daily < ApplicationRecord
  # validates :date , presence: true
  # validates :companyName , presence: true

  enum tool: { tel: 0, mail: 1, meeting: 2, DM: 3}
  enum place: { customer: 0, guest: 1}
  enum status: { hearing: 0,proposal: 1, ordered: 2}
  enum expectation: { a: 0, b: 1, c: 2, d: 3,}
end
