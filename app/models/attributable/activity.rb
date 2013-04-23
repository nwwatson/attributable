module Attributable
  class Activity < ActiveRecord::Base
    belongs_to :user
    belongs_to :trackable, polymorphic: true
    belongs_to :organization

    validates :action, presence: true

    before_save :track_dirty_attributes

    private 

      def track_dirty_attributes

      end

  end
end
