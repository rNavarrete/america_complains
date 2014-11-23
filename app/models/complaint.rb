class Complaint < ActiveRecord::Base
  searchable do
    text  :product, :sub_product, :issue, :sub_issue, :company
  end
  validates :state, format: { with: /\A[CO]+\z/ }
end
