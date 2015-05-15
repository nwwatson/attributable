module Attributable
  module ControllerHelper

    # The method attribute_change allows you to track changes for
    # a single model without parent model. It takes an
    # optional notes. This method requires your controller
    # to respond to current_user, and current_user should
    # return a user object It works like this:
    #
    #  attribute_change('create!', blog_entry) # without comment
    #  attribute_change('create!', blog_entry, 'Created blog entry') # with comment
    #
    def attribute_change(action, trackable, notes=nil)
      Attributable::Activity.create!({ action: action, trackable: trackable, notes: notes, user: current_user })
    end

    # The method attribute_change_for_model allows you to track changes for
    # a single model with parent model. It takes an
    # optional notes. This method requires your controller
    # to respond to current_user, and current_user should
    # return a user object It works like this:
    #
    #  attribute_change_for_model('create!', blog_entry, comment) # without comment
    #  attribute_change_for_model('create!', blog_entry, comment, 'Created comment') # with comment
    #
    def attribute_change_for_model(action, ownable, trackable, notes=nil)
      Attributable::Activity.create!({ action: action, ownable: ownable, trackable: trackable, user: current_user, notes: notes })
    end

    # The method attribute_change_by_user allows you to track changes for
    # a single model without parent model. It takes an
    # optional notes. It works like this:
    #
    #  attribute_change_by_user('create!', blog_entry, user) # without comment
    #  attribute_change_by_user('create!', blog_entry, user, 'Created blog entry') # with comment
    #
    def attribute_change_by_user(action, trackable, user, notes=nil)
      Attributable::Activity.create!({ action: action, trackable: trackable, notes: notes, user: user })
    end

    # The method attribute_change_for_model_by_user allows you to track changes for
    # a single model with parent model. It takes an
    # optional notes. It works like this:
    #
    #  attribute_change_for_model_by_user('create!', blog_entry, comment) # without comment
    #  attribute_change_for_model_by_user('create!', blog_entry, comment, 'Created comment') # with comment
    #
    def attribute_change_for_model_by_user(action, ownable, trackable, user, notes=nil)
      Attributable::Activity.create!({ action: action, ownable: ownable, trackable: trackable, user: user, notes: notes })
    end

  end
end
