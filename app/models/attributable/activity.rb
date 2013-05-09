module Attributable
  class Activity < ActiveRecord::Base
    belongs_to :user
    belongs_to :trackable
    attr_accessible :action, :change_hash, :notes

    validates :action, presence: true
  end
end
