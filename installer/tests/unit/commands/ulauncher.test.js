const expect = require('chai').expect
const Ulauncher = require('../../../src/commands/Ulauncher')

describe('ulauncher command', () => {

  it('should display ulauncher command title', () => {
    const ulauncher = new Ulauncher()
    expect(ulauncher.title).to.equal('ulauncher for gnome')
  })

  it('should display ulauncher command description', () => {
    const ulauncher = new Ulauncher()
    expect(ulauncher.description).to.equal('Improves your productivity through keyboard and ulauncher extension')
  })
})