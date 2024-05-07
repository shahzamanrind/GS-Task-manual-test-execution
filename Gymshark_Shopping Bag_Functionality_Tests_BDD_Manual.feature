Feature: As a customer, I want to be able to browse, add, and remove items from my shopping bag on Gymshark.com, so that I can easily manage my purchases
    ###Individual Scenarios: Add products to the shopping bag: Verify adding individual products to the shopping bag (e.g., Gymshark Rib Long Sleeve Top, Gymshark Rib T-Shirt), Remove a product from the shopping bag: Verify product removal from the shopping bag.###
    #Remove all products from the shopping bag: Verify removing all products and displaying the empty bag message and elements (e.g., "Your bag is empty", "SHOP MENS" button).

        Background:
            Given the test user opens url "https://uk.gymshark.com/"
        Scenario Outline: Add products to the shopping bag with size selection
            Given test user is on the home page of the online store
             When test user searches for a product "<product_name>"
              And test user clicks on the first product search result
              And test user selects the size "<size>" by clicking the "<size_button>" button
              And test user adds the product to the shopping bag
             Then test user should see a confirmation message that the product has been added
              And the shopping bag icon should reflect the updated item count
        Examples:
                  | product_name                   | size   | size_button |
                  | "Gymshark Rib Long Sleeve Top" | Medium | "M"         |
                  | "Gymshark Rib T-Shirt"         | Large  | "L"         |
                  | "Gymshark Fleece Zip Hoodie"   | XL     | "XL"        |

        Scenario Outline: Remove all products from the shopping bag
            Given the test user has added multiple products to the shopping bag
             When the test user navigates to the shopping bag page
              And the test user locates the product "<product_name>" in the bag
              And the test user clicks the "<delete_icon>" button for that product
             Then the toast message "<toast_message>" is visible for 2 seconds
              And the test user confirms that the product has been removed from the bag.
             Then all products should be removed from the shopping bag
              And the shopping bag should be empty
              And the test user verifies that the empty-bag image is visible
              And the test user confirms that the "<empty_title>" heading is visible
              And the test user confirms that the "<sub_title_text>" heading is visible
              And the test user verifies the "SHOP MENS" button is visible
              And the test user verifies the "SHOP WOMENS" button is visible

        Examples:
                  | product_name                   | delete_icon   | toast_message                       | empty_title         | sub_title_text                      |
                  | "Gymshark Rib Long Sleeve Top" | "icon-delete" | "You removed an item from your bag" | "Your bag is empty" | "There are no products in your bag" |
                  | "Gymshark Rib T-Shirt"         | "icon-delete" | "You removed an item from your bag" | "Your bag is empty" | "There are no products in your bag" |
                  | "Gymshark Fleece Zip Hoodie"   | "icon-delete" | "You removed an item from your bag" | "Your bag is empty" | "There are no products in your bag" |

#########This is second method to write BDD#
Feature: Gymshark Shopping Bag Functionality: Search, Add, Remove Single/All Products, Empty Bag Stateg, As a customer, I want to be able to browse, add, and remove items from my shopping bag on Gymshark.com, so that I can easily manage my purchases.
        Background:
            Given the test user opens url "https://uk.gymshark.com/"

        Scenario Outline: User navigates, searches, selects, adds, verifies, and manages products in Gymshark Shopping Cart
            Given the user opens the Gymshark website
             When the user searches for women's T-shirts & Tops
             Then the user verifies the page title "Gym Tops & Gym T-Shirts for Women - Gymshark"
             When the user selects a product category (Long Sleeve, Short Sleeve, etc.) from the Product Type dropdown
             Then the user verifies the URL reflects the chosen category selection

        # Add the first product
             When the user selects a product (e.g., "{firstProductName}")
             Then the user verifies the product page is displayed
             When the user selects a size (e.g., "Medium") and clicks "ADD TO BAG"
             Then the user verifies:
                * "ADD TO BAG" button is disabled (selected)
                * Product "{firstProductName}" is added to their bag
                * Delete Icon button is visible
                * Wishlist heart icon button is visible
                * Qty dropdown value "1" is selected
                * Subtotal text and amount

        # Add additional products (optional)
        # You can add steps here to add more products as needed
             When the user selects another product (e.g., "{secondProductName}")
             Then the user selects a size (e.g., "Large") and clicks "ADD TO BAG"
             Then the user verifies "{secondProductName}" is added to the bag successfully
             When the user selects another product (e.g., "{thirdProductName}")
             Then the user selects a size (e.g., "XL") and clicks "ADD TO BAG"
             Then the user verifies "{thirdProductName}" is added to the bag successfully
             
        # Verification after adding products
             Then the user verifies the bag reflects updated quantities and totals (including bag icon update)

        # Additional steps (optional)
             When the user edits the Qty dropdown value for "{productName}" to "{quantity}"
             Then the user verifies the Qty dropdown reflects "{quantity}"
              And the Subtotal and Total text and amounts update accordingly
             When the user clicks on the Delete Icon button for "{productNameToBeRemoved}"
             Then a toast message "You removed an item from your bag." is displayed for 2 seconds
             Then the user verifies "{productNameToBeRemoved}" is no longer visible in the bag

        # Optional Verifications
             Then the user verifies the Estimated Shipping text and amount
             Then the user verifies the "CHECKED OUT SECURELY" button is visible
             Then the user verifies the "PEOPLE ALSO BOUGHT" heading is visible with product displays

        # Remove all products
             When the user clicks on the Delete Icon button for each product in the bag
             Then a toast message "You removed an item from your bag." is displayed for 2 seconds
             Then the user verifies the product is no longer visible in the bag

        # Verify empty bag state
             Then the user verifies the "Your bag is empty" heading is visible
             Then the user verifies the "There are no products in your bag" heading is visible
             Then the user verifies the "SHOP MENS" button is visible
             Then the user verifies the "SHOP WOMENS" button is visible

        Examples:
                  | Product Category | Expected URL                                                                      | firstProductName       | secondProductName (optional) | thirdProductName (optional) |
                  | Long Sleeve      | https://uk.gymshark.com/collections/t-shirts-tops/womens?collections=long-sleeve  | Rib Long Sleeve Top    | Fleece Zip Hoodie            | Sports Bra                  |
                  | Short Sleeve     | https://uk.gymshark.com/collections/t-shirts-tops/womens?collections=short-sleeve | Vital Seamless T-Shirt | Training T-Shirt             | Tank Top                    |
                  | Vests            | https://uk.gymshark.com/collections/t-shirts-tops/womens?collections=vests        | Utility Vest           | Chimera Sports Bra           | Breathable Vest             |
