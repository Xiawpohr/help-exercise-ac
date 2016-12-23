class Message < ApplicationRecord

  belongs_to :user

  has_many :comments, :dependent => :destroy

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end

  scope :pending, ->{ where( :status => "pending" ) }
  scope :completed, ->{ where( :status => "completed" ) }

end
