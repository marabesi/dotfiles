class Ulaucher {
  #title;
  #description;

  constructor() {
    this.#title = 'ulauncher for gnome'
    this.#description = 'Improves your productivity through keyboard and ulauncher extension'
  }

  get title() {
    return this.#title
  }

  get description() {
    return this.#description
  }
}

module.exports = Ulaucher