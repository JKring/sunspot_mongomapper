require 'sunspot'
require 'mongo_mapper'
require 'sunspot/rails'
require 'yaml'


# == Examples:
#
# class Post
#   include MongoMapper::Document
#   field :title
#
#   include Sunspot::MongoMapper
#   searchable do
#     text :title
#   end
# end
#

module Sunspot
  module MongoMapper
    def self.included(base)
      base.class_eval do
        extend Sunspot::Rails::Searchable::ActsAsMethods
        extend Sunspot::MongoMapper::ActsAsMethods
        Sunspot::Adapters::DataAccessor.register(DataAccessor, base)
        Sunspot::Adapters::InstanceAdapter.register(InstanceAdapter, base)
        after_destroy :_remove_index
        after_save :_update_index
      end
    end

    module ActsAsMethods
      # ClassMethods isn't loaded until searchable is called so we need
      # call it, then extend our own ClassMethods.
      def searchable (opt = {}, &block)
        super
        extend ClassMethods
      end
    end

    module ClassMethods
      # The sunspot solr_index method is very dependent on ActiveRecord, so
      # we'll change it to work more efficiently with Mongoid.
      def solr_index(opt={})
        Sunspot.index!(all)
      end
    end


    class InstanceAdapter < Sunspot::Adapters::InstanceAdapter
      def id
        @instance.id.to_s
      end
    end

    class DataAccessor < Sunspot::Adapters::DataAccessor
      def load(id)
        find(id).first
      end

      def load_all(ids)
        find(ids)
      end

      private

      def find(id)
        @clazz.find(id)
      end
    end

    def _remove_index
      Sunspot.remove! self
    end

    def _update_index
      Sunspot.index! self
    end
  end
end
