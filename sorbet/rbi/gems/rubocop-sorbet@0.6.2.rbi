# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `rubocop-sorbet` gem.
# Please instead update this file by running `bin/tapioca gem rubocop-sorbet`.

module RuboCop; end
module RuboCop::Cop; end
module RuboCop::Cop::Sorbet; end

# This cop disallows using `.override(allow_incompatible: true)`.
# Using `allow_incompatible` suggests a violation of the Liskov
# Substitution Principle, meaning that a subclass is not a valid
# subtype of it's superclass. This Cop prevents these design smells
# from occurring.
class RuboCop::Cop::Sorbet::AllowIncompatibleOverride < ::RuboCop::Cop::Cop
  def allow_incompatible?(param0); end
  def allow_incompatible_override?(param0 = T.unsafe(nil)); end
  def not_nil?(node); end
  def on_send(node); end
  def sig?(param0); end
end

# This cop disallows binding the return value of `T.any`, `T.all`, `T.enum`
# to a constant directly. To bind the value, one must use `T.type_alias`.
class RuboCop::Cop::Sorbet::BindingConstantWithoutTypeAlias < ::RuboCop::Cop::Cop
  def autocorrect(node); end
  def binding_unaliased_type?(param0 = T.unsafe(nil)); end
  def dynamic_type_creation_with_block?(param0 = T.unsafe(nil)); end
  def generic_parameter_decl?(param0 = T.unsafe(nil)); end
  def method_needing_aliasing_on_t?(param0); end
  def not_dynamic_type_creation_with_block?(node); end
  def not_generic_parameter_decl?(node); end
  def not_nil?(node); end
  def not_t_let?(node); end
  def on_casgn(node); end
  def t_let?(param0 = T.unsafe(nil)); end
  def using_deprecated_type_alias_syntax?(param0 = T.unsafe(nil)); end
  def using_type_alias?(param0 = T.unsafe(nil)); end
end

# This cop ensures that callback conditionals are bound to the right type
# so that they are type checked properly.
class RuboCop::Cop::Sorbet::CallbackConditionalsBinding < ::RuboCop::Cop::Cop
  def autocorrect(node); end
  def on_send(node); end
end

RuboCop::Cop::Sorbet::CallbackConditionalsBinding::CALLBACKS = T.let(T.unsafe(nil), Array)

# This cop disallows the usage of `checked(true)`. This usage could cause
# confusion; it could lead some people to believe that a method would be checked
# even if runtime checks have not been enabled on the class or globally.
# Additionally, in the event where checks are enabled, `checked(true)` would
# be redundant; only `checked(false)` or `soft` would change the behaviour.
class RuboCop::Cop::Sorbet::CheckedTrueInSignature < ::RuboCop::Cop::Sorbet::SignatureCop
  include ::RuboCop::Cop::RangeHelp

  def offending_node(param0); end
  def on_signature(node); end
end

RuboCop::Cop::Sorbet::CheckedTrueInSignature::MESSAGE = T.let(T.unsafe(nil), String)

# This cop disallows the calls that are used to get constants fom Strings
# such as +constantize+, +const_get+, and +constants+.
#
# The goal of this cop is to make the code easier to statically analyze,
# more IDE-friendly, and more predictable. It leads to code that clearly
# expresses which values the constant can have.
class RuboCop::Cop::Sorbet::ConstantsFromStrings < ::RuboCop::Cop::Cop
  def constant_from_string?(param0 = T.unsafe(nil)); end
  def on_send(node); end
end

# This cop checks that the Sorbet sigil comes as the first magic comment in the file.
#
# The expected order for magic comments is: typed, (en)?coding, warn_indent then frozen_string_literal.
#
# For example, the following bad ordering:
#
# ```ruby
# class Foo; end
# ```
#
# Will be corrected as:
#
# ```ruby
# class Foo; end
# ```
#
# Only `typed`, `(en)?coding`, `warn_indent` and `frozen_string_literal` magic comments are considered,
# other comments or magic comments are left in the same place.
class RuboCop::Cop::Sorbet::EnforceSigilOrder < ::RuboCop::Cop::Sorbet::ValidSigil
  include ::RuboCop::Cop::RangeHelp

  def autocorrect(_node); end
  def investigate(processed_source); end

  protected

  # checks
  def check_magic_comments_order(tokens); end

  # Get all the tokens in `processed_source` that match `MAGIC_REGEX`
  def extract_magic_comments(processed_source); end
