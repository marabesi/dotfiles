const fs = require('fs')

class Manager {
  directoryExists(path) {
    const exists = fs.stat(path, function(error, stat) {
      if (error) {
        return false
      }

      return true
    })

    return exists
  }
}

module.exports = Manager