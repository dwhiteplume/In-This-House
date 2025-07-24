# GetInThisHouse.ps1

A PowerShell script that generates stylized ASCII art memes in the format of "In this house, we..." with custom affirmations framed by playful top and bottom art blocks.

---

## 📋 Synopsis

`GetInThisHouse.ps1` creates an ASCII meme featuring a user-defined message framed by decorative "house rules"-style artwork. Great for command-line flair, dev team declarations, or personal affirmation.

---

## 🧰 Parameters

### `-message`  
`[string]` — The custom message you'd like displayed between the ASCII frames.  
**Default:** `'MESSAGE'`

### `-maxLength`  
`[int]` — Defines the maximum allowed character count of the full meme, including frames.  
**Default:** `300`

If the message and frames exceed this limit, the script throws an error displaying the final character count.

---

## ▶️ Examples

```pwsh
# Basic usage with default message
.\GetInThisHouse.ps1

# Custom message using default max length
.\GetInThisHouse.ps1 -message "Respect Brittney Sykes' perimeter defense"

# Custom message with a longer length allowance
.\GetInThisHouse.ps1 -message "Stef Dolson’s screens are law" -maxLength 500

# Output result to a text file
.\GetInThisHouse.ps1 -message "Trust Shakira Austin in the paint" | Out-File meme.txt
