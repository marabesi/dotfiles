const proxy = require('proxyquire')
const chai = require('chai')
const AssetsManager = require('../../src/assets/Manager')

const expect = chai.expect

const randomPath = '/bar/foo'

describe('assets manager', function () {
  it('false if the directory does not exists', () => {
    const fs = proxy('fs', {})

    fs.stat = function (path, callback) {
      return callback(true, null)
    }

    const manager = new AssetsManager()

    expect(manager.directoryExists(randomPath)).to.equal(false)
  })

  it('true if the directory exists', () => {
    const fs = proxy('fs', {})

    fs.stat = function (path, callback) {
      return callback(false, null)
    }

    const manager = new AssetsManager()

    expect(manager.directoryExists(randomPath)).to.equal(true)
  })
})