end

RuboCop::Cop::Sorbet::EnforceSigilOrder::CODING_REGEX = T.let(T.unsafe(nil), Regexp)
RuboCop::Cop::Sorbet::EnforceSigilOrder::FROZEN_REGEX = T.let(T.unsafe(nil), Regexp)
RuboCop::Cop::Sorbet::EnforceSigilOrder::INDENT_REGEX = T.let(T.unsafe(nil), Regexp)
RuboCop::Cop::Sorbet::EnforceSigilOrder::MAGIC_REGEX = T.let(T.unsafe(nil), Regexp)
RuboCop::Cop::Sorbet::EnforceSigilOrder::PREFERRED_ORDER = T.let(T.unsafe(nil), Hash)

# This cop checks that every method definition and attribute accessor has a Sorbet signature.
#
# It also suggest an autocorrect with placeholders so the following code:
#
# ```
# def foo(a, b, c); end
# ```
#
# Will be corrected as:
#
# ```
# sig { params(a: T.untyped, b: T.untyped, c: T.untyped).returns(T.untyped)
# def foo(a, b, c); end
# ```
#
# You can configure the placeholders used by changing the following options:
#
# * `ParameterTypePlaceholder`: placeholders used for parameter types (default: 'T.untyped')
# * `ReturnTypePlaceholder`: placeholders used for return types (default: 'T.untyped')
class RuboCop::Cop::Sorbet::EnforceSignatures < ::RuboCop::Cop::Sorbet::SignatureCop
  def initialize(config = T.unsafe(nil), options = T.unsafe(nil)); end

  def accessor?(param0 = T.unsafe(nil)); end
  def autocorrect(node); end
  def on_block(node); end
  def on_def(node); end
  def on_defs(node); end
  def on_send(node); end
  def scope(node); end

  private

  def check_node(node); end
  def param_type_placeholder; end
  def return_type_placeholder; end
end

class RuboCop::Cop::Sorbet::EnforceSignatures::SigSuggestion
  def initialize(indent, param_placeholder, return_placeholder); end

  # Returns the value of attribute params.
  def params; end

  # Sets the attribute params
  def params=(_arg0); end

  # Returns the value of attribute returns.
  def returns; end

  # Sets the attribute returns
  def returns=(_arg0); end

  def to_autocorrect; end

  private

  def generate_params; end
  def generate_return; end
end

# This cop makes the Sorbet `false` sigil mandatory in all files.
class RuboCop::Cop::Sorbet::FalseSigil < ::RuboCop::Cop::Sorbet::HasSigil
  def minimum_strictness; end
end

# This cop ensures RBI shims do not include a call to extend T::Sig
# or to extend T::Helpers
class RuboCop::Cop::Sorbet::ForbidExtendTSigHelpersInShims < ::RuboCop::Cop::Cop
  include ::RuboCop::Cop::RangeHelp

  def autocorrect(node); end
  def extend_t_helpers?(param0 = T.unsafe(nil)); end
  def extend_t_sig?(param0 = T.unsafe(nil)); end
  def on_send(node); end
end

RuboCop::Cop::Sorbet::ForbidExtendTSigHelpersInShims::MSG = T.let(T.unsafe(nil), String)
RuboCop::Cop::Sorbet::ForbidExtendTSigHelpersInShims::RESTRICT_ON_SEND = T.let(T.unsafe(nil), Array)

class RuboCop::Cop::Sorbet::ForbidIncludeConstLiteral < ::RuboCop::Cop::Cop
  def initialize(*_arg0); end

  def not_lit_const_include?(param0 = T.unsafe(nil)); end
  def on_send(node); end

  # Returns the value of attribute used_names.
  def used_names; end

  # Sets the attribute used_names
  def used_names=(_arg0); end
end

RuboCop::Cop::Sorbet::ForbidIncludeConstLiteral::MSG = T.let(T.unsafe(nil), String)

# This cop makes sure that RBI files are always located under sorbet/rbi/.
class RuboCop::Cop::Sorbet::ForbidRBIOutsideOfSorbetDir < ::RuboCop::Cop::Cop
  include ::RuboCop::Cop::RangeHelp

  def investigate(processed_source); end
end

RuboCop::Cop::Sorbet::ForbidRBIOutsideOfSorbetDir::PATH_REGEXP = T.let(T.unsafe(nil), Regexp)

