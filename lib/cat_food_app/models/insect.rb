module CatFoodApp
  module Animals
    class Insect

      attr_reader :name

      def initialize attributes
        @name = attributes[:name]
      end

      def == other
        other.is_a?(Insect) && other.name == self.name
      end

    end
  end
end