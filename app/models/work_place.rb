class WorkPlace < ApplicationRecord
  belongs_to :stores
  belongs_to :employees
end
