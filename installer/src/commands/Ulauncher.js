class Ulaucher {
  #description;

  constructor() {
    this.#description = 'ulauncher for gnome'
  }

  get description() {
    return this.#description
  }
}

module.exports = Ulaucher