class RuboCop::Cop::Sorbet::ForbidSuperclassConstLiteral < ::RuboCop::Cop::Cop
  def not_lit_const_superclass?(param0 = T.unsafe(nil)); end
  def on_class(node); end
end

RuboCop::Cop::Sorbet::ForbidSuperclassConstLiteral::MSG = T.let(T.unsafe(nil), String)

# This cop disallows using `T.unsafe` anywhere.
class RuboCop::Cop::Sorbet::ForbidTUnsafe < ::RuboCop::Cop::Cop
  def on_send(node); end
  def t_unsafe?(param0 = T.unsafe(nil)); end
end

# This cop disallows use of `T.untyped` or `T.nilable(T.untyped)`
# as a prop type for `T::Struct`.
class RuboCop::Cop::Sorbet::ForbidUntypedStructProps < ::RuboCop::Cop::Cop
  def on_class(node); end
  def subclass_of_t_struct?(param0 = T.unsafe(nil)); end
  def t_nilable_untyped(param0 = T.unsafe(nil)); end
  def t_struct(param0 = T.unsafe(nil)); end
  def t_untyped(param0 = T.unsafe(nil)); end
  def untyped_props(param0); end
end

RuboCop::Cop::Sorbet::ForbidUntypedStructProps::MSG = T.let(T.unsafe(nil), String)

# This cop makes the Sorbet typed sigil mandatory in all files.
#
# Options:
#
# * `SuggestedStrictness`: Sorbet strictness level suggested in offense messages (default: 'false')
# * `MinimumStrictness`: If set, make offense if the strictness level in the file is below this one
#
# If a `MinimumStrictness` level is specified, it will be used in offense messages and autocorrect.
class RuboCop::Cop::Sorbet::HasSigil < ::RuboCop::Cop::Sorbet::ValidSigil
  def require_sigil_on_all_files?; end
end

# This cop makes the Sorbet `ignore` sigil mandatory in all files.
class RuboCop::Cop::Sorbet::IgnoreSigil < ::RuboCop::Cop::Sorbet::HasSigil
  def minimum_strictness; end
end

# This cop checks for the ordering of keyword arguments required by
# sorbet-runtime. The ordering requires that all keyword arguments
# are at the end of the parameters list, and all keyword arguments
# with a default value must be after those without default values.
class RuboCop::Cop::Sorbet::KeywordArgumentOrdering < ::RuboCop::Cop::Sorbet::SignatureCop
  def on_signature(node); end

  private

  def check_order_for_kwoptargs(parameters); end
end

# This cop ensures one ancestor per requires_ancestor line
# rather than chaining them as a comma-separated list.
class RuboCop::Cop::Sorbet::OneAncestorPerLine < ::RuboCop::Cop::Cop
  def abstract?(param0); end
  def autocorrect(node); end
  def more_than_one_ancestor(param0 = T.unsafe(nil)); end
  def on_class(node); end
  def on_module(node); end
  def requires_ancestors(param0); end

  private

  def new_ra_line(indent_count); end
  def process_node(node); end
end

RuboCop::Cop::Sorbet::OneAncestorPerLine::MSG = T.let(T.unsafe(nil), String)

# This cop checks for inconsistent ordering of parameters between the
# signature and the method definition. The sorbet-runtime gem raises
# when such inconsistency occurs.
class RuboCop::Cop::Sorbet::ParametersOrderingInSignature < ::RuboCop::Cop::Sorbet::SignatureCop
  def on_signature(node); end
  def signature_params(param0); end

  private

  def check_for_inconsistent_param_ordering(sig_params_order, parameters); end
  def extract_parameters(sig_params); end
end

class RuboCop::Cop::Sorbet::SignatureBuildOrder < ::RuboCop::Cop::Sorbet::SignatureCop
  def autocorrect(node); end
  def on_signature(node); end
  def root_call(param0); end

  private

  def call_chain(sig_child_node); end
  def can_autocorrect?; end

  # This method exists to reparse the current node with modern features enabled.
  # Modern features include "index send" emitting, which is necessary to unparse
  # "index sends" (i.e. `[]` calls) back to index accessors (i.e. as `foo[bar]``).
  # Otherwise, we would get the unparsed node as `foo.[](bar)`.
  def node_reparsed_with_modern_features(node); end
end

# Create a subclass of AST Builder that has modern features turned on
class RuboCop::Cop::Sorbet::SignatureBuildOrder::ModernBuilder < ::RuboCop::AST::Builder; end

RuboCop::Cop::Sorbet::SignatureBuildOrder::ORDER = T.let(T.unsafe(nil), Hash)

# Abstract cop specific to Sorbet signatures
#
# You can subclass it to use the `on_signature` trigger and the `signature?` node matcher.
class RuboCop::Cop::Sorbet::SignatureCop < ::RuboCop::Cop::Cop
  def on_block(node); end
  def on_signature(_); end
  def signature?(param0 = T.unsafe(nil)); end
end

# This cop ensures empty class/module definitions in RBI files are
# done on a single line rather than being split across multiple lines.
class RuboCop::Cop::Sorbet::SingleLineRbiClassModuleDefinitions < ::RuboCop::Cop::Cop
  def autocorrect(node); end
  def on_class(node); end
  def on_module(node); end

  protected

  def convert_newlines(source); end
  def process_node(node); end
end

RuboCop::Cop::Sorbet::SingleLineRbiClassModuleDefinitions::MSG = T.let(T.unsafe(nil), String)

# This cop makes the Sorbet `strict` sigil mandatory in all files.
class RuboCop::Cop::Sorbet::StrictSigil < ::RuboCop::Cop::Sorbet::HasSigil
  def minimum_strictness; end
end

# This cop makes the Sorbet `strong` sigil mandatory in all files.
class RuboCop::Cop::Sorbet::StrongSigil < ::RuboCop::Cop::Sorbet::HasSigil
  def minimum_strictness; end
end

# This cop makes the Sorbet `true` sigil mandatory in all files.
class RuboCop::Cop::Sorbet::TrueSigil < ::RuboCop::Cop::Sorbet::HasSigil
  def minimum_strictness; end
end

# This cop checks that every Ruby file contains a valid Sorbet sigil.
# Adapted from: https://gist.github.com/clarkdave/85aca4e16f33fd52aceb6a0a29936e52
#
# Options:
#
# * `RequireSigilOnAllFiles`: make offense if the Sorbet typed is not found in the file (default: false)
# * `SuggestedStrictness`: Sorbet strictness level suggested in offense messages (default: 'false')
# * `MinimumStrictness`: If set, make offense if the strictness level in the file is below this one
#
# If a `MinimumStrictness` level is specified, it will be used in offense messages and autocorrect.
class RuboCop::Cop::Sorbet::ValidSigil < ::RuboCop::Cop::Cop
  def autocorrect(_node); end
  def investigate(processed_source); end

  protected

  # checks
  def check_sigil_present(sigil); end

  def check_strictness_level(sigil, strictness); end
  def check_strictness_not_empty(sigil, strictness); end
  def check_strictness_valid(sigil, strictness); end

  # extraction
  def extract_sigil(processed_source); end

  def extract_strictness(sigil); end

  # Default is `nil`
  def minimum_strictness; end

  # Default is `false`
  def require_sigil_on_all_files?; end

  # Default is `'false'`
  def suggested_strictness; end

  def suggested_strictness_level(minimum_strictness, suggested_strictness); end
end

RuboCop::Cop::Sorbet::ValidSigil::SIGIL_REGEX = T.let(T.unsafe(nil), Regexp)
RuboCop::Cop::Sorbet::ValidSigil::STRICTNESS_LEVELS = T.let(T.unsafe(nil), Array)
RuboCop::NodePattern = RuboCop::AST::NodePattern
RuboCop::ProcessedSource = RuboCop::AST::ProcessedSource
module RuboCop::Sorbet; end
RuboCop::Sorbet::CONFIG = T.let(T.unsafe(nil), Hash)
RuboCop::Sorbet::CONFIG_DEFAULT = T.let(T.unsafe(nil), Pathname)
class RuboCop::Sorbet::Error < ::StandardError; end

# Because RuboCop doesn't yet support plugins, we have to monkey patch in a
# bit of our configuration.
module RuboCop::Sorbet::Inject
  class << self
    def defaults!; end
  end
end

RuboCop::Sorbet::PROJECT_ROOT = T.let(T.unsafe(nil), Pathname)
RuboCop::Sorbet::VERSION = T.let(T.unsafe(nil), String)
RuboCop::Token = RuboCop::AST::Token