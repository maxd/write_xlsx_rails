require 'action_view'

module WriteXlsxRails
  class WriteXlsxBuilder

    def default_format
      Mime::XLSX
    end

    def self.call(template)
      <<-TEMPLATE
      require 'stringio'

      __io = StringIO.new
      workbook = WriteXLSX.new(__io)

      #{template.source}

      workbook.close

      __io.flush
      __io.string
      TEMPLATE
    end

  end
end

ActionView::Template.register_template_handler :wxlsx, WriteXlsxRails::WriteXlsxBuilder