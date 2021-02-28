const expect = require('chai').expect
const Ulauncher = require('../../../src/commands/Ulauncher')

describe('ulauncher command', () => {

  it('should display ulauncher command description', () => {
    const ulauncher = new Ulauncher()
    expect(ulauncher.description).to.equal('ulauncher for gnome')
  })
})