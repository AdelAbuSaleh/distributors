# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Orgnaization.create(
  name: 'AlRahma',
  slug: 'test',
  address: 'Jool Alsifa',
  phone_numbers: '309891',
  email: 'test@alrahma.com',
  services: 'Any thing you thing',
  status: 'active'
)

User.create(
  full_name: 'Adel Saleh',
  user_name: 'test',
  mobile: '736115019',
  email: 'adelsaleh46@gmail.com',
  city: 'Almukalla',
  region: 'Jool Alshifa',
  password: '123456',
  role: 'super_admin',
  status: 'active',
  orgnaization_id: 1
)

Invoice.create(
  name: 'AL-Ashdag',
  address: 'Bouash - Rokub',
  invoice_type: 1,
  invoice_number: '123',
  date: '13-04-2020',
  description: 'Test Invoice',
  orgnaization_id: 1
)

InvoiceInfo.create(
  invoice_id: 1,
  description: 'Test Theng',
  quantity: 3,
  price_of_one: 650,
  total_cost: 1950
)