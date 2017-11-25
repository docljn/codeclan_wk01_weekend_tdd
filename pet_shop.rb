# pet_shop.rb

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end


def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, money_amount)
  # I'd prefer if this were named add_or_remove_cash_shop
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
  # at this stage at least...
  # Test does not check that the pet has been added
  # Just that SOMETHING has been added.
  customer[:pets].push(new_pet)
  return customer
end

# # OPTIONAL # #

def customer_can_afford_pet(customer, pet)
  # need to add a conditional to check that the price has been set?
  if pet == nil
    return "That pet is not for sale."
  end
  # my original solution started here
  if pet[:price] > customer[:cash]
    return false
  end
  return true
end

# # I HAVE ADDED THESE INDIVIDUAL METHODS PLUS TESTS # #
# not sure if this is needed at present, but likely to be useful?
def find_customer_by_name(customer_list, customer_name)
  for customer in customer_list
    return customer if customer[:name] == customer_name
  end
  return nil
end

# Doesn't use the 'find_customer_by_name' but could?
def spend_cash_customer(customer, money_amount)
  customer[:cash] -= money_amount
end

# # END OF ADDED INDIVIDUAL METHODS # #


# INTEGRATING ALL sMETHODS

def sell_pet_to_customer(pet_shop, pet, customer)
  # check pet is in pet_shop AND
  # check customer can afford pet
  if pet == nil
    return
  end
  if find_pet_by_name(pet_shop, pet[:name]) && customer_can_afford_pet(customer, pet)
    # add price to pet shop funds
    add_or_remove_cash(pet_shop,pet[:price])
    # remove price from customer funds
    # # THIS DOESN'T EXIST IN THE INITIAL SPEC # #
    # # add_or_remove_cash and total_cash apply only to the pet_shop
    spend_cash_customer(customer, pet[:price])

    # delete pet from pet shop[:pets]
    remove_pet_by_name(pet_shop, pet[:name])
    # increase number of pets sold
    increase_pets_sold(pet_shop, 1)
    # add pet to customer[:pets]
    add_pet_to_customer(customer, pet)
  end
end
