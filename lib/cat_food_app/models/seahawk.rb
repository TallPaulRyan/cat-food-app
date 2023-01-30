module CatFoodApp
  module Animals
    class Seahawk

      attr_reader :name

      def initialize attributes
        @name = attributes[:name]
      end

      def == other
        other.is_a?(Seahawk) && other.name == self.name
      end

    end
  end
end