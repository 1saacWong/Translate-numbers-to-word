require('pry')
require('rspec')
require('numbers_to_words')

  describe('String#numbers_to_words') do
      it("return 123") do
        expect(("10987654321").numbers_to_words()).to(eq(" ten Billion Nine Hundred eighty seven million six hundred fifty four thousand three hundred twenty one "))
      end
  end
