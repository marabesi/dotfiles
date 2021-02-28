const proxy = require('proxyquire').noPreserveCache()
const chai = require('chai')
const spies = require('chai-spies')

chai.use(spies)

const expect = chai.expect

const invokeOsPath = '../../src/InvokeOs'
const childProcess = 'child_process'

describe('invoke os commands', function () {
  it(`should invoke whoami command`, async function () {
    const child = proxy(childProcess, {})

    child.exec = (command, callback) => {
      return callback(false, 'root')
    }

    const InvokeOs = require(invokeOsPath)

    const output = await InvokeOs('whoami')
    expect(output).to.equal('root')
  })

  it('should reject on command error', async function () {
    proxy(childProcess, {
      exec: (command, callback) => {
        return callback(true, null, 'my error')
      }
    })

    const InvokeOs = require(invokeOsPath)

    try {
      await InvokeOs('falty command')
    } catch (error) {
      expect(error).to.equal('my error trying to execute falty command')
    }
  })
})