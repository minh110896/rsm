class Apply < ApplicationRecord
  belongs_to :user
  belongs_to :job
  has_one :company, through: :job
  enum status: {Not_receive: 0, Reviewing: 1, Rejected: 2, Hired: 3}
  scope :newest_apply, ->{order :created_at}
  scope :find_apply, ->(id){where user_id: id}
end
