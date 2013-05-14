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

    # This is a custom setter for the trackable model. When set
    # the changed attributes are stored in the changed_hash attribute
    def trackable=(value)
      association(:trackable).writer(value)
      update_change_hash(value)
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
