/// <reference types="cypress" />

describe('example to-do app', () => {
  beforeEach(() => {
    cy.visit('localhost:3000')
  })

  it("After clicking 'Add to Cart' button on a product that has quantity >= 1, the cart counter should increase by 1", () => {
    cy.get("a[href='/cart']").should("contain.text", "0");

    cy.get('form[action="/cart/add_item?product_id=48"]').within(() => {
      cy.get('button').click({force: true})
    });

    cy.get("a[href='/cart']").should("contain.text", "1");
  });
})