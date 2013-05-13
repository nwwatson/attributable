module Attributable
  class Activity < ActiveRecord::Base
    belongs_to :user
    belongs_to :trackable, polymorphic: true
    attr_accessible :action, :change_hash, :notes

    validates :action, presence: true
    validates :user, presence: true
    validates :trackable, presence: true
  end
end
