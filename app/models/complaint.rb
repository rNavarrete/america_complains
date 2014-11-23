class Complaint < ActiveRecord::Base
  searchable do
    text  :product, :sub_product, :issue, :sub_issue, :company
  end
  validates :state, format: { with: /\A[CO]+\z/ }

  def self.test_five
    all.limit(5).group_by do |complaint|
      complaint.company
    end
  end

  def self.grouped_by_name
    all.group_by do |complaint|
      complaint.company
    end
  end
end
