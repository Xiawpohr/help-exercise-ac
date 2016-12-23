class Message < ApplicationRecord

  belongs_to :user

  has_many :comments, :dependent => :destroy

  def last_comment_summary
    self.comments.last.try(:content).try(:truncate, 20)
  end
  # time = params[:days].to_i
  scope :pending, ->{ where( :status => "pending" ) }
  scope :completed, ->{ where( :status => "completed" ) }

  def self.within_days(time)
      where( "created_at >= ?",time.days )
  end
end