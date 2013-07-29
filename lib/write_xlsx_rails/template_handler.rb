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

      __workbook_defined = defined? workbook
      workbook = WriteXLSX.new(__io) unless __workbook_defined

      #{template.source}

      workbook.close unless __workbook_defined

      __io.flush
      __io.string
      TEMPLATE
    end

  end
end

ActionView::Template.register_template_handler :wxlsx, WriteXlsxRails::WriteXlsxBuilder