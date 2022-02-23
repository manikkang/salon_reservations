module Arrays
    extend ActiveSupport::Concern

    def subtract_each_array_item(array_a, array_b)
        return array_a if array_b.blank?
        counts = array_b.inject(Hash.new(0)){ |h, v| h[v] += 1; h}
        array_a.reject { |e| counts[e] -= 1 unless counts[e]&.zero? }
    end
end