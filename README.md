# Python Starter using pip and nix

## 🏗️ Prerequisites

- [nix](https://nix.dev/tutorials/install-nix)
- [direnv](https://direnv.net/docs/installation.html)

Setup direnv with [shell](https://direnv.net/docs/hook.html)

Run `direnv allow`

## 🚧 Dependencies

Every runtime dependencies are defined in the `shell.nix` file.

- python (`~> 3.10.5`)
- pip (`~> 22.2.2`)

> you might get a notice new release of pip available, you can safely upgrade if you want.

---

#### To install dependencies add packages in requirements.txt

- `pip install -r requirements.txt`

#### Using setuptools and have setuptools.py

- `pip install -e .`

---

## PS: As per ChatGPT, using pip with nix isn't ideal.

---

Inspired by [@rakshans1/python-starter](github.com/rakshans1/python-starter)
