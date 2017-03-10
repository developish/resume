require 'rubygems'
require 'bundler/setup'
require 'wicked_pdf'

class Resume

  def initialize
    WickedPdf.config = {
      page_size: 'Letter',
      exe_path: File.join("/usr/local/bin/wkhtmltopdf-wrapper")
    }
  end

  def generate
    pdf = WickedPdf.new.pdf_from_html_file(input_file)

    File.open(output_path, "wb") do |file|
      file << pdf
    end
  end

  private

  def input_file
    File.join(current_dir, "index.html")
  end

  def output_path
    File.join(current_dir, "resumé.pdf")
  end

  def current_dir
    File.expand_path(File.dirname(__FILE__))
  end
end

Resume.new.generate
