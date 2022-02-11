# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `activerecord-typedstore` gem.
# Please instead update this file by running `bin/tapioca gem activerecord-typedstore`.

module ActiveRecord
  class << self
    def eager_load!; end
    def gem_version; end
    def version; end
  end
end

class ActiveRecord::MigrationProxy < ::Struct
  def initialize(name, version, filename, scope); end

  def announce(*_arg0, &_arg1); end
  def basename; end
  def disable_ddl_transaction(*_arg0, &_arg1); end
  def filename; end
  def filename=(_); end
  def migrate(*_arg0, &_arg1); end
  def name; end
  def name=(_); end
  def scope; end
  def scope=(_); end
  def version; end
  def version=(_); end
  def write(*_arg0, &_arg1); end

  private

  def load_migration; end
  def migration; end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

module ActiveRecord::TypedStore; end

module ActiveRecord::TypedStore::Behavior
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::ActiveRecord::TypedStore::Behavior::ClassMethods

  def attribute?(attr_name); end
  def changes; end
  def clear_attribute_change(attr_name); end
  def read_attribute(attr_name); end
end

module ActiveRecord::TypedStore::Behavior::ClassMethods
  def define_attribute_methods; end
  def define_typed_store_attribute_methods; end
  def undefine_attribute_methods; end
  def undefine_before_type_cast_method(attribute); end
end

class ActiveRecord::TypedStore::DSL
  def initialize(attribute_name, options); end

  def accessors; end
  def any(name, **options); end
  def boolean(name, **options); end

  # Returns the value of attribute coder.
  def coder; end

  def date(name, **options); end
  def date_time(name, **options); end
  def datetime(name, **options); end
  def decimal(name, **options); end
  def default_coder(attribute_name); end

  # Returns the value of attribute fields.
  def fields; end

  def float(name, **options); end
  def integer(name, **options); end
  def keys(*_arg0, &_arg1); end
  def string(name, **options); end
  def text(name, **options); end
  def time(name, **options); end
end

ActiveRecord::TypedStore::DSL::NO_DEFAULT_GIVEN = T.let(T.unsafe(nil), Object)

module ActiveRecord::TypedStore::Extension
  def typed_store(store_attribute, options = T.unsafe(nil), &block); end
end

class ActiveRecord::TypedStore::Field
  def initialize(name, type, options = T.unsafe(nil)); end

  # Returns the value of attribute accessor.
  def accessor; end

  # Returns the value of attribute array.
  def array; end

  # Returns the value of attribute blank.
  def blank; end

  def cast(value); end

  # Returns the value of attribute default.
  def default; end

  def has_default?; end

  # Returns the value of attribute name.
  def name; end

  # Returns the value of attribute null.
  def null; end

  # Returns the value of attribute type.
  def type; end

  # Returns the value of attribute type_sym.
  def type_sym; end

  private

  def extract_default(value); end
  def lookup_type(type, options); end
  def type_cast(value, arrayize: T.unsafe(nil)); end
end

ActiveRecord::TypedStore::Field::TYPES = T.let(T.unsafe(nil), Hash)

module ActiveRecord::TypedStore::IdentityCoder
  extend ::ActiveRecord::TypedStore::IdentityCoder

  def dump(data); end
  def load(data); end
end

class ActiveRecord::TypedStore::Type < ::ActiveRecord::Type::Serialized
  def initialize(typed_hash_klass, coder, subtype); end

  def changed_in_place?(raw_old_value, value); end
  def default_value?(value); end
  def defaults; end
  def deserialize(value); end
  def serialize(value); end
  def type_cast_for_database(value); end
  def type_cast_from_database(value); end
  def type_cast_from_user(value); end
end

class ActiveRecord::TypedStore::TypedHash < ::ActiveSupport::HashWithIndifferentAccess
  def initialize(constructor = T.unsafe(nil)); end

  def []=(key, value); end
  def defaults_hash(*_arg0, &_arg1); end
  def except(*_arg0, &_arg1); end
  def fields(*_arg0, &_arg1); end
  def merge!(other_hash); end
  def slice(*_arg0, &_arg1); end
  def store(key, value); end
  def update(other_hash); end
  def with_indifferent_access(*_arg0, &_arg1); end
  def without(*_arg0, &_arg1); end

  private

  def cast_value(key, value); end

  class << self
    def create(fields); end
    def defaults_hash; end

    # Returns the value of attribute fields.
    def fields; end
  end
end

ActiveRecord::UnknownAttributeError = ActiveModel::UnknownAttributeError