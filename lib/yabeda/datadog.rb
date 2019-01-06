# frozen_string_literal: true

require "yabeda/datadog/version"
require "yabeda/datadog/adapter"
require "yabeda/datadog/dsl"

module Yabeda
  module Datadog
  end

  include Datadog::DSL
end
