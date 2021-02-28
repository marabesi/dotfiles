const { exec } = require('child_process')

module.exports = async function (command) {
  return new Promise((resolve, reject) => {
    exec(command, function(error, stdout, stderr) {
      if (error) {
        return reject(`${ stderr } trying to execute ${command}`)
      }

      return resolve(stdout)
    })
  })
}