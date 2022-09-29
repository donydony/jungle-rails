/// <reference types="cypress" />

describe('example to-do app', () => {
  beforeEach(() => {
    cy.visit('localhost:3000')
    cy .get('img[alt="Scented Blade"]').click()
  })

  it("There should be a product details page containing Scented Blade", () => {
    cy.get(".product-detail").within(() => {
      cy.get("h1").should("have.text", "Scented Blade");
    })
  });
})