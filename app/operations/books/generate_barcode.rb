module Bookshelf
  module Operations
    module Books
      class GenerateBarcode
        def call(isbn)
          require "barby"
          require "barby/barcode/bookland"
          require "barby/outputter/svg_outputter"

          digits = isbn.to_s.gsub(/[^0-9xX]/, '')
          return nil if digits.empty?

          barcode = Barby::Bookland.new(digits)
          Barby::SvgOutputter.new(barcode).to_svg(margin: 10, height: 100, xdim: 2)
        rescue ArgumentError
          nil
        end
      end
    end
  end
end
