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

def find_pet_by_name(pet_shop, name_string)
  # will only find the first pet with a given name if there are multiples
  for pet in pet_shop[:pets]
    return pet if pet[:name] == name_string
  end
  return nil
end

def remove_pet_by_name(pet_shop, name_string)
  # Not sure what I should return here?
  pets = pet_shop[:pets]
  for pet in pets
    pets.delete(pet) if pet[:name] == name_string
  end
  return pet_shop
end

def add_pet_to_stock(pet_shop, new_pet_hash)
  # # I don't like the original test for this! # #
  # # It would pass if I added ANYTHING AT ALL to the :pets array # #
  pet_shop[:pets].push(new_pet_hash)
  return pet_shop
end

def customer_pet_count(customer)
  # customer must be specified by customer_array[index]
  # and I don't know how to show that in my variable name
  return customer[:pets].count
end


def add_pet_to_customer(customer, new_pet)
  # Assumes the new pet is not bought from the petshop
  # Test does not check that the pet has been added
  # Just that SOMETHING has been added.
  "something"
  customer[:pets].push(new_pet)
  return customer
end

# # OPTIONAL # #

def customer_can_afford_pet(customer, new_pet)
  if new_pet[:price] > customer[:cash]
    return false
  end
  return true
end




# def test_customer_can_afford_pet__insufficient_funds
#   customer = @customers[1]
#   can_buy_pet = customer_can_afford_pet(customer, @new_pet)
#   assert_equal(false, can_buy_pet)
# end


# def test_customer_can_afford_pet__sufficient_funds
#   customer = @customers[0]
#   can_buy_pet = customer_can_afford_pet(customer, @new_pet)
#   assert_equal(true, can_buy_pet)
# end

# #These are 'integration' tests so we want multiple asserts.
# #If one fails the entire test should fail
# def test_sell_pet_to_customer__pet_found
#   customer = @customers[0]
#   pet = find_pet_by_name(@pet_shop,"Arthur")

#   sell_pet_to_customer(@pet_shop, pet, customer)

#   assert_equal(1, customer_pet_count(customer))
#   assert_equal(1, pets_sold(@pet_shop))
#   assert_equal(1900, total_cash(@pet_shop))
# end

# def test_sell_pet_to_customer__pet_not_found
#   customer = @customers[0]
#   pet = find_pet_by_name(@pet_shop,"Dave")

#   sell_pet_to_customer(@pet_shop, pet, customer)

#   assert_equal(0, customer_pet_count(customer))
#   assert_equal(0, pets_sold(@pet_shop))
#   assert_equal(1000, total_cash(@pet_shop))
# end

# def test_sell_pet_to_customer__insufficient_funds
#   customer = @customers[1]
#   pet = find_pet_by_name(@pet_shop,"Arthur")

#   sell_pet_to_customer(@pet_shop, pet, customer)

#   assert_equal(0, customer_pet_count(customer))
#   assert_equal(0, pets_sold(@pet_shop))
#   assert_equal(1000, total_cash(@pet_shop))
# end
