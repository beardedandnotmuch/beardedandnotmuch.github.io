require 'html/pipeline'
require 'html/pipeline/rouge_filter'
require 'html/pipeline/redcarpet_filter'

class HtmlPipelineFilter < Nanoc::Filter
  identifier :html_pipeline

  def run(content, params = {})
    options = {:pipeline => []}.merge(params)

    filters = options.delete(:pipeline).map do |f|
      if self.class.is_filter(f)
        f
      else
        key = self.class.filter_key(f)
        filter = HTML::Pipeline.constants.find { |c| c.downcase == key }
        # possibly a custom filter
        if filter.nil?
          Nanoc.const_get(f)
        else
          HTML::Pipeline.const_get(filter)
        end
      end
    end

    HTML::Pipeline.new(filters, options).to_html(content)
  end

  def self.filter_key(s)
    s.to_s.downcase.to_sym
  end

  def self.is_filter(f)
    f < HTML::Pipeline::Filter
  rescue LoadError, ArgumentError
    false
  end
end
