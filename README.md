# Attributable

Attributable is a Ruby on Rails plugin that allows you to track activities and notes for ActiveRecord models within your database

## Installation

Add the following line to your Gemfile

    gem 'attributable', github: 'entropillc/attributable'

Run the installer

    rails g attributable:install

# Usage

Attributable contains a model called Activity which stores data attributable to a model with the database. Attributable also add
a method to the application controller called attribute_activity to the application controller. 