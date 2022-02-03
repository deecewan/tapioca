# typed: strict
# frozen_string_literal: true

require "tapioca/helpers/test/content"
require "tapioca/helpers/test/isolation"
require "tapioca/helpers/test/template"

module Tapioca
  module Helpers
    module Test
      module DslCompiler
        extend T::Sig
        extend T::Helpers

        include Isolation
        include Content
        include Template

        requires_ancestor { Kernel }

        sig { params(compiler_class: T.class_of(Tapioca::Compilers::Dsl::Base)).void }
        def use_dsl_compiler(compiler_class)
          @context = T.let(CompilerContext.new(compiler_class), T.nilable(CompilerContext))
        end

        sig { params(compiler_classes: T.class_of(Tapioca::Compilers::Dsl::Base)).void }
        def activate_other_dsl_compilers(*compiler_classes)
          context.activate_other_dsl_compilers(compiler_classes)
        end

        sig { params(constant_name: T.any(Symbol, String)).returns(String) }
        def rbi_for(constant_name)
          context.rbi_for(constant_name)
        end

        sig { returns(T::Array[String]) }
        def gathered_constants
          context.gathered_constants
        end

        sig { returns(T::Array[String]) }
        def generated_errors
          context.errors
        end

        sig { returns(CompilerContext) }
        def context
          raise "Please call `use_dsl_compiler` before" unless @context
          @context
        end

        class CompilerContext
          extend T::Sig

          sig { returns(T.class_of(Tapioca::Compilers::Dsl::Base)) }
          attr_reader :compiler_class

          sig { returns(T::Array[T.class_of(Tapioca::Compilers::Dsl::Base)]) }
          attr_reader :other_compiler_classes

          sig { params(compiler_class: T.class_of(Tapioca::Compilers::Dsl::Base)).void }
          def initialize(compiler_class)
            @compiler_class = compiler_class
            @other_compiler_classes = T.let([], T::Array[T.class_of(Tapioca::Compilers::Dsl::Base)])
            @compiler = T.let(nil, T.nilable(Tapioca::Compilers::Dsl::Base))
            @pipeline = T.let(nil, T.nilable(Tapioca::Compilers::DslCompiler))
          end

          sig { params(compiler_classes: T::Array[T.class_of(Tapioca::Compilers::Dsl::Base)]).void }
          def activate_other_dsl_compilers(compiler_classes)
            @other_compiler_classes = compiler_classes
          end

          sig { returns(T::Array[T.class_of(Tapioca::Compilers::Dsl::Base)]) }
          def activated_compiler_classes
            [compiler_class, *other_compiler_classes]
          end

          sig { returns(T::Array[String]) }
          def gathered_constants
            compiler.processable_constants.map(&:name).compact.sort
          end

          sig { params(constant_name: T.any(Symbol, String)).returns(String) }
          def rbi_for(constant_name)
            # Make sure this is a constant that we can handle.
            unless gathered_constants.include?(constant_name.to_s)
              raise "`#{constant_name}` is not processable by the `#{compiler_class}` generator."
            end

            file = RBI::File.new(strictness: "strong")
            constant = Object.const_get(constant_name)

            compiler.decorate(file.root, constant)

            file.transformed_string
          end

          sig { returns(T::Array[String]) }
          def errors
            compiler.errors
          end

          private

          sig { returns(Tapioca::Compilers::Dsl::Base) }
          def compiler
            @compiler ||= T.must(pipeline.generators.grep(compiler_class).first)
          end

          sig { returns(Tapioca::Compilers::DslCompiler) }
          def pipeline
            @pipeline ||= Tapioca::Compilers::DslCompiler.new(
              requested_constants: [],
              requested_generators: activated_compiler_classes
            )
          end
        end
      end
    end
  end
end