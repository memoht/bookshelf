module Bookshelf
  module Operations
    module Books
      class GenerateBarcode
        def call(isbn)
          require "barby/barcode/ean_13"
          require "barby/outputter/svg_outputter"

          # ISBN-13 uses EAN-13 format
          barcode = Barby::EanThirteen.new(isbn.to_s.gsub(/[^0-9]/, ''))

          Barby::SvgOutputter.new(barcode).to_svg(margin: 10, height: 50)
        end
      end
    end
  end
end
