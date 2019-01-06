# frozen_string_literal: true

module Yabeda
  module Datadog
    module DSL
      def self.included(base)
        base.module_eval do
          mattr_accessor :host, :datadog_api_key, :datadog_app_key
        end
      end
    end
  end
end
