Specifications for the Rails Assessment Specs:

•   Using Ruby on Rails for the project

•   Include at least one “has_many” relationship

Here are the “has_many” relationships:
    ·	An employee has many sales
    ·	A product has many sales

•   Include at least one “belongs_to” relationship:

Here are the “belongs_to” relationship:
    ·	A sale belongs to an employee
    ·	A sale belongs to a product

•   Include at least two “has_many through” relationships.

Here are the “has_many through” relationships:
    ·	An employee “has many” products through sales
    ·	A product “has many: employees through sales

•   The "through" part of the “has_many through” includes at least one user submittable attribute, e.g., some attribute other than “foreign keys” that can be submitted by the app's user.

•    Include reasonable validations for simple model objects:

        class Employee < ApplicationRecord
            validates_uniqueness_of :email, presence: true
            validates_uniqueness_of :name,  presence: true
            validates :region, :presence => true, :on => :update
            validates :position, :presence => true, :on =>:update

        class Product < ApplicationRecord
            validates :name, uniqueness: true, allow_blank: false
            validates  :description, presence: true, allow_blank: false

        class Sale < ApplicationRecord
            validates :employee_name, presence: true
            validates :product_name, presence: true
            validates :sales_rate, presence: true
            validates :quantity, presence: true
            validates :commission_rate, presence: true


•   Include a class level ActiveRecord scope method.
        The class level ActiveRecord scope method for this application is region

•   Include signup – Devise gem

•   Include login - Devise gem and OmniAuth Amazon gem

•   Include logout and password – Devise gem

•   Include OmniAuth signup/login - OmniAuth Amazon

•   Include nested resource show or index.

    a) Here is the nested resource:
        resources :employees do
            resources :sales, only: [:show, :new, :create]
        end

    b) Here is the example of nested show route:  “/employees/1/sales/1”

•   Include nested resource "new" form.

    Here is the example nested resource new route: “/employees/1/sales/new”

•   Include form display of validation errors.

        a) The validation errors are in “views/layouts/errors”

        b) Here is the code for the error message:

        <% if target.errors.any? %>
        <div id="error_explanation">
            <%= pluralize(target.errors.count, "error") %>
            prohibited this sales from being saved:
            <ul>
            <% target.errors.full_messages.each do |msg| %>
            <li><%= msg %></li>
            <% end %>
            </ul>
        </div>
        <% end %>

        c) Here is the example of an error in browser:

            1 error prohibited this sales from being saved:
                •	Description can't be blank


Confirm:

•   The application is DRY
        Partials were created and helper methods were created

•   Limited logic in controllers
	    Business logic were implemented tin the models

•   Views use helper methods if appropriate
	    Helper methods were created so we can call the methods in the views


•   Views use partials if appropriate