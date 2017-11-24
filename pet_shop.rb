# pet_shop.rb

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,money_amount)
  pet_shop[:admin][:total_cash] += money_amount
end

def pets_sold(pet_shop) #actually number_of_pets_sold
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number_sold)
  pet_shop[:admin][:pets_sold] += number_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].count
end

def pets_by_breed(pet_shop, breed_string)
  pets_of_breed = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed_string
      pets_of_breed.push(pet)
    end
  end
  return pets_of_breed
end

# def test_all_pets_by_breed__found
#   pets = pets_by_breed(@pet_shop, "British Shorthair")
#   assert_equal(2, pets.count)
# end

# def test_all_pets_by_breed__not_found
#   pets = pets_by_breed(@pet_shop, "Dalmation")
#   assert_equal(0, pets.count)
# end

# def test_find_pet_by_name__returns_pet
#   pet = find_pet_by_name(@pet_shop, "Arthur")
#   assert_equal("Arthur", pet[:name])
# end

# def test_find_pet_by_name__returns_nil
#   pet = find_pet_by_name(@pet_shop, "Fred")
#   assert_nil(pet)
# end

# def test_remove_pet_by_name
#   remove_pet_by_name(@pet_shop, "Arthur")
#   pet = find_pet_by_name(@pet_shop,"Arthur")
#   assert_nil(pet)
# end

# def test_add_pet_to_stock
#   add_pet_to_stock(@pet_shop, @new_pet)
#   count = stock_count(@pet_shop)
#   assert_equal(7, count)
# end

# def test_customer_pet_count
#   count = customer_pet_count(@customers[0])
#   assert_equal(0, count)
# end

# def test_add_pet_to_customer
#   customer = @customers[0]
#   add_pet_to_customer(customer, @new_pet)
#   assert_equal(1, customer_pet_count(customer))
# end
