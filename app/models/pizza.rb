class Pizza < ApplicationRecord
    validates :name, presence: true
    validate :unique_toppings_combination

    def toppings_list
        toppings.present? ? toppings.split(', ') : []
    end

    def toppings_list=(values)
        self.toppings = values.reject(&:blank?).join(', ')
    end

    private
    def unique_toppings_combination
        existing_pizza = Pizza.find_by(toppings: toppings)
        if Pizza.where(toppings: toppings).exists?
            errors.add(toppings, "> this combination of toppings already exists on another pizza: #{existing_pizza.name}!")
        end
    end
end
