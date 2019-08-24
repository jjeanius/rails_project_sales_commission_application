 Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship:
  Here are the has_many relationships:
   · An employee has many sales
   · A product has many sales

- [x] Include at least one belongs_to relationship:
  Here are the belongs_to relationships:
   · A sale belongs to an employee; A sale belongs to a product

- [x] Include at least two has_many through relationships
  Here are has_many through relationships:
   · An employee has many products through sales
   · A product has many employees through sales

- [x] The "through" part of the has_many through includes at least one user submittable attribute,  is to say, some attribute other than its foreign keys that can be submitted by the app's user
    sales migration table has attribute other than the foreign keys

- [x] Include reasonable validations for simple model objects:
  Here are the validations for the three models: 

    1. class Employee < ApplicationRecord
        validates_uniqueness_of :email, presence: true
        validates_uniqueness_of :name,  presence: true
        validates :region, :presence => true, :on => :update
        validates :position, :presence => true, :on =>:update

    2. class Product < ApplicationRecord
        has_many :sales
        has_many :employees, through: :sales
        validates :name, uniqueness: true, allow_blank: false
        validates  :description, presence: true, allow_blank: false

    3. class Sale < ApplicationRecord
        validates :employee_name, presence: true
        validates :product_name, presence: true
        validates :sales_rate, presence: true
        validates :quantity, presence: true
        validates :commission_rate, presence: true

- [x] Include a class level ActiveRecord scope method:  region
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index
        URL /employees/1/sales/1
- [x] Include nested resource "new" form
        URL /employees/1/sales/new
- [x] Include form display of validation errors

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
