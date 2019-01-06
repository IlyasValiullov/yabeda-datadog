# frozen_string_literal: true

require "dogapi"
require "yabeda/base_adapter"

module Yabeda
  module Datadog
    class Adapter < BaseAdapter
      def registry
        validate_config!

        @registry ||= ::Dogapi::Client.new(
          Yabeda.datadog_api_key,
          Yabeda.datadog_app_key,
        )
      end

      def register_counter!(metric)
        # Do nothing. Datadog don't need to register metrics
      end

      def perform_counter_increment!(metric, tags, _by)
        registry.emit_point(
          build_name(metric),
          metric.values[tags],
          type: "counter",
          host: Yabeda.host,
          device: metric.group,
          tags: build_tags(tags),
        )
      end

      def register_gauge!(metric)
        # Do nothing. Datadog don't need to register metrics
      end

      def perform_gauge_set!(metric, tags, value)
        registry.emit_point(
          build_name(metric),
          value,
          type: "gauge",
          host: Yabeda.host,
          device: metric.group,
          tags: build_tags(tags),
        )
      end

      def register_histogram!(metric)
        # Do nothing. Datadog don't need to register metrics
      end

      def perform_histogram_measure!(metric, tags, value)
        perform_gauge_set!(metric, tags, value)
      end

      def build_name(metric)
        [metric.name, metric.unit].compact.join("_").to_sym
      end

      def build_tags(tags)
        tags.map { |k, v| "#{k}:#{v}" }
      end

      def validate_config!
        return unless Yabeda.datadog_app_key.nil? || Yabeda.datadog_api_key.nil?

        raise StandardError,
              "Datadog requires datadog_app_key and datadog_api_key params"
      end

      Yabeda.register_adapter(:datadog, new)
    end
  end
end
