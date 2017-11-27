class Apply < ApplicationRecord
  belongs_to :user
  belongs_to :job
  scope :find_job, ->(id){where user_id: id}
end
