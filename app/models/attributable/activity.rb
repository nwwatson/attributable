module Attributable
  class Activity < ActiveRecord::Base
    serialize :change_hash, ActiveRecord::Coders::Hstore

    attr_accessible :action, :change_hash, :notes, :user, :trackable, :ownable

    belongs_to :user
    # The trackable model is the model that you want to track changes to

    belongs_to :trackable, polymorphic: true
    # The ownable model is the model that you want to query on to
    # find the changes. For example, and employee may have a phone_number.
    # If we want to track all changes made to an employee, and we update
    # a phone_phone number, the employee is the ownable model and the
    # phone_number is the trackable model
    belongs_to :ownable, polymorphic: true


    validates :action, presence: true
    validates :user, presence: true
    validates :trackable, presence: true
    validates :change_hash, presence: true
    validates :ownable, presence: true

    # If there isn't an owning model, then the value is set to
    # the trackable model
    before_validation :assign_ownable

    # Scopes
    scope :in_order, order('created_at ASC')
    scope :latest, order('created_at DESC')

    # Override the all method so that the default scope
    # is in reverse chronological order
    def all
      self.latest
    end

    # This is a custom setter for the trackable model. When set
    # the changed attributes are stored in the changed_hash attribute
    def trackable=(value)
      association(:trackable).writer(value)
      update_change_hash(value)
    end

    class << self

      # Method to look up activities assigned 
      # to all accountable types for a given user
      def self.find_activities_by_user(user)
        where(user_id: user.id).latest
      end

      # Method to look up all notes for 
      # a notable class name and notable id
      def self.find_activities_for_attributable(attributable_str, attributable_id)
        where(attributable_type: attributable_str, attributable_id: attributable_id)
      end
    end

    private

      # Sets change_hash to the attributes that were changed
      # during the last save of the model
      def update_change_hash(obj)
        self.change_hash = obj.previous_changes
      end

      # This method is used before validation. If the record
      # doesn't have an owning model assigned, then the trackable
      # model becomes the owning model
      def assign_ownable
        if self.ownable.nil?
          association(:ownable).writer(self.trackable)
        end
      end
  end
end
