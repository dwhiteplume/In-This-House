# 🏠 In This House Meme Generator

Create bold declarations framed in cheeky ASCII art! Whether you're expressing admiration for clutch screens, lockdown defense, or just enforcing house rules with flair, this meme generator delivers your message with maximum charm.

## 📦 Overview

This project provides several implementations of the "In This House, We…" meme generator across multiple languages:

- 🧑‍💻 PowerShell: `GetInThisHouse.ps1`
- 🐪 Perl: `get_in_this_house.pl`
- 🐍 Python: `get_in_this_house.py`
- 🐚 Bash: `get_in_this_house.sh`
- 🌐 HTML/JavaScript: [`inThisHouse.html`](https://dwhiteplume.github.io/inThisHouse.html) — hosted version

Each version frames a custom message between two stylized ASCII banners and ensures the output doesn't exceed a configurable character length.

## 🛠 Features

- Customizable message (default: `"MESSAGE"`)
- Configurable character limit (default: `300`)
- Stylish ASCII framing
- Command-line and browser support
- Error handling for overly enthusiastic affirmations 💥

## 🔧 Usage

### PowerShell

```
.\GetInThisHouse.ps1 -message "Stef Dolson’s screens are law"
.\GetInThisHouse.ps1 -message "Respect perimeter defense" -maxLength 500
```

### Perl

```
perl get_in_this_house.pl --message "We do not slack off in this house" --max-length 400
```

### Python

```
python3 get_in_this_house.py -m "All threes are contested" -l 300
```

### Bash

```
./get_in_this_house.sh -m "Cherish the entry pass" -l 400
```

### Web Version

You can try the meme generator instantly via your browser:

👉 [In This House Meme Generator](https://dwhiteplume.github.io/inThisHouse.html) — no setup required!

Just type your message, set the length limit, and hit **Generate**. The meme will appear in the textarea below.

## 📂 Output Example

```
┏┓
┃┃╱╲in
┃╱╱╲╲this
╱╱╭╮╲╲house
▔▏┗┛▕▔ we
╱▔▔▔▔▔▔▔▔▔▔╲
Respect Brittney Sykes' perimeter defense
╱╱┏┳┓╭╮┏┳┓ ╲╲
▔▏┗┻┛┃┃┗┻┛▕▔
```

## 🚨 Length Check

Each implementation validates that the final meme (including newlines and framing) stays under the specified length. If exceeded, an error message tells you exactly how much sass is too much.

## 🤹‍♂️ Fun Fact

The meme format was inspired by real-world "In this house we…" signs—except now your declarations can be programmable, whimsical, and loud enough to echo across terminal windows and browsers alike.

---

Let the affirmations flow, and remember: in this house, we declare boldly